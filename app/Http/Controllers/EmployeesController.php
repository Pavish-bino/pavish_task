<?php

namespace App\Http\Controllers;

use App\Employee;
use App\EmployeeWebHistory;
use Illuminate\Http\Request;
use Validator;

class EmployeesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validated = Validator::make($request->all(), [
            'name' => ['required', 'min:3', 'max: 255', 'unique:employees,name'],
            'ip_address' => ['required', 'min:3', 'max: 100'],
          ]);
        

        if ($validated->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validated->errors()->first()
            ], 400);
        }

        $employee = Employee::create([
            'name' => $request->name,
            'ip_address' => $request->ip_address
        ]);

        if(!$employee) {
            return response()->json([
                'success' => false,
                'message' => 'Employee not found'
            ], 404);
        }
 
        return response()->json([
            'success' => true,
            'message' => 'Employee created',
            'employee' => $employee,
           // 'token' => $employee->createToken('EmployeeApp')->accessToken
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $whereCondition = ['ip_address' => $request->ip_address];
        $employee = Employee::where($whereCondition)->get(); 
        

        if(count($employee) == 0 || !isset($request->ip_address) || empty($request->ip_address) ) {
            return response()->json([
                'success' => false,
                'message' => 'Resource not found'
            ], 404);
        }


        return response()->json([
            'success' => true,
            'message' => 'Resource Found',
            'employee' => $employee->toArray(),
        ], 200);


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function edit(Employee $employee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Employee $employee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $ip_address = $request->ip_address;

        $whereCondition = ['ip_address' => $request->ip_address];
        $employee = Employee::Select('id')->where($whereCondition)->pluck('id')->toArray();
        
        if(count($employee) > 0) {
            $webHistoryCount = EmployeeWebHistory::whereIn('employee_id', $employee)->count();
            if($webHistoryCount > 0) {
                EmployeeWebHistory::whereIn('employee_id', $employee)->delete();
            }
            
            Employee::where($whereCondition)->delete();
            // DB::table('oauth_refresh_tokens')
            //     ->whereIn('access_token_id', $employee)
            //     ->update(['revoked' => true]);

            return response()->json([
                'success' => true,
                'message' => 'Employee Deleted',
            ], 200);
        }else{
            return response()->json([
                'success' => true,
                'message' => 'Resource not found',
            ], 404);
        }
        

    }
}
