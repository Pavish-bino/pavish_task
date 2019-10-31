<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use GuzzleHttp\Client;

class GetEmployeeWebHistory extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Get:EmployeeWebHistoryData {ip_address}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Get employee web searched url by using ip address';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $myBody = [];
        $responseBodyAsString = '';
        $ip_address = $this->argument('ip_address');

        $client = new Client([
            'headers' => [ 'Content-Type' => 'application/json' ]
        ]);
        $host_name = request()->getHttpHost();
       
        try{
        $url = "http://".$host_name."/api/employeewebhistory/show/".$ip_address;
        $myBody['ip_address'] = $ip_address;
      
        $response = $client->get($url);
        //echo '<pre>' . var_export($response->getStatusCode(), true) . '</pre>';
        echo  var_export($response->getBody()->getContents(), true) ;
        }catch (\Exception $e) {
            if($e instanceof \GuzzleHttp\Exception\ClientException ){
            $response = $e->getResponse();
            $responseBodyAsString = $response->getBody()->getContents();

            }
        report($e);
        echo $responseBodyAsString;
        }
    }
}
