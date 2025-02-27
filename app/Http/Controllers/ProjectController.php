<?php
namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use App\Models\Status;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Carbon\Carbon;

class ProjectController extends Controller
{
    // Get all projects
    public function index() {
      $projects = Project::orderBy('created_at', 'desc')->get(); // Order projects by created_at

foreach ($projects as $project) {
    // Get the team (users) from the teams table for this project
    $teams = DB::table('teams')
        ->where('project_id', $project->id)
        ->get();
     $tags = DB::table('project_tags')
        ->where('project_id', $project->id)
        ->get();
    // Process each team and extract the users
    $project->team = $teams->map(function ($team) {
        if (isset($team->user_id)) {
            $userIds = explode(',', trim($team->user_id, '[""]'));

            $users = DB::table('users')
                ->whereIn('id', $userIds)
                ->orderBy('first_name', 'asc') // Order users by first name
                ->get();

            return $users->map(function ($user) {
                return [
                    'id' => $user->id,
                    'first_name' => $user->first_name,
                    'last_name' => $user->last_name,
                    'profile_picture' => $user->profile_picture,
                    'url' => config('app.url'),
                ];
            });
        }

        return [];
    });

    $project->tag = $tags->map(function ($tag) {
        if (isset($tag->tag_id)) {
            $tagIds = explode(',', trim($tag->tag_id, '[""]'));

            $tagss = DB::table('tags')
                ->whereIn('id', $tagIds)
                ->orderBy('name', 'asc') // Order users by first name
                ->get();

            return $tagss->map(function ($tag) {
                return [
                    'id' => $tag->id,
                    'tag_name' => $tag->name,
                ];
            });
        }

        return [];
    });

    // Get unique user IDs from project tasks
    $userIds = $project->tasks->pluck('user_id')->unique();
    $users = DB::table('users')->whereIn('id', $userIds)->get()->keyBy('id');

    // Fetch the tasks for the project and associate the users directly
    $project->tasks = $project->tasks
        ->sortByDesc('created_at') // Sort tasks by created_at
        ->map(function ($task) {
            $task->created_at = Carbon::parse($task->created_at)->format('Y-m-d H:i:s');
            $task->updated_at = Carbon::parse($task->updated_at)->format('Y-m-d H:i:s');

            $user = User::find($task->user_id);
            $task->user = $user ? $user->first_name . ' ' . $user->last_name : null;

            $status = Status::find($task->status_id);
            $task->status = $status ? $status->name : null;

            return $task;
        });


}

// Return the response with ordered projects, teams, tasks, and tags
return response()->json($projects);
    }

    // Create a project
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'deadline'=>'required|date',
            'user_id'=>'required',
            'tag_id'=>'required',


        ]);

        $project = Project::create([
            'name' => $request->name,
            'description' => $request->description,
            'owner_id' => Auth::id(),
            'deadline' => $request->deadline
        ]);
        if($project){
            $team = \DB::insert('insert into teams (project_id,user_id) values (?, ?)', [$project->id, json_encode($request->user_id)]);
            $tag = \DB::insert('insert into project_tags (project_id,tag_id) values (?, ?)', [$project->id, json_encode($request->tag_id)]);
        }
        return response()->json(['success'=>'created new project','status'=>201], 201);
    }

    // Get a single project
    public function show($id)
    {
        $project = Project::with(['owner', 'users', 'tasks'])->find($id);
        if (!$project) {
            return response()->json(['message' => 'Project not found'], 404);
        }
        return response()->json($project);
    }

    // Update a project
    public function update(Request $request, $id)
    {
        $project = Project::find($id);
        if (!$project) {
            return response()->json(['message' => 'Project not found'], 404);
        }

        $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'description' => 'nullable|string',
            'users' => 'array',
            'users.*' => 'exists:users,id',
            'tasks' => 'array',
            'tasks.*' => 'exists:tasks,id'
        ]);

        $project->update($request->only(['name', 'description']));

        // Sync users (team members)
        if ($request->has('users')) {
            $project->users()->sync($request->users);
        }

        // Sync tasks
        if ($request->has('tasks')) {
            $project->tasks()->sync($request->tasks);
        }

        return response()->json($project->load('users', 'tasks'));
    }

    // Delete a project
    public function destroy($id)
    {
        $project = Project::find($id);
        if (!$project) {
            return response()->json(['message' => 'Project not found'], 404);
        }

        $project->delete();
        return response()->json(['message' => 'Project deleted successfully']);
    }

    public function getProject(){
        $projects = Project::all();
        return response()->json($projects);
    }
}
