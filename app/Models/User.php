<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Models\Team;
use Laravel\Passport\HasApiTokens;
;


/**
 * @OA\Schema(
 *     schema="User",
 *     title="User",
 *     description="User model",
 *     required={"id", "name", "email"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="name", type="string", example="John Doe"),
 *     @OA\Property(property="email", type="string", format="email", example="john@example.com"),
 *     @OA\Property(property="created_at", type="string", format="date-time"),
 *     @OA\Property(property="updated_at", type="string", format="date-time")
 * )
 */
class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens,HasFactory, Notifiable;

 /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable =
    ['first_name',
    "last_name",
    'email',
    'password',
    "status"];


 // User can be part of many tasks
 public function tasks(): BelongsToMany
 {
     return $this->belongsToMany(Task::class, 'task_team');
 }

 public function projects()
{
    return $this->belongsToMany(Project::class, 'project_team');
}


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
