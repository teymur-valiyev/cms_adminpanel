<?php

use Illuminate\Database\Seeder;

class PermissionRoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	// ???
        $role = App\Role::where('name', 'super')->first();

        $role = App\Role::where('name', 'content')->first();
        $role->addPermission('gallery.create');
        $role->addPermission('gallery.edit');
        $role->addPermission('gallery.delete');

    }
}
