<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         // Create a user, and give roles
        
        $now = Carbon\Carbon::now();
  
        $user = App\User::create([
            'name' => 'Teymur',
            'username' => 'teymur647',
            'email' => 'teymur.veliyev001@gmail.com',
            'password' => bcrypt('123123'),
            'created_at' => $now, 
            'updated_at' => $now,
        ])->assignRole('super');

        // ---------------

        $user = App\User::create([
            'name' => 'Eziz',
            'username' => '@ziz',
            'email' => 'aziz.azizzadeh@gmail.com',
            'password' => bcrypt('123123'),
            'created_at' => $now, 
            'updated_at' => $now,
        ])->assignRole('content');
        
    }
}
