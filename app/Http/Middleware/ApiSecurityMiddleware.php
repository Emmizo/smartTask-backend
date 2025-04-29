<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Closure;

class ApiSecurityMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Check if token exists in the request
        if (!$request->hasHeader('X-API-TOKEN')) {
            Log::warning('API Request failed: No token provided', [
                'ip' => $request->ip(),
                'endpoint' => $request->path(),
                'method' => $request->method()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Authentication failed',
                'errors' => ['token' => 'API token is required']
            ], 401);
        }

        // If token exists but is invalid
        if (!$this->validateToken($request->header('X-API-TOKEN'))) {
            Log::warning('API Request failed: Invalid token', [
                'ip' => $request->ip(),
                'endpoint' => $request->path(),
                'method' => $request->method()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Authentication failed',
                'errors' => ['token' => 'Invalid API token']
            ], 401);
        }

        // Log successful authentication
        Log::info('API Request authenticated', [
            'ip' => $request->ip(),
            'endpoint' => $request->path(),
            'method' => $request->method(),
            'user_agent' => $request->userAgent()
        ]);

        $response = $next($request);

        return $response;
    }

    private function validateToken($token)
    {
        // Implement your token validation logic here
        return true;  // Simplified for example
    }
}
