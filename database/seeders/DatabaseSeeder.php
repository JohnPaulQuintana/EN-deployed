<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\DefaultFacilities;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
       
        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        DefaultFacilities::factory()->create(); // Uses the default definition

        DefaultFacilities::factory()->state(['facilities' => 'wall'])->create();
        DefaultFacilities::factory()->state(['facilities' => 'front'])->create();
        DefaultFacilities::factory()->state(['facilities' => 'stair-in'])->create();
    }
}
