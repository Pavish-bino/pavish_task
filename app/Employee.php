<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;


class Employee extends Authenticatable
{
    use HasApiTokens,Notifiable;
    protected $guarded = ['id'];

    public function employeewebhistory() {
        return $this->hasMany(EmployeeWebHistory::class);
    }

}
