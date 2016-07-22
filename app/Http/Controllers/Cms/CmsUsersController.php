<?php

namespace App\Http\Controllers\Cms;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Role;

use Validator;
use Redirect;
use \App\User;
use LaravelLocalization;

class CmsUsersController extends Controller
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
        $users = User:: all();
        return view('adminpanel.users.list')->with('users',$users);
    }
  
    public function create()
    {
        $roles = Role::all();
        return view('adminpanel.users.add')->with('roles',$roles);
    }

    public function store()
    {


        $rules = [            
            'name'       => 'required|unique:users',
            'email'      => 'required|email|unique:users',
            'username'   => 'required|unique:users',
            'role'       => 'required|exists:roles,id',
            'password'   => 'required',
            'password_confirmation'   => 'required|same:password',
        ];       
        

        $validator = Validator::make($this->request->all(), $rules);

        if ($validator->fails()) {
            return redirect('cms/users/create')
                        ->withErrors($validator)
                        ->withInput();
        }


        $user = new User;
        $user->name     = $this->request->get('name');
        $user->username = $this->request->get('username');
        $user->email    = $this->request->get('email');
        $user->password = bcrypt($this->request->get('password'));
        $user->save();

        $user->assignRole((int)$this->request->get('role'));


        $this->request->session()->flash('alert-success', 'User was successful added!');
        return Redirect::to($this->lang.'/cms/users/create');
        
    }



    public function edit($id)
    {
        $user = User::find($id);
        $roles = Role::all();
        return view('adminpanel.users.edit')->with('user',$user)->with('roles',$roles);
    }


    public function update($id)
    {
        // dd($this->request->all());

         $rules = [            
            'name'       => 'required',
            'username'   => 'required',
            'email'      => 'required|email',
            'role'       => 'required|exists:roles,id',
            'password'   => 'required',
            'password_confirmation'   => 'required|same:password',
        ];       
        

        $validator = Validator::make($this->request->all(), $rules);

        if ($validator->fails()) {
            return redirect('cms/users/'.$id.'/edit')
                        ->withErrors($validator)
                        ->withInput();
        }

        $user = User::find($id);

        $user->revokeRoleAll();

        $user->name     = $this->request->get('name');
        $user->username = $this->request->get('username');
        $user->email    = $this->request->get('email');
        $user->password = bcrypt($this->request->get('password'));

        $user->save();
        

        $user->assignRole((int)$this->request->get('role'));

        $this->request->session()->flash('alert-success', 'User was successful updated!');
        return Redirect::to($this->lang.'/cms/users/'.$id.'/edit');        
    }

    public function destroy($id)
    {
        $user = User::find($id);
        $user->delete();
        $user->revokeRoleAll();
        $this->request->session()->flash('alert-success', 'User was successful deleted!');  
        return Redirect::to($this->lang.'/cms/users');
    }
}
