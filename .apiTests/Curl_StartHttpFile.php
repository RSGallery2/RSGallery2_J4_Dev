<?php
/* Curl_StartHttpFile 
Starts using parameter from given *.http  file to connect to API 

*/

$HELP_MSG = <<<EOT
    >>>
    class buildExtension

    ToDo: option commands , example

    <<<
    EOT;


/**
 * @return array
 */
function argsAndOptions($argv, string $optDefinition, bool $isPrintArguments): array
{
    $options = [];
    $inArgs = [];

    try {

        //--- argv ---------------------------------

        if ($isPrintArguments) {
            print ("--- argv ---" . PHP_EOL);
            var_dump($argv);
        }

        $inArgs = [];
        foreach ($argv as $inArg) {
            if (!str_starts_with($inArg, '-')) {
                $inArgs[] = $inArg;
            }
        }
        if ($isPrintArguments) {
            if (!empty ($inArgs)) {
                print ("--- inArgs ---" . PHP_EOL);
                var_dump($inArgs);
            }
        }

        //--- extract options ---------------------------------

        $options = getopt($optDefinition, []);

        if ($isPrintArguments) {
            if (!empty ($inArgs)) {
                print ("--- in options ---" . PHP_EOL);
                var_dump($options);
            }
        }

    } catch (Exception $e) {
        print ('!!! Error: Exception: ' . $e->getMessage() . PHP_EOL);
        $hasError = -101;
    }

    return [$inArgs, $options];
}

/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "f:r:t:h12345";
$isPrintArguments = false;

[$inArgs, $options] = argsAndOptions($argv, $optDefinition, $isPrintArguments);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

// ToDo: own class
// token from set


$cmd = '';
$url = '';
$accept = '';
$contentType = '';
$token = '';

$optionCmd = '';
$optionUrl = '';
$optionAccept = '';
$optionContentType = '';
//$optionToken = '';
$tokenFile = '';
// $tokenSetId = '';

$httpFile = "";

$responseFile = "";
$isWriteResponse = false;
//$httpFile=".\\projects.http";

foreach ($options as $idx => $option) {
    print ("idx: " . $idx . PHP_EOL);
    print ("option: " . $option . PHP_EOL);

    switch ($idx) {

        case 'f':
            $httpFile = $option;
            break;

        case 't':
            $tokenFile = $option;
            break;

        case 'r':
            // on empty option the filename will be taken from httpFile
            // with extension json
            $responseFile = $option;
            $isWriteResponse = true;
            break;

        case "h":
            exit($HELP_MSG);

        case "1":
            $LeaveOut_01 = true;
            print("LeaveOut_01");
            break;
        case "2":
            $LeaveOut_02 = true;
            print("LeaveOut__02");
            break;
        case "3":
            $LeaveOut_03 = true;
            print("LeaveOut__03");
            break;
        case "4":
            $LeaveOut_04 = true;
            print("LeaveOut__04");
            break;
        case "5":
            $LeaveOut_05 = true;
            print("LeaveOut__05");
            break;

        default:
            print("Option not supported '" . $option . "'");
            break;
    }
}

print ('=== Http file ==================================' . PHP_EOL);

print ('Http file: "' . $httpFile . '"' . PHP_EOL);

//--- read file ----

$content = file_get_contents($httpFile);
$lines = explode("\n", $content);
print ("Lines:" . $content);

//--- handle lines ------------------

//$cmd = 'GET';
//$url = 'http://127.0.0.1/joomla5x/api/index.php/v1/lang4dev/projects';
//$accept = 'application/vnd.api+json';
//$contentType = 'application/json';
//$token = 'c2hhMjU2Ojc3OTo3MDIxODdiNTE0N2NjMDY0ZjVlNGY3OTk5NmNiOWZhZTcxYWRkNWVmOWJjZDA0YjYxZTVjNWEwMmEwZTVkZmY5';

print ('--- lines:' . PHP_EOL);

// ###
//GET  http://127.0.0.1/joomla5x/api/index.php/v1/lang4dev/projects
//Accept: application/vnd.api+json
//Content-Type: application/json
//X-Joomla-Token: "c2hhMjU

$isStartFound = false;
foreach ($lines as $idx => $line) {

    print ($line . PHP_EOL);

    if (str_starts_with($line, '###')) {
        $isStartFound = true;
    }

    // comment line
    if (str_starts_with($line, '#')) {
        continue;
    }

    // empty line
    $line = trim($line);
    if (empty($line)) {
        continue;
    }

    if (!$isStartFound) {
        continue;
    }

    //--- command -------------------------------------

    $isCommand = false;
    // $lowerLine  = strtolower($line);

    $parts = explode(' ', $line, 2);

    $testCmd = strtolower(trim($parts[0]));
    if ($testCmd == 'get'
        || $testCmd == 'post'
        || $testCmd == 'put'
        || $testCmd == 'delete'
        || $testCmd == 'patch'
    ) {
        $isCommand = true;

        $cmd = trim($parts[0]);
        $url = trim($parts[1]); // if (count($parts) > 1) {

        continue;
    }

// 'name': 'value' definition ?
    if (str_contains($line, ':')) {

        $parts = explode(':', $line, 2);
        if (count($parts) > 1) {

            $value = trim($parts[1]);

            switch (strtolower($parts[0])) {
                case strtolower('Accept'):
                    $accept = $value;
                    break;
                case strtolower('Content-Type'):
                    $contentType = $value;
                    break;
                case strtolower('X-Joomla-Token'):
                    $token = $value;
                    break;
                default:
                    print ('!!! Error unknown line content: "' . $line . '" !!!' . PHP_EOL);
                    break;
            }
        }

    }
}

print ('\$cmd: "' . $cmd . '"' . PHP_EOL);
print ('\$url: "' . $url . '"' . PHP_EOL);
print ('\$accept: "' . $accept . '"' . PHP_EOL);
print ('\$contentType: "' . $contentType . '"' . PHP_EOL);
print ('\$token: "' . $token . '"' . PHP_EOL . PHP_EOL);

//--- use commandline or other input -----------------------

// choose token ?  ? from file

// standard accept

//=== Call curl ===================================================

if (!extension_loaded('curl')) {
    print (PHP_EOL . "!!! Error: Curl extension not loaded !!!" . PHP_EOL . PHP_EOL);
    exit (-987);
}

$curl = curl_init();

//--- Curl header ------------------

print ('=== Curl Options ==================================' . PHP_EOL);


// HTTP request headers
$headers = [
    'Accept: ' . $accept,
    'Content-Type: ' . $contentType,
    sprintf('X-Joomla-Token: %s', trim($token)),
];

print ('--- headers:' . PHP_EOL);
foreach ($headers as $header) {

    print ($header . PHP_EOL);
}

curl_setopt_array($curl, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => 'utf-8',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_2TLS,
    ]
);

curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $cmd,
);

print ('=== curl execute ==============================' . PHP_EOL);

$response = curl_exec($curl);

print ('=== response ==============================' . PHP_EOL);

if (!empty($response)) {
    $data = json_decode($response);
    $jsonData = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    print ($jsonData . PHP_EOL);

    // The response body is now a stream, so you need to do
    // print ($response->body;

    if ($isWriteResponse) {

        if (empty($responseFile)) {
            $ext = 'json';
            $responseFile = substr_replace($httpFile, $ext, strrpos($httpFile , '.') +1);
        }
        file_put_contents($responseFile, $jsonData);
    }

} else {
    print ('!!! error on curl_exec !!!' . PHP_EOL);
    print ('Curl error: ' . curl_error($curl) . PHP_EOL);
}

print ('=== close curl ============================' . PHP_EOL);

curl_close($curl);

print ('=== done ==================================' . PHP_EOL);

