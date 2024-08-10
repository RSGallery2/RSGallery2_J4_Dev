<?php

namespace FolderName;

use \DateTime;
// use DateTime;


$HELP_MSG = <<<EOT
>>>
fithFolderName class ...
<<<
EOT;

/* ToDo: functions
hasExtension
nameMatchesRegEx
pathMatches regex

text ();
/**/


/*================================================================================
Class fithFolderName
================================================================================*/

class fithFolderName {

    // given name
    public $srcSpecifiedName = "";
    // realpath
    public $srcPathFolderName = "";

    // folder name part
    public $folderName = "";
    // file name part
    public $folderPath = "";

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($srcFolder="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("srcFolder: " . $srcFolder . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->extractNameParts($srcFolder);

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    extractNameParts
    --------------------------------------------------------------------*/

    function extractNameParts($srcFolder="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('extractNameParts' . "\r\n");
            print("srcSpecifiedName: " . $srcFolder . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->clear ();

            $this->srcSpecifiedName = $srcFolder;

            $this->srcPathFolderName = realpath($srcFolder);

            //$path_parts = pathinfo($srcFolder);
            $path_parts = pathinfo($this->srcPathFolderName);

            $this->folderName = $path_parts['basename'];
            $this->folderPath = $path_parts['dirname'];
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit extractNameParts: ' . $hasError . "\r\n");
        return $hasError;
    }

    /*--------------------------------------------------------------------
    clear: init to empty
    --------------------------------------------------------------------*/

    function clear() {

        $this->srcSpecifiedName = "";
        $this->srcPathFolderName = "";

        // file name part
        $this->folderName = "";
        $this->folderPath = "";

        return;
    }

    public function text()
    {
        $OutTxt = "";
        $OutTxt .= "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFolderName ---" . "\r\n";

        $OutTxt .= "srcSpecifiedName: " . $this->srcSpecifiedName . "\r\n";
        $OutTxt .= "folderName: " . $this->folderName . "\r\n";
        $OutTxt .= "folderPath: " . $this->folderPath . "\r\n";
	    $OutTxt .= "srcPathFolderName: " . $this->srcPathFolderName . "\r\n";

        return $OutTxt;
    }

} // fithFolderName

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

// ToDo: Test it manually  
// $srcFolder = ".\\";
$srcFolder = "..\\.buildPHP\\";

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$srcFolder = $option;
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

$oFolderName = new fithFolderName($srcFolder);
// $hasError = $oFolderName->extractNameParts();
print ($oFolderName->text () . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

