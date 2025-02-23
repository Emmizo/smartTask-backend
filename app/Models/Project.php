<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Project extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'description', 'owner_id'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'teams', 'project_id', 'user_id');
    }

    public function tasks()
    {
        return $this->hasMany(Task::class);
    }

    // In User model
    public function projects()
    {
        return $this->belongsToMany(Project::class, 'teams', 'user_id', 'project_id');
    }
}
