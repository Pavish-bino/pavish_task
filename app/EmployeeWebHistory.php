<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployeeWebHistory extends Model
{
    protected $guarded = [];

    protected $table = 'employeewebhistory';

    protected $visible = ['url'];

    public function employee() {
        return $this->belongsTo(Employee::class);
    }

}
