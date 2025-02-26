<?php
namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class TaskController extends Controller
{


    public function index()
{
    $today = Carbon::today()->toDateString();

    // Fetch tasks created or updated today with their associated projects
    $tasks = \DB::table('tasks')
        ->join('projects', 'tasks.project_id', '=', 'projects.id')
        ->whereDate('tasks.created_at', $today)
        ->orWhereDate('tasks.updated_at', $today)
        ->orderBy('tasks.created_at', 'desc')
        ->select(
            'tasks.*',
            'projects.id as project_id',
            'projects.name as project_name',
            'projects.created_at as project_created_at',
            'projects.updated_at as project_updated_at'
        )
        ->get();

    foreach ($tasks as $task) {
        \Log::info('Processing task:', ['task_id' => $task->id, 'user_id' => $task->user_id]);

        // Get the specific user who matches the task's user_id
        $user = \DB::table('users')
            ->where('id', $task->user_id)
            ->first();

        if ($user) {
            $task->team = [
                [
                    'id' => $user->id,
                    'first_name' => $user->first_name,
                    'last_name' => $user->last_name,
                    'profile_picture' => $user->profile_picture,
                    'url' => config('app.url'),
                ]
            ];
            \Log::info('Found user for task:', ['task_id' => $task->id, 'user_id' => $user->id]);
        } else {
            $task->team = [];
            \Log::info('No user found for task:', ['task_id' => $task->id, 'user_id' => $task->user_id]);
        }
    }

    return response()->json(['data' => $tasks, 'status' => 200], 200);
}

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'status_id' => 'required|in:1,2,3',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
            'tag_id' => 'required|exists:tags,id',
            'due_date' => 'nullable|date',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',



        ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }
        // Upload Image (if exists)
        $directory = public_path().'/task_images';
    if (!is_dir($directory)) {
        mkdir($directory);
        chmod($directory, 0777);
    }
    $imageName = strtotime(date('Y-m-d H:i:s')) . '-' . str_replace(' ', '-', $request->file('image')->getClientOriginalName());
    $request->file('image')->move($directory, $imageName);
    $imagePath = 'task_images/'.$imageName;


    // Insert Task
    $task = Task::create([
        'user_id' => $request->user_id,
        'project_id' => $request->project_id,
        'tag_id' => $request->tag_id,
        'title' => $request->title,
        'description' => $request->description,
        'status_id' => $request->status_id,
        'image' => $imagePath,
        'due_date' => $request->due_date,
    ]);

    $tags = \DB::insert('insert into task_tag (task_id, tag_id) values (?, ?)', [$task->id, $request->tag_id]);

    return response()->json(['new task created'], 201);
    }

    public function show(Task $task)
    {
        $this->authorize('view', $task);
        return response()->json($task->load('tags'));
    }

    public function update(Request $request, Task $task)
    {
        $this->authorize('update', $task);

        $request->validate([
            'title' => 'sometimes|string|max:255',
            'description' => 'nullable|string',
            'priority' => 'sometimes|in:Normal,Medium,High',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'tag_id' => 'array',

        ]);

        // Handle Image Upload
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($task->image) {
                Storage::disk('public')->delete($task->image);
            }
            $task->image = $request->file('image')->store('task_images', 'public');
        }

        $task->update($request->except(['tags', 'image']));

        if ($request->has('tags')) {
            $task->tags()->sync($request->tags);
        }

        return response()->json($task->load('tags'));
    }

    public function destroy(Task $task)
    {
        $this->authorize('delete', $task);

        // Delete Image
        if ($task->image) {
            Storage::disk('public')->delete($task->image);
        }

        $task->delete();
        return response()->json(['message' => 'Task deleted']);
    }
    public function getTags(){
        $tags = \DB::table('tags')->get();
        return response()->json($tags);
    }
}
