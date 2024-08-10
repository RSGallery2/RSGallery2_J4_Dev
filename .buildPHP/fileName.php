<?php

namespace fithFileName;

use \DateTime;
// use DateTime;


$HELP_MSG = <<<EOT
>>>
fithFileName class ...
<<<
EOT;

/*================================================================================
Class XXX
================================================================================*/

class fithFileName {

    // given name
    public $srcSpecifiedName = "";
    // realpath
    public $srcPathFileName = "";


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

    function __construct($srcFile="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("srcFile: " . $srcFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->extractNameParts($srcFile);

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

    function extractNameParts($srcFile="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('extractNameParts' . "\r\n");
            print("srcSpecifiedName: " . $srcFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->clear ();

            $this->srcSpecifiedName = $srcFile;

            $this->srcPathFileName = realpath($srcFile);

            $path_parts = pathinfo($srcFile);

            $this->fileName = $path_parts['filename'];
            $this->fileExtension = $path_parts['extension'];
            $this->fileBaseName = $path_parts['basename'];
            $this->filePath = $path_parts['dirname'];
        }
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
        $OutTxt .= "--- fithFileName ---" . "\r\n";

        $OutTxt .= "srcSpecifiedName: " . $this->srcSpecifiedName . "\r\n";
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";

        return $OutTxt;
    }

    public function text_NamePathLine()
    {
        $OutTxt = "";
        $OutTxt .= $this->fileName . " / " . $this->filePath;

        return $OutTxt;
    }

} // fithFileName

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

$srcFile = ".\\original.php";

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$srcFile = $option;
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

$oFileName = new fithFileName($srcFile);
// $hasError = $oFileName->extractNameParts();
print ($oFileName->text () . "\r\n");

if ($oFileName->hasExtension('php')) {
	print("yes hasExtension('php')" . "\r\n");
}

if ($oFileName->nameMatchesRegEx("/i.*i/")) {
	print("yes nameMatchesRegEx('/i.*i/')" . "\r\n");
}

print_end($start);

print ("--- end  ---" . "\n");

