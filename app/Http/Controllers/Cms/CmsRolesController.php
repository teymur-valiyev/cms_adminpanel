<?php

namespace App\Http\Controllers\Cms;

use Illuminate\Http\Request;
use App\Role;
use App\Permission;
use LaravelLocalization;
use Redirect;
use App\Http\Requests;
use App\Http\Controllers\Controller;

use Validator;

class CmsRolesController extends Controller
{
    private $request;
    private $lang;
    
    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->lang = LaravelLocalization::getCurrentLocale();

    }

    public function index()
    {
        $roles = Role::all();
        return view('adminpanel.roles.list')->with('roles',$roles);
    }

   
    public function create()
    {
        $permissions = Permission::all();
        return view('adminpanel.roles.add')->with('permissions',$permissions);
    }

    
    public function store()
    {

        $rules = [            
            'name' => 'required',
        ];       
        
        $validator = Validator::make($this->request->all(), $rules);

        if ($validator->fails()) {
            return redirect('cms/roles/create')
                        ->withErrors($validator)
                        ->withInput();
        }

        $role = new Role;
        $role->name = $this->request->input('name');
        $role->description = $this->request->input('description');
        $role->save();

        if (count($this->request->input('permissions')) > 0) {
            foreach ($this->request->input('permissions') as $permissionid ) {
                $role->addPermission((int)$permissionid);   
            }
        } 

        $this->request->session()->flash('alert-success', 'Role was successful added!');
        return Redirect::to($this->lang.'/cms/roles/create');
    }

    
    public function edit($id)
    {
        $role = Role::find($id);
        $permissions = Permission::all();
        return view('adminpanel.roles.edit')->with('role',$role)->with('permissions',$permissions);
    }

    
    public function update($id)
    {
        $rules = [            
            'name' => 'required',
        ];       
        
        $validator = Validator::make($this->request->all(), $rules);
        if ($validator->fails()) {
            return redirect('cms/roles/'.$id.'/edit')
                        ->withErrors($validator)
                        ->withInput();
        }
        
        $role = Role::find($id);
        $role->deletePermission();
        
        $role->name = $this->request->input('name');
        $role->description = $this->request->input('description');
        $role->save();
            
        if (count($this->request->input('permissions')) > 0) {
            foreach ($this->request->input('permissions') as $permissionid ) {
                $role->addPermission((int)$permissionid);   
            }
        } 

        $this->request->session()->flash('alert-success', 'Role was successful updated!');
    
        return Redirect::to($this->lang.'/cms/roles/'.$id.'/edit');
    }

    
    public function destroy($id)
    {
        $role = Role::find($id);
        if ($role->name == 'super') {
            $this->request->session()->flash('alert-success', 'Cant delete super role!');
            return Redirect::to($this->lang.'/cms/roles/');
        }

        $role->deletePermission();
        $role->delete();

        $this->request->session()->flash('alert-success', 'Role was successful deleted!');
        
        return Redirect::to($this->lang.'/cms/roles/');
    }
}
