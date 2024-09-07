<?php

namespace FileNamesList;

require_once "./commandLine.php";
require_once "./FileNamesList.php";

use \DateTime;
use FileName\fithFileName;
use FolderName\fithFolderName;

use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

/**
ToDo:
* folder name regex
* filename regex
/**/

$HELP_MSG = <<<EOT
>>>
FileNameList class ...
<<<
EOT;

/*================================================================================
main (used from command line)
================================================================================*/

$options = getopt("e:i:p:w:nh12345", []);
var_dump($options);

$optDefinition = "oe:i:p:w:nh12345";
$isPrintArguments = false;

list($inArgs, $options) = argsAndOptions($argv, $optDefinition, $isPrintArguments);


$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

$path = "..\\..\\RSGallery2_J4";

//$includeExt = "php xmp ini";
//$includeExt = "php";
//$includeExt = "xmp";
//$includeExt = "ini";
$includeExt = "";

//$excludeExt = "php xmp ini";
//$excludeExt = "php";
//$excludeExt = "xmp";
//$excludeExt = "ini";
$excludeExt = "";

// no recursion, actual folder only
$isNoRecursion = False;
//$isNoRecursion = True;

//$writeListToFile = "";
$writeListToFile = "./FileNamesList.txt";

foreach ($options as $idx => $option)
{
    print ("idx: " . $idx . "\r\n");
    print ("option: " . $option . "\r\n");

    switch ($idx)
    {
        case 'p':
            $path = $option;
            break;

        case 'i':
            $includeExt = $option;
            break;

        case 'e':
            $excludeExt = $option;
            break;

        case 'n':
            $isNoRecursion = True;
            break;

        case 'w':
            $writeListToFile = $option;
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
$start = print_header($options, $inArgs);

$oFileNamesList = new fileNamesList($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);

$hasError = $oFileNamesList->scan4Filenames();

if ($hasError) {

    print ("Error on function scan4Filenames:" . $hasError);

} else {
	print ("--- result -------------------" . "\r\n");
    print ($oFileNamesList->text () . "\r\n");
}


print_end($start);

print ("--- end  ---" . "\n");
