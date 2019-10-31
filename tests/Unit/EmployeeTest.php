<?php

namespace Tests\Unit;

use App\Employee;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class EmployeeTest extends TestCase
{
    /**
     * create employee test.
     *
     * @return json 
     */
    public function test_can_create_employee() {
        $data = [
            'name' => $this->faker->name,
            'ip_address' => $this->faker->ipv4,
        ];
        $this->post(route('employees.store'), $data)
            ->assertStatus(200);
           
    }

    /**
     * get employee by id test.
     *
     * @return json
     */
    public function test_can_show_post() {
        $employee = factory(Employee::class)->create();
        $this->get(route('employees.show', $employee->ip_address))
            ->assertStatus(200);
    }
    /**
     * delete employee by id test.
     *
     * @return json
     */
    public function test_can_delete_post() {
        $employee = factory(Employee::class)->create();
        $this->delete(route('employees.destroy', $employee->ip_address))
            ->assertStatus(200);
    }
}
