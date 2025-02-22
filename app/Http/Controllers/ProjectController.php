<?php
namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectController extends Controller
{
    // Get all projects
    public function index()
    {
        $projects = Project::with(['owner', 'users', 'tasks'])->get();
        return response()->json($projects);
    }

    // Create a project
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'users' => 'array',
            'users.*' => 'exists:users,id', // Ensure users exist
            'tasks' => 'array',
            'tasks.*' => 'exists:tasks,id'
        ]);

        $project = Project::create([
            'name' => $request->name,
            'description' => $request->description,
            'owner_id' => Auth::id()
        ]);

        // Attach users (team members)
        if ($request->has('users')) {
            $project->users()->sync($request->users);
        }

        // Attach tasks
        if ($request->has('tasks')) {
            $project->tasks()->sync($request->tasks);
        }

        return response()->json($project->load('users', 'tasks'), 201);
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
