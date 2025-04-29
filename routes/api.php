<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Api', 'prefix' => 'v1'], function () {
    Route::post('signup', [AuthController::class, 'signUp']);
    Route::post('login', [AuthController::class, 'login']);
    Route::get('getAllUsers', [AuthController::class, 'getAllUsers']);
    Route::get('getAllTags', [TaskController::class, 'getTags']);
    Route::get('getTaskTags', [TaskController::class, 'getTaskTags']);
    Route::post('auth/{google}/callback', [AuthController::class, 'handleGoogleCallback']);
    Route::post('deleteTask', [TaskController::class, 'deleteTask']);
    Route::get('/auth/google', [AuthController::class, 'redirectToGoogle'])->name('google.login');
});
// TOTP Routes
Route::group(['namespace' => 'Api', 'prefix' => 'v1', 'middleware' => 'auth:api'], function () {
    Route::post('2fa/generate', [AuthController::class, 'generate2FASecret']);
    Route::post('2fa/verify', [AuthController::class, 'verify2FA']);
    Route::post('/disable-2fa', [AuthController::class, 'disable2FA']);
});
Route::group(['namespace' => 'Api', 'prefix' => 'v1', 'middleware' => 'auth:api'], function () {
    Route::get('users', [AuthController::class, 'getUsers']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('createTask', [TaskController::class, 'store']);

    Route::get('/projects', [ProjectController::class, 'index']);
    Route::post('/create_projects', [ProjectController::class, 'store']);
    Route::get('/projects/{id}', [ProjectController::class, 'show']);
    Route::put('/projects/{id}', [ProjectController::class, 'update']);
    Route::delete('/projects/{id}', [ProjectController::class, 'destroy']);
    Route::get('/listProjects', [ProjectController::class, 'getProject']);  // Get tasks for a project

    // Get all tasks of authenticated user
    Route::get('/tasks', [TaskController::class, 'index']);
    Route::get('allTasks', [TaskController::class, 'allTasks']);
    Route::post('/createTask', [TaskController::class, 'store']);  // Create a new task
    Route::get('/tasks/{task}', [TaskController::class, 'show']);  // Get a single task
    Route::post('/updateTask', [TaskController::class, 'update']);  // Update a task
    Route::delete('/tasks/{task}', [TaskController::class, 'destroy']);  // Delete a task
});
