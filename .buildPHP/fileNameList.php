<?php

namespace fithFileNameList;

use \DateTime;
// use DateTime;


$HELP_MSG = <<<EOT
>>>
fithFileNameList class ...
<<<
EOT;

/*================================================================================
Class XXX
================================================================================*/

class fithFileNameList {

    // given name
    public $basePath = "";
    // realpath
    public $extension = "";


    // file name part
    public $fileName = "";
    // file name part
    public $fileExtension = "";
    // file name part
    // file name part
    public $fileBaseName = "";
    public $filePath = "";

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    function __construct($basePath="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("srcFile: " . $basePath . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->extractNameParts($basePath);

        }
        /*--- exception ----------------------------------------------------*/
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    extractNameParts
    --------------------------------------------------------------------*/

    function extractNameParts($basePath="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('extractNameParts' . "\r\n");
            print("srcSpecifiedName: " . $basePath . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->clear ();

            $this->srcSpecifiedName = $basePath;

            $this->srcPathFileName = realpath($basePath);

            $basePath_parts = pathinfo($basePath);

            $this->fileName = $basePath_parts['filename'];
            $this->fileExtension = $basePath_parts['extension'];
            $this->fileBaseName = $basePath_parts['basename'];
            $this->filePath = $basePath_parts['dirname'];
        }

        /*--- exception ----------------------------------------------------*/
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit extractNameParts: ' . $hasError . "\r\n");
        return $hasError;
    }

    /*--------------------------------------------------------------------
    compare for same extension
    --------------------------------------------------------------------*/

    function hasExtension($check = '') {

		$hasExtension = false;

	    if ($this->fileExtension == $check){

			$hasExtension = true;
	    }

        return $hasExtension;
    }

	/*--------------------------------------------------------------------
	compare for name matches regex
	--------------------------------------------------------------------*/

	function nameMatchesRegEx($regex = '') {

		$isMmatchesRegex = false;

		if (preg_match($regex, $this->fileName)) {

			$isMmatchesRegex = true;
		}

		return $isMmatchesRegex;
	}

	/*--------------------------------------------------------------------
	compare for name and extension matches regex
	--------------------------------------------------------------------*/

	function basenameMatchesRegEx($regex = '') {

		$isMmatchesRegex = false;

		if (preg_match($regex, $this->fileBaseName)) {

			$isMmatchesRegex = true;
		}

		return $isMmatchesRegex;
	}

	/*--------------------------------------------------------------------
	compare for name and extension matches regex
	--------------------------------------------------------------------*/

	function pathMatchesRegex($regex = '') {

		$isMmatchesRegex = false;

		if (preg_match($regex, $this->filePath)) {

			$isMmatchesRegex = true;
		}

		return $isMmatchesRegex;
	}

	/*--------------------------------------------------------------------
	clear: init to empty
	--------------------------------------------------------------------*/

    function clear() {

        $this->srcSpecifiedName = "";
        $this->srcPathFileName = "";

        // file name part
        $this->fileName = "";
        $this->fileExtension = "";
        $this->fileBaseName = "";
        $this->filePath = "";

        return;
    }

    public function text()
    {
        $OutTxt = "";
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFileNameList ---" . "\r\n";

        $OutTxt .= "srcSpecifiedName: " . $this->srcSpecifiedName . "\r\n";
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";

        return $OutTxt;
    }

} // fithFileNameList

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

$options = getopt("p:e:h12345", []);
var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

# $basePath = ".\\original.php";
$basePath = ".\\original.php";

# $extension = '.php';
$extension = '';


foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 'p':
			$basePath = $option;
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

$oFileNameList = new fithFileNameList($basePath, $extension);
// $hasError = $oFileName->extractNameParts();
print ($oFileNameList->text () . "\r\n");





print_end($start);

print ("--- end  ---" . "\n");

