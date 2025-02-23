<?php
namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Carbon\Carbon;

class ProjectController extends Controller
{
    // Get all projects
    public function index() {
        $projects = Project::all();

        foreach ($projects as $project) {
            // Get the team (users) from the teams table for this project
            $teams = \DB::table('teams')
                ->where('project_id', $project->id)
                ->get();

            // Process each team and extract the users
            $project->team = $teams->map(function ($team) {
                // Check if the 'user_id' field exists
                if (isset($team->user_id)) {
                    // Parse the user IDs by removing unwanted characters and then exploding by comma
                    $userIds = explode(',', trim($team->user_id, '[""]'));

                    // Fetch the users directly from the users table using the extracted user IDs
                    $users = \DB::table('users')->whereIn('id', $userIds)->get();

                    // Return the users in the desired format (without user_id)
                    return $users->map(function ($user) {
                        return [
                            'id' => $user->id,
                            'first_name' => $user->first_name,
                            'last_name' => $user->last_name,
                        ];
                    });
                }

                // Return an empty array if 'user_id' field is not set
                return [];
            });


            $userIds = $project->tasks->pluck('user_id')->unique();
            $users = \DB::table('users')->whereIn('id', $userIds)->get()->keyBy('id');

            // Fetch the tasks for the project and associate the users directly
            $project->tasks = $project->tasks->map(function ($task) {
                // Format the date as before
                $task->created_at = Carbon::parse($task->created_at)->format('Y-m-d H:i:s');
                $task->updated_at = Carbon::parse($task->updated_at)->format('Y-m-d H:i:s');

                // Concatenate first_name and last_name to create full name
                $user = \App\Models\User::find($task->user_id);
                $task->user = $user ? $user->first_name . ' ' . $user->last_name : null; // Concatenate full name or set null if user is not found
                $status = \App\Models\Status::find($task->status_id);
                $task->status = $status ? $status->name : null; // Set status name or null if status is not found
                return $task;
            });
        }

        // Return the response with projects, teams, and tasks
        return response()->json($projects);
    }

    // Create a project
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',

        ]);

        $project = Project::create([
            'name' => $request->name,
            'description' => $request->description,
            'owner_id' => Auth::id()
        ]);
        if($project){
            $team = \DB::insert('insert into teams (project_id,user_id) values (?, ?)', [$project->id, json_encode($request->user_id)]);
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
}
