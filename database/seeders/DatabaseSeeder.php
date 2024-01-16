<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use App\Models\DefaultFacilities;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
       
        \App\Models\User::factory()->create([
            'name' => 'Administrator',
            'email' => 'admin@email.com',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'email_verified_at' => now(),
            'remember_token' => Str::random(10),
        ]);

        DefaultFacilities::factory()->create(); // Uses the default definition

        DefaultFacilities::factory()->state(['facilities' => 'male'])->create();
        DefaultFacilities::factory()->state(['facilities' => 'wall'])->create();
        DefaultFacilities::factory()->state(['facilities' => 'front'])->create();
        DefaultFacilities::factory()->state(['facilities' => 'stair-in'])->create();
    }
}
