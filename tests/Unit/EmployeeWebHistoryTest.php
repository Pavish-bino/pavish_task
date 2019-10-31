<?php

namespace Tests\Unit;

use App\Employee;
use App\EmployeeWebHistory;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class EmployeeWebHistoryTest extends TestCase
{
    /**
     * create employee web history test.
     *
     * @return json 
     */
    public function test_can_create_employee_web_history() {
        $users = Employee::pluck('id')->toArray();
        $data = [
            'employee_id' => $this->faker->randomElement($users),
            'url' => $this->faker->url,
        ];
        $this->post(route('employeeswebhistory.store'), $data)
            ->assertStatus(200);
           
    }

    /**
     * get employee web history by id test.
     *
     * @return json
     */
    public function test_can_show_employee_web_history_post() {
        $employee = factory(Employee::class)->create();
        $this->get(route('employeeswebhistory.show', $employee->ip_address))
            ->assertStatus(200);
    }
    /**
     * delete employee web history by id test.
     *
     * @return json
     */
    public function test_can_employee_web_history_delete_post() {
        $employee = factory(Employee::class)->create();
        $this->delete(route('employeeswebhistory.destroy', $employee->ip_address))
            ->assertStatus(200);
    }
}
