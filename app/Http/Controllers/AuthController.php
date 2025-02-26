<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\HasApiTokens;


class AuthController extends Controller
{

    // User registration
     /**
 * @OA\Post(
 *     path="/api/signup",
 *     operationId="signup",
 *     tags={"Authentication and registration"},
 *     summary="User login",
 *     description="can be User sign up and JWT token generation",
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"name","email","password","password_confirmation"},
 *             @OA\Property(property="name", type="string"),
 *             @OA\Property(property="email", type="string", format="email"),
 *             @OA\Property(property="password", type="string", format="password"),
 *             @OA\Property(property="password_confirmation", type="string", format="password")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Successful login with JWT token",
 *         @OA\JsonContent(
 *             @OA\Property(property="access_token", type="string"),
 *             @OA\Property(property="token_type", type="string"),
 *             @OA\Property(property="expires_in", type="integer")
 *         )
 *     ),
 *     @OA\Response(
 *         response=401,
 *         description="Unauthorized"
 *     )
 * )
 */
    public function signUp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = new User();
            $user->first_name = $request->first_name;
            $user->last_name = $request->last_name;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->save();
        // Generate Passport token
        $token = $user->createToken('AuthToken')->accessToken;

        return response()->json([
            'user' => $user,
            'token' => $token
        ], 201);
    }

    // User login

     /**
     * @OA\Post(
     *     path="/api/login",
     *     operationId="login",
     *     tags={"Authentication"},
     *     summary="User login",
     *     description="User login and JWT token generation",
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"email","password"},
     *             @OA\Property(property="email", type="string", format="email"),
     *             @OA\Property(property="password", type="string", format="password")
     *         ),
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful login with JWT token",
     *         @OA\JsonContent(
     *             @OA\Property(property="access_token", type="string"),
     *             @OA\Property(property="token_type", type="string"),
     *             @OA\Property(property="expires_in", type="integer")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized"
     *     )
     * )
     */
    public function login(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $Authorized = User::where('email', $request->email)->where('status',1)->first();
        $user = User::where('email', $request->email)->first();
        if(!$user){

        $response = ["message" =>'User does not exist','status'=>404,'success' => false];
            return response([$response, 404]);
        }else{
            if ($Authorized) {
         if (Hash::check($request->password, $user->password)) {
            $token = $user->createToken('Laravel Password Grant Client')->accessToken;

            $response = [
                'user' => [
                    "id"=> $user->id,
                    "first_name" => $user->first_name,
                    "last_name" => $user->last_name,
                    "email" =>$user->email,
                    "status" => $user->status,

                    ],
                'token' => $token,
                'success' => true,
                'status' => 200,
            ];

            return response()->json([$response]);
        } else {

            $response = ["message" => "Password mismatch",'success' => false,"status"=>401];
            return response([$response]);
        }
    } else {


        $response = ["message" =>'Your not allowed to access','success' => false,"status"=>401];
        return response([$response, 401]);
    }}
        //
    }
    /**
     * @OA\Get(
     *     path="/api/users",
     *     operationId="getUsers",
     *     tags={"Users"},
     *     summary="Get list of users",
     *     description="Returns list of users",
     *     @OA\Response(
     *         response=200,
     *         description="Successful operation",

     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized",
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Resource Not Found",
     *     ),
     *     security={{"bearerAuth":{}}}
     * )
     */
    public function getUsers()
    {
        $domain = config('app.url');
        $user = User::where('id',auth()->user()->id)->first();
        $response = [
            'user' => [
                "id"=> $user->id,
                "first_name" => $user->first_name." ".$user->last_name,
                "fovorite_name" => $user->last_name,
                "email" =>$user->email,
                "profile_picture" => $user->profile_picture,


                "status" => $user->status,

                ],
            'base_url' => $domain,
            'success' => true,
            "status"=> 200,
        ];
        return response()->json([$response]);
    }

    // User logout
     /**
     * @OA\Post(
     *     path="/api/logout",
     *     operationId="logout",
     *     tags={"Logout"},
     *     summary="User logout",
     *     description="User logout and JWT token generation",
     *     @OA\RequestBody(
     *         required=false,
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful logout",
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized"
     *     ),
     *     security={{"bearerAuth":{}}}
     * )
     */
    public function logout()
    {
        JWTAuth::invalidate(JWTAuth::getToken());

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function getAllUsers(){
        $users = User::all();
        return response()->json($users);
    }
}
