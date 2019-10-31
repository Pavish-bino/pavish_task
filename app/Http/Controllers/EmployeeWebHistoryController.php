<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Employee;
use App\EmployeeWebHistory;
use Validator;

class EmployeeWebHistoryController extends Controller
{
     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validated = Validator::make($request->all(), [
            'url' => ['required', 'min:3', 'max: 255'],
            'ip_address' => ['required', 'min:3', 'max: 100'],
          ]);
        

        if ($validated->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validated->errors()->first()
            ], 400);
        }

        $employee_count = Employee::where('ip_address', $request->ip_address)->count();

        if($employee_count == 0) {
            return response()->json([
                'success' => false,
                'message' => 'Resource not found'
            ], 404);
        }

        $employee = Employee::where('ip_address', $request->ip_address)->get();

        foreach($employee as $emp) {
            EmployeeWebHistory::create([
                'employee_id' => $emp->id,
                'url' => $request->url
            ]);
        }
       

        $employee = Employee::where('ip_address', $request->ip_address)->with('employeewebhistory')->get();

 
        return response()->json([
            'success' => true,
            'message' => 'Web history created',
           // 'employee' => $employee->toArray(),
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
        $employee = Employee::where('ip_address', $request->ip_address)->with('employeewebhistory')->get();
        

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

                return response()->json([
                    'success' => true,
                    'message' => 'Employee Web Search Deleted',
                ], 200);
            }
                
            return response()->json([
                'success' => true,
                'message' => 'Employee Web Search not found.',
            ], 404);
        }else{
            return response()->json([
                'success' => true,
                'message' => 'Resource not found',
            ], 404);
        }
        

    }
}
