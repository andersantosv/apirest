<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\JwtAuth;
use Illuminate\Support\Facades\DB;
use App\User;

class UserController extends Controller
{
    public function register(Request $request)
    {
     	$json  = $request->input('json',null);
     	$params = json_decode($json);

     	$email = (!is_null($json) && isset($params->email)) ? $params->email : null;
		$name = (!is_null($json) && isset($params->name)) ? $params->name : null;
		$last_name = (!is_null($json) && isset($params->last_name)) ? $params->last_name : null;
		$password = (!is_null($json) && isset($params->password)) ? $params->password : null;
		$status = '1';

		$estado = 'error';
		$code = 400;
		$message = 'Usuario no creado';

		if (!is_null($email) && !is_null($password) && !is_null($name)) {
			$user = new User();
			$user->name = $name;
			$user->last_name = $last_name;
			$user->email = $email;
			$pwd = hash('sha256', $password);
			$user->password = $pwd;
			$user->status = $status;

			$isset_user = User::where('email','=',$email)->first();
			if (!$isset_user) {
				$user->save();
				$estado = 'success';
				$code = 200;
				$message = 'Usuario creado correctamente';
				
			}else{
				$message = 'Usuario duplicado';
			}
		}
		$data = array(
			'status' =>$estado,
			'code' =>$code,
			'message' => $message
		);

		return  response()->json($data, 200);
    }
    public function login(Request $request)
    {
     	$jwtAuth = new JwtAuth();

     	$json = $request->input('json', null);
     	$params = json_decode($json);

     	$email = (!is_null($json) && isset($params->email)) ? $params->email : null;
     	$password = (!is_null($json) && isset($params->password)) ? $params->password : null;
     	$getToken = (!is_null($json) && isset($params->gettoken)) ? $params->gettoken : null;

     	$pwd = hash('sha256',$password);

     	if (!is_null($email) && !is_null($password) && ($getToken == null || $getToken == 'false') ) {
     		$signup = $jwtAuth->signup($email, $pwd);
     	}elseif ($getToken!=null) {
     		$signup = $jwtAuth->signup($email, $pwd, $getToken);
     	}else{
     		$signup = array(
     			'status' => 'error', 
     			'message' => 'Envia tus datos por post'
     			);
     	}

     	return response()->json($signup, 200);
    }
}
