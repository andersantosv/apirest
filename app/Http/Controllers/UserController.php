<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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
			if (count($isset_user) == 0) {
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
     	echo "Accion de login"; die();
    }
}
