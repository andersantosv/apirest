<?php
namespace App\Helpers;

use Firebase\JWT\JWT;
use Illuminate\Support\Facades\DB;
use App\User;

/**
 * 
 */
class JwtAuth{
	public $key;

	public function __construct(){
		$this->key = 'serect-key-silence-is-golden-123456';
	}
	
	public function signup($email, $password, $getToken=null)
	{
		$user = User::where(
			array(
				'email' => $email,
				'password' => $password,
				'status' => '1' 
			))->first();

		//print_r($this->key); die();

		if (is_object($user)) {
			$token = array(
				'sub' => $user->id,
				'name' => $user->name,
				'last_name' => $user->last_name,
				'email' => $user->email,
				'iat' => time(),
				'exp' => time() + (7 * 24 * 60 * 60)
				);
			$jwt = JWT::encode($token, $this->key, 'HS256');
			$decoded = JWT::decode($jwt, $this->key, array('HS256'));

			if (!is_null($getToken)) {
				return $jwt;
			}else{
				return $decoded;
			}
		}

		$data = array(
			'status' => 'error',
			'message' => 'Login ha fallado'
		);
		return $data;
	}

	public function checkToken($jwt, $getIdentity = false){
		$auth = false;
		try {
			$decoded = JWT::decode($jwt, $this->key,array('HS256'));
		} catch (\UnexpectedValueException $e) {
			$auth = false;
		} catch (\DomainException $e){
			$auth = false;
		}

		if (isset($decoded) && is_object($decoded) && isset($decoded->sub)) {
			$auth = true;
		}else{
			$auth = false;
		}

		if ($getIdentity) {
			return $decoded;
		}

		return $auth;
	}
}