<?php

use Faker\Generator as Faker;

$factory->define(App\EmployeeWebHistory::class, function (Faker $faker) {
    $users = App\Employee::pluck('id')->toArray();
    return [
        'employee_id' => $faker->randomElement($users),
        'url' => $faker->url
    ];
});
