<?php
namespace App\Http\Controllers;

use App\Models\Task;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class TaskController extends Controller
{
    public function index()
    {
        $today = Carbon::today()->toDateString();
        $tasks = \DB::table('tasks')
            ->join('projects', 'tasks.project_id', '=', 'projects.id')
            ->join('statuses', 'tasks.status_id', '=', 'statuses.id')
            ->whereDate('tasks.created_at', $today)
            ->orWhereDate('tasks.updated_at', $today)
            ->orderBy('tasks.created_at', 'desc')
            ->select(
                'tasks.*',
                'statuses.name as status',
                'projects.id as project_id',
                'projects.name as project_name',
                'projects.created_at as project_created_at',
                'projects.updated_at as project_updated_at'
            )
            ->get();

        foreach ($tasks as $task) {
            // Fetch user details
            $user = \DB::table('users')
                ->where('id', $task->user_id)
                ->first();

            // Fetch tags related to the task
            $tags = \DB::table('task_tags')
                ->where('task_id', $task->id)
                ->get();

            // Assign user/team details
            $task->team = $user ? [[
                'id' => $user->id,
                'first_name' => $user->first_name,
                'last_name' => $user->last_name,
                'profile_picture' => $user->profile_picture == null ? '' : config('app.url') . '/' . $user->profile_picture,
                'url' => config('app.url'),
            ]] : [];

            // Assign tags to the task
            $task->tags = $tags->flatMap(function ($tag) {
                if (isset($tag->tag_id)) {
                    $tagIds = explode(',', trim($tag->tag_id, '[""]'));  // Properly decode JSON

                    return \DB::table('tags_for_tasks')
                        ->whereIn('id', $tagIds)
                        ->orderBy('tag_name', 'asc')
                        ->get()
                        ->map(function ($tag) {
                            return [
                                'id' => $tag->id,
                                'tag_name' => $tag->tag_name,
                            ];
                        });
                }
                return [];
            });
        }

        return response()->json(['data' => $tasks, 'status' => 200], 200);
    }

    public function allTasks()
    {
        $tasks = \DB::table('tasks')
            ->join('projects', 'tasks.project_id', '=', 'projects.id')
            ->join('statuses', 'tasks.status_id', '=', 'statuses.id')
            ->orderBy('tasks.updated_at', 'desc')
            ->select(
                'tasks.*',
                'statuses.name as status',
                'statuses.id as status_id',
                'projects.id as project_id',
                'projects.name as project_name',
                'projects.created_at as project_created_at',
                'projects.updated_at as project_updated_at'
            )
            ->get();

        foreach ($tasks as $task) {
            // Fetch user details
            $user = \DB::table('users')
                ->where('id', $task->user_id)
                ->first();

            // Fetch tags related to the task
            $tags = \DB::table('task_tags')
                ->where('task_id', $task->id)
                ->get();

            // Assign user/team details
            $task->team = $user ? [[
                'id' => $user->id,
                'first_name' => $user->first_name,
                'last_name' => $user->last_name,
                'profile_picture' => $user->profile_picture == null ? '' : config('app.url') . '/' . $user->profile_picture,
                'url' => config('app.url'),
            ]] : [];

            // Assign tags to the task
            $task->tags = $tags->flatMap(function ($tag) {
                if (isset($tag->tag_id)) {
                    $tagIds = explode(',', trim($tag->tag_id, '[""]'));  // Properly decode JSON

                    return \DB::table('tags_for_tasks')
                        ->whereIn('id', $tagIds)
                        ->orderBy('tag_name', 'asc')
                        ->get()
                        ->map(function ($tag) {
                            return [
                                'id' => $tag->id,
                                'tag_name' => $tag->tag_name,
                            ];
                        });
                }
                return [];
            });
        }

        return response()->json(['data' => $tasks, 'status' => 200], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'status_id' => 'required|in:1,2,3',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
            'tag_id' => 'required|exists:tags,id',
            'due_date' => 'nullable|date',
            // 'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }

        // Insert Task
        $task = Task::create([
            'user_id' => $request->user_id,
            'project_id' => $request->project_id,
            /* 'tag_id[]' => $request->tag_id, */
            'title' => $request->title,
            'description' => $request->description,
            'status_id' => $request->status_id,
            // 'image' => $imagePath,
            'due_date' => $request->due_date,
        ]);

        $tags = \DB::insert('insert into task_tags (task_id, tag_id) values (?, ?)', [$task->id, json_encode($request->tag_id)]);

        return response()->json(['msg' => 'new task created', 'id' => $task->id, 'status' => 200], 200);
    }

    public function update(Request $request)
    {
        // Validate the request
        $validator = Validator::make($request->all(), [
            'task_id' => 'required|exists:tasks,id',  // Ensure the task exists
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'status_id' => 'required|in:1,2,3',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
            'tag_id.*' => 'exists:tags,id',  // Validate each tag_id in the array
            'due_date' => 'nullable|date',
        ]);

        // Return validation errors if any
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }

        // Find the task to update
        $task = Task::find($request->task_id);
        if (!$task) {
            return response()->json(['msg' => 'Task not found'], 404);
        }

        // Update the task details
        $task->update([
            'user_id' => $request->user_id,
            'project_id' => $request->project_id,
            'title' => $request->title,
            'description' => $request->description,
            'status_id' => $request->status_id,
            'due_date' => $request->due_date,
        ]);

        // Update the task tags
        // First, delete existing tags for the task
        \DB::table('task_tags')->where('task_id', $request->task_id)->delete();

        $tags = \DB::insert('insert into task_tags (task_id, tag_id) values (?, ?)', [$task->id, json_encode($request->tag_id)]);

        // Return success response
        return response()->json([
            'msg' => 'Task updated successfully',
            'status' => 200,
        ], 200);
    }

    // show
    /*  public function show(Task $task)
     {
         $this->authorize('view', $task);
         return response()->json($task->load('tags'));
     } */

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

    public function getTags()
    {
        $tags = \DB::table('tags')->get();
        return response()->json($tags);
    }

    public function getTaskTags()
    {
        $tags = \DB::table('tags_for_tasks')->get();
        return response()->json($tags);
    }

    public function deleteTask(Request $request)
    {
        $taskId = $request->task_id;
        $task = Task::find($taskId);

        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }

        // Fixed missing $ before task->id
        $del = \DB::table('task_tags')->where('task_id', $task->id)->delete();
        $task->delete();

        return response()->json(['message' => 'Task deleted successfully']);
    }
}
