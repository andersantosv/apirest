<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Helpers\JwtAuth;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
    	$hash = $request->header('Authorization', null);
    	$jwtAuth = new JwtAuth();
    	$checkToken = $jwtAuth->checkToken($hash);
    	if ($checkToken) {
    		echo "Auth correcta";
    	}else{
    		echo "Auth incorrecta";
    	}
    }
}
