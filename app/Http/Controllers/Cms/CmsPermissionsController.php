<?php

namespace App\Http\Controllers\Cms;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Permission;
use Validator;
use Redirect;
use LaravelLocalization;


class CmsPermissionsController extends Controller
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
    	$permissions = Permission::all();
    	return view('adminpanel.permissions.list')->with('permissions',$permissions);
    }

    public function edit($id)
    {
    	$permission = Permission::find($id);
    	return view('adminpanel.permissions.edit')->with('permission',$permission);
    }

    public function create()
    {
    	return view('adminpanel.permissions.add');
    }

    public function update($id) 
    {
        $rules = [            
            'name' => 'required|string'
        ];       
        
        $validator = Validator::make($this->request->all(), $rules);

        if ($validator->fails()) {
            return redirect('cms/permissions/'.$id.'/edit')
                        ->withErrors($validator)
                        ->withInput();
        }

        $permission =  Permission::where(['id' => $id])->update([
            'name'   => $this->request->get('name'),
            'description' => $this->request->get('description'),
        ]);

        $this->request->session()->flash('alert-success', 'Permission was successful updated!');
        return Redirect::to($this->lang.'/cms/permissions/'.$id.'/edit');
    }

    public function store()
    {
    	$rules = [            
            'name' => 'required|string'
        ];       
        
        $validator = Validator::make($this->request->all(), $rules);

        if ($validator->fails()) {
            return redirect('cms/permissions/create')
                        ->withErrors($validator)
                        ->withInput();
        }

        $permission = new Permission(array(
            'name'   => $this->request->get('name'),
            'description' => $this->request->get('description'),
        )); 
        $permission->save();

        $this->request->session()->flash('alert-success', 'Permission was successful added!');
        return Redirect::to($this->lang.'/cms/permissions/create');
    }

    public function destroy($id)
    {
        Permission::find($id)->delete();
    	$this->request->session()->flash('alert-success', 'Permission was successful deleted!');
        return Redirect::to($this->lang.'/cms/permissions');
    }

}
