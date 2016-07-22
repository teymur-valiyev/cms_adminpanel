<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $table = 'permissions';

    protected $fillable = ['name','description'];


    public function roles()
    {
    	return $this->belongsToMany(Role::class);
    }

    public function users()
    {
    	return $this->hasManyThrough(User::class, Role::class);
    }
}
