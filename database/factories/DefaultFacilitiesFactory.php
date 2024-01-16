<?php

namespace Database\Factories;

use App\Models\DefaultFacilities;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\DefaultFacilities>
 */
class DefaultFacilitiesFactory extends Factory
{
    protected $model = DefaultFacilities::class;

    public function definition(): array
    {
        return [
            'facilities' => 'female restroom',
            'floor' => 'all',
            'color' => '#ff9999',
        ];
    }

    public function wall(): array
    {
        return [
            'facilities' => 'wall',
            'floor' => 'all',
            'color' => '#0000ff',
        ];
    }

    public function male(): array
    {
        return [
            'facilities' => 'female restroom',
            'floor' => 'all',
            'color' => '#999',
        ];
    }

    public function front(): array
    {
        return [
            'facilities' => 'front',
            'floor' => 'all',
            'color' => '#999',
        ];
    }

    public function stairIn(): array
    {
        return [
            'facilities' => 'stair-in',
            'floor' => 'all',
            'color' => '#999',
        ];
    }
}
