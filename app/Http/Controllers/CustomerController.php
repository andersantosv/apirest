<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Helpers\JwtAuth;
use App\Customer;
use App\ExpectancyLife;
use Carbon\Carbon;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
    	$customers = Customer::all();
    	return response()->json(array(
    		'customers' => $customers,
    		'status' => 'success'
    	), 200);
    }

    public function show($id){
    	$customer = Customer::find($id);
    	return response()->json(array('customer' =>$customer,'status' => 'success'), 200);
    }

    public function averageAge(Request $request){
    	$customers = Customer::all()->toArray();
    	$average = $this->_getAverage($customers);
    	$average = number_format($average, 2);
    	return response()->json(array('average_age' =>$average,'status'=>'success' ),200);
    }

    public function standardDeviationAge(Request $request){
    	$customers = Customer::all()->toArray();
    	$average = $this->_getAverage($customers);
    	$ncustomers =  count($customers);
    	$variance= 0;
    	$standardDeviation = 0;

    	if ($ncustomers > 0) {
			$sumSquare=0;
			foreach ($customers as $customer) {
				$sumSquare+=pow($customer['age'] - $average,2);
			}
			$variance = $sumSquare / $ncustomers;
			$standardDeviation = sqrt($variance);
			$standardDeviation = number_format($standardDeviation, 2);
    	}
    	return response()->json(array('standard_deviation_age' =>$standardDeviation,'status'=>'success' ),200);
    }

    public function expectancyLife(){
    	$customers = Customer::all()->toArray();
    	$expectancyLife = ExpectancyLife::all()->toArray();
    	$listCustomer = [];
    	foreach ($customers as $customer) {
    		$date = Carbon::now();
    		$key = array_search($customer['age'], array_column($expectancyLife, 'age'));
    		if (!is_null($key)) {
    			$years = $expectancyLife[$key]['expectancy'];
    			$deathday = $date->addYear($years); 
    			$deathday = $deathday->format('Y-m-d');
    		}else{
    			$deathday = 'Inmortal';
    		}
    		$listCustomer[] = array(
    			'name' => $customer['name'],
    			'last_name' => $customer['last_name'],
    			'age' => $customer['age'],
    			'birthday' => $customer['birthday'],
    			'deathday' => $deathday
    		);

    	}
    	return response()->json(array('customers' =>$listCustomer,'status'=>'success' ),200);
    }

    public function store(Request $request){
    	$hash = $request->header('Authorization', null);
    	$jwtAuth = new JwtAuth();
    	$checkToken = $jwtAuth->checkToken($hash);

    	if ($checkToken) {
    		$json = $request->input('json',null);
    		$params = json_decode($json);
    		$params_array = json_decode($json, true);

    		$request->merge($params_array);
    	
     		$validate = \Validator::make($params_array,[
    			'name' => 'required|min:5',
    			'last_name' => 'required',
    			'age' => 'required',
    			'birthday' => 'required'
    		]);   	

    		if ($validate->fails()) {
    			return response()->json($validate->errors(), 400);
    		}		

    		$customer = new Customer();
    		$customer->name =$params->name;
    		$customer->last_name =$params->last_name;
    		$customer->age =$params->age;
    		$customer->birthday =$params->birthday;
    		$customer->status = '1';
    		$customer->save();

    		$data = array(
    			'customer' => $customer,
    			'status' => 'success',
    			'code' => 200
    		);
    	}else{
    		$data = array(
    			'message' => 'Registro ha fallado',
    			'status' => 'error',
    			'code' => 400
    		);
    	}

    	return response()->json($data, 200);

    }

    private function _getAverage($data){
    	$average = 0;
    	$ndata =  count($data);
    	if ($ndata > 0) {
	    	foreach ($data as $item) {
	    		$average+=$item['age'];
	    	}
	    	$average = $average / $ndata;   		
    	}
    	return $average;
    }

}