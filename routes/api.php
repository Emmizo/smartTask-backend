<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\ProjectController;



Route::group(['namespace' => 'Api', 'prefix' => 'v1'], function () {
Route::post('signup', [AuthController::class, 'signUp']);
Route::post('login', [AuthController::class, 'login']);
Route::get('getAllUsers', [AuthController::class, 'getAllUsers']);
Route::get('getAllTags', [TaskController::class,'getTags']); // Get all tags
});

Route::group(['namespace' => 'Api', 'prefix' => 'v1','middleware' => 'auth:api'], function () {
    Route::get('users', [AuthController::class, 'getUsers']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('createTask', [TaskController::class, 'store']);

    Route::get('/projects', [ProjectController::class, 'index']);
    Route::post('/create_projects', [ProjectController::class, 'store']);
    Route::get('/projects/{id}', [ProjectController::class, 'show']);
    Route::put('/projects/{id}', [ProjectController::class, 'update']);
    Route::delete('/projects/{id}', [ProjectController::class, 'destroy']);


        // Get all tasks of authenticated user
        Route::get('/tasks', [TaskController::class, 'index']);
        Route::post('/createTask', [TaskController::class, 'store']); // Create a new task
        Route::get('/tasks/{task}', [TaskController::class, 'show']); // Get a single task
        Route::put('/tasks/{task}', [TaskController::class, 'update']); // Update a task
        Route::delete('/tasks/{task}', [TaskController::class, 'destroy']); // Delete a task


});
