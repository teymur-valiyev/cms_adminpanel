<?php

use Illuminate\Database\Seeder;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $now = Carbon\Carbon::now();

        // roles super and content
        App\Role::insert([
            ['name' => 'super', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'content', 'created_at' => $now, 'updated_at' => $now],
        ]);

    }
}
