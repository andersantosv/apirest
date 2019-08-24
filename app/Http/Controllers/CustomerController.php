<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Helpers\JwtAuth;
use App\Customer;

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
}
