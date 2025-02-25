<?php

namespace App\Http\Controllers;

/**
* @OA\Info(
*     title="Swagger documentation",
*     version="1.0.0",
* )
* @OA\SecurityScheme(
*     type="http",
*     securityScheme="bearerAuth",
*     scheme="bearer",
*     bearerFormat="JWT"
* )
*/
abstract class Controller
{
    //
}
