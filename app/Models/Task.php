<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'title', 'description', 'status_id','tag_id', 'image','project_id', 'due_date'];


    // Get full image URL
    public function getImageUrlAttribute()
    {
        return $this->image ? Storage::url($this->image) : null;
    }


    //
}
