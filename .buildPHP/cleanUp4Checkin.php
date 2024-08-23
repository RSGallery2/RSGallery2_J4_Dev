<?php

$HELP_MSG = <<<EOT


EOT;












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
	if ( ! str_starts_with($inArg, '-') ) 
	{
		$inArgs[] = $inArg;
	}
	
}
// var_dump($inArgs);

//--- options ---------------------------------

// print ( "--- getopt ---" . "\n");
   
$long_options="";

$options = getopt("fx:", []);

//var_dump($options);

$LeaveOut_01 = True;
$LeaveOut_02 = True;
$LeaveOut_03 = True;
$LeaveOut_04 = True;
$LeaveOut_05 = True;

$start = date("Y-m-d H:i:s");

/*--------------------------------------------
variables
--------------------------------------------*/

$srcFile = "";
$dstFile = "";


foreach ($options as $option)
{

	switch ($option)
	{
		case '-s':
			$srcFile = $option;
			break;

		case '-d':
			$dstFile = $option;
			break;

		case "-h":
			$LeaveOut_01 = True;
			print("LeaveOut_01");
			break;

		case "-1":
			$LeaveOut_01 = True;
            print("LeaveOut_01");
			break;
        case "-2":
	        $LeaveOut_02 = True;
            print("LeaveOut__02");
	        break;
        case "-3":
	        $LeaveOut_03 = True;
            print("LeaveOut__03");
	        break;
        case "-4":
	        $LeaveOut_04 = True;
            print("LeaveOut__04");
	        break;
        case "-5":
	        $LeaveOut_05 = True;
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

print ( "--- end  ---" . "\n");

?>
