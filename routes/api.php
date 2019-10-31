<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

/**
 * Employee Api Routes 
 */
Route::Post('employee', 'EmployeesController@store')->name('employees.store');
Route::get('show/{ip_address}', 'EmployeesController@show')->name('employees.show');
Route::delete('destroy/{ip_address}', 'EmployeesController@destroy')->name('employees.destroy');

/**
 * Employee Web History Routes 
 */
Route::Post('employeewebhistory', 'EmployeeWebHistoryController@store')->name('employeeswebhistory.store');
Route::get('employeewebhistory/show/{ip_address}', 'EmployeeWebHistoryController@show')->name('employeeswebhistory.show');
Route::delete('employeewebhistory/destroy/{ip_address}', 'EmployeeWebHistoryController@destroy')->name('employeeswebhistory.destroy');


// Route::group([
//     'middleware' => 'auth:employee'
//   ], function() { 
//       Route::get('show/{ip_address}', 'EmployeesController@show');
//       Route::delete('destroy/{ip_address}', 'EmployeesController@destroy');
//   });
