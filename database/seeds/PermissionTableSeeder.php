<?php

use Illuminate\Database\Seeder;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $now = Carbon\Carbon::now();

        // Basic permissions data
        App\Permission::insert([
            ['name' => 'user.create', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'user.delete', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'user.edit', 'created_at' => $now, 'updated_at' => $now],


            ['name' => 'gallery.create', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'gallery.edit', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'gallery.delete', 'created_at' => $now, 'updated_at' => $now],

            ['name' => 'setting.edit', 'created_at' => $now, 'updated_at' => $now],
        ]);

    }
}
