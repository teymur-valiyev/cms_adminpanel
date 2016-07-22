<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
 	
 	protected $table = 'roles';

    protected $fillable = ['name','description'];


    public function users()
    {
    	return $this->belongsToMany(User::class);
    }

    public function permissions()
    {
    	return $this->belongsToMany(Permission::class);
    }

    public function addPermission($permission) 
    {
    	if (is_string($permission)) {
    		$permission = Permission::where('name',$permission)->first();
    	}

    	return $this->permissions()->attach($permission);
    }

    public function removePermission($permission) 
    {
    	if (is_string($permission)) {
    		$permission = Permission::where('name',$permission)->first();
    	}

    	return $this->permissions()->detach($permisson);
    }

    public function deletePermission()
    {
        return $this->permissions()->detach();
    }
    
}
