<?php

namespace App\Http\Controllers;

use App\Models\FcmToken;
use App\Models\User;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    /**
     * Send FCM notification to a specific user
     */
    public function sendNotification(Request $request)
    {
        // Validate request
        $validated = $request->validate([
            'userId' => 'required|string',
            'notification.title' => 'required|string',
            'notification.body' => 'required|string',
            'data' => 'nullable|array',
        ]);

        // Find user's FCM tokens
        $tokens = FcmToken::where('user_id', $validated['userId'])->pluck('token')->toArray();

        if (empty($tokens)) {
            return response()->json(['message' => 'No FCM tokens found for this user'], 404);
        }

        // Prepare FCM message
        $message = [
            'notification' => [
                'title' => $validated['notification']['title'],
                'body' => $validated['notification']['body'],
            ],
            'data' => $validated['data'] ?? [],
            'registration_ids' => $tokens,  // Send to multiple devices of the same user
        ];

        // Send FCM message
        $result = $this->sendFcmMessage($message);

        // Store notification in database (optional)
        $this->storeNotification($validated['userId'], $validated['notification'], $validated['data'] ?? []);

        return response()->json(['message' => 'Notification sent', 'result' => $result]);
    }

    /**
     * Send FCM message using cURL
     */
    private function sendFcmMessage($message)
    {
        $headers = [
            'Authorization: key=' . config('services.fcm.key'),
            'Content-Type: application/json',
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($message));

        $result = curl_exec($ch);

        if ($result === FALSE) {
            \Log::error('FCM Send Error: ' . curl_error($ch));
        }

        curl_close($ch);
        return json_decode($result, true);
    }

    /**
     * Store notification in database (optional)
     */
    private function storeNotification($userId, $notification, $data)
    {
        // Create a notification record in your database
        // This is optional but useful for notification history
        \App\Models\Notification::create([
            'user_id' => $userId,
            'title' => $notification['title'],
            'body' => $notification['body'],
            'data' => json_encode($data),
            'read' => false,
        ]);
    }

    /**
     * Store user's FCM token
     */
    public function storeFcmToken(Request $request)
    {
        $validated = $request->validate([
            'token' => 'required|string',
        ]);

        $userId = auth()->id();

        // Store or update token
        FcmToken::updateOrCreate(
            ['token' => $validated['token']],
            ['user_id' => $userId, 'device_type' => $request->header('User-Agent')]
        );

        return response()->json(['message' => 'Token stored successfully']);
    }
}
