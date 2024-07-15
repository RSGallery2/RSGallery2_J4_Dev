<?php

$HELP_MSG = <<<EOT
>>>
original class ...
<<<
EOT;









/*================================================================================
   main (used from command line)
================================================================================*/

print ("--- argv ---" . "\r\n");
   
var_dump($argv);


$HELP_MSG = <<<EOT


EOT;


function print_header(string $start)
{

}

function print_end(string $start)
{

}


// ================================================================================
// main (used from command line)
// ================================================================================

//--- argv ---------------------------------

// print ("--- argv ---" . "\r\n");
// var_dump($argv);

// print ("--- inArgs ---" . "\r\n");
$inArgs = [];
foreach ($argv as $inArg)
{
	if (!str_starts_with($inArg, '-'))
	{
		$inArgs[] = $inArg;
	}

}
// var_dump($inArgs);

//--- options ---------------------------------

// print ( "--- getopt ---" . "\n");

$long_options = "";

$options = getopt("s:d:h", []);

var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

$start = date("Y-m-d H:i:s");

/*--------------------------------------------
variables
--------------------------------------------*/

$srcFile = "";
$dstFile = "";


foreach ($options as $option)
{
	print ("option: " . $option . "\r\n");

	switch ($option)
	{
		case '-s':
			$srcFile = $option;
			break;

		case '-d':
			$dstFile = $option;
			break;

		case "-h":
			exit($HELP_MSG);

		case "-1":
			$LeaveOut_01 = true;
			print("LeaveOut_01");
			break;
		case "-2":
			$LeaveOut_02 = true;
			print("LeaveOut__02");
			break;
		case "-3":
			$LeaveOut_03 = true;
			print("LeaveOut__03");
			break;
		case "-4":
			$LeaveOut_04 = true;
			print("LeaveOut__04");
			break;
		case "-5":
			$LeaveOut_05 = true;
			print("LeaveOut__05");
			break;

		default:
			print("Option not supported '" . $option . "'");
			break;
	}

}

//--- call function ---------------------------------

print_header($start);


print_end($start);

print ("--- end  ---" . "\n");

