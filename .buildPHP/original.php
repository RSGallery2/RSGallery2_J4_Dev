<?php

use \DateTime;


$HELP_MSG = <<<EOT
>>>
original class ...
<<<
EOT;


/*================================================================================
Class XXX
================================================================================*/

class clsXXX {

    public $srcFile = "";
    public $dstFile = "";


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    function __construct($srcFile="", $dstFile="") {

        $hasError = 0;
        try {
            print('*********************************************************');
            print ("srcFile: " . $srcFile);
            print ("dstFile: " . $dstFile);
            print('---------------------------------------------------------');

            $this->srcFile = $srcFile;
            $this->dstFile = $dstFile;


        }
        /*--- exception ----------------------------------------------------*/
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError);

    }

    /*--------------------------------------------------------------------
    funYYY
    --------------------------------------------------------------------*/

    function funYYY($zzz="") {
        $hasError = 0;

        try {
            print('*********************************************************');
            print('funYYY');
            print ("zzz: " . $zzz);
            print('---------------------------------------------------------');





        }
        /*--- exception ----------------------------------------------------*/
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            $hasError = -101;
        }

        print('exit funYYY: ' . $hasError);
        return $hasError;
    }
}

/*--------------------------------------------------------------------
print_header
--------------------------------------------------------------------*/

function print_header($start, $options, $inArgs)
{
    global $argc, $argv;

    print('------------------------------------------');
    echo ('Command line: ');

    for($i = 1; $i < $argc; $i++) {
        echo ($argv[$i]) . " ";
    }

    print('');
    print('Start time:   ' . $start->format('Y-m-d H:i:s'));
    print('------------------------------------------');

    return $start;
}

/*--------------------------------------------------------------------
print_end
--------------------------------------------------------------------*/

function print_end(DateTime $start)
{
    $now = DateTime ();
    print('');
    print('End time:               ' . $now->format('Y-m-d H:i:s'));
    $difference = $now - $start;
    print('Time of run:            ' .  $difference);
}

/*================================================================================
main (used from command line)
================================================================================*/

//--- argv ---------------------------------

print ("--- argv ---" . "\r\n");
var_dump($argv);

print ("--- inArgs ---" . "\r\n");
$inArgs = [];
foreach ($argv as $inArg)
{
    if (!str_starts_with($inArg, '-'))
    {
        $inArgs[] = $inArg;
    }
}
var_dump($inArgs);

//--- options ---------------------------------

print ( "--- getopt ---" . "\n");

$long_options = "";

$options = getopt("s:d:h", []);
var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

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

// for start / end diff
$start = new DateTime();
print_header($start, $options, $inArgs);

$oXXX = new clsXXX($srcFile, $dstFile);
$hasError = $oXXX->funYYY();

if ($hasError) {

    print ("Error on function fun:" . $hasError);

}

print_end($start);

print ("--- end  ---" . "\n");

