<?php

namespace original;

use \DateTime;
// use DateTime;


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
            print('*********************************************************' . "\r\n");
            print ("srcFile: " . $srcFile . "\r\n");
            print ("dstFile: " . $dstFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->srcFile = $srcFile;
            $this->dstFile = $dstFile;


        }
        /*--- exception ----------------------------------------------------*/
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    funYYY
    --------------------------------------------------------------------*/

    function funYYY($zzz="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('funYYY' . "\r\n");
            print ("zzz: " . $zzz . "\r\n");
            print('---------------------------------------------------------' . "\r\n");





        }
        /*--- exception ----------------------------------------------------*/
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit funYYY: ' . $hasError . "\r\n");
        return $hasError;
    }


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFileName ---" . "\r\n";


        $OutTxt .= "Not defined jet " . "\r\n";
        /**
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
        /**/

        return $OutTxt;
    }


} // clsXXX

/*--------------------------------------------------------------------
print_header
--------------------------------------------------------------------*/

function print_header($start, $options, $inArgs)
{
    global $argc, $argv;

    print('------------------------------------------' . "\r\n");
    echo ('Command line: ');

    for($i = 1; $i < $argc; $i++) {
        echo ($argv[$i]) . " ";
    }

    print(''  . "\r\n");
    print('Start time:   ' . $start->format('Y-m-d H:i:s') . "\r\n");
    print('------------------------------------------' . "\r\n");

    return $start;
}

/*--------------------------------------------------------------------
print_end
--------------------------------------------------------------------*/

function print_end(DateTime $start)
{
    $now = new DateTime ();
    print('' . "\r\n");
    print('End time:               ' . $now->format('Y-m-d H:i:s') . "\r\n");
    $difference = $start->diff($now);
    print('Time of run:            ' .  $difference->format("%H:%I:%S") . "\r\n");
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

$options = getopt("s:d:h12345", []);
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

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$srcFile = $option;
			break;

		case 'd':
			$dstFile = $option;
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

//--- call function ---------------------------------

// for start / end diff
$start = new DateTime();
print_header($start, $options, $inArgs);

$oXXX = new clsXXX($srcFile, $dstFile);
$hasError = $oXXX->funYYY();

if ($hasError) {

    print ("Error on function funYYY:" . $hasError);

} else {

    print ($oXXX->text () . "\r\n");
}


print_end($start);

print ("--- end  ---" . "\n");

