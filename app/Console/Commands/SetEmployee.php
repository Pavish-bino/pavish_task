<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use GuzzleHttp\Client;

class SetEmployee extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Set:EmployeeData {name} {ip_address}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Insert employee name and ip address';

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
        $name = $this->argument('name');
        $ip_address = $this->argument('ip_address');

        $client = new Client([
            'headers' => [ 'Content-Type' => 'application/json' ]
        ]);
        $host_name = request()->getHttpHost();
        try{
        $url = "http://".$host_name."/api/employee";
        $myBody['name'] = $name;
        $myBody['ip_address'] = $ip_address;
        
        $response = $client->post($url,
                        ['body' => json_encode(
                           $myBody
                        )]
                    );
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
