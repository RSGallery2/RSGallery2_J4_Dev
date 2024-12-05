<?php

namespace FolderName;

require_once "./commandLine.php";
require_once "./folderName.php";

use function commandLine\argsAndOptions;
use function commandLine\print_end;
use function commandLine\print_header;

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
main (used from command line)
================================================================================*/

$optDefinition = "s:d:h12345";
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

// ToDo: Test it manually
// $srcFolder = "./";
$srcFolder = "..\\.buildPHP\\";

foreach ($options as $idx => $option) {
    print ("idx: " . $idx . "\r\n");
    print ("option: " . $option . "\r\n");

    switch ($idx) {
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
$start = print_header($options, $inArgs);

$oFolderName = new fithFolderName($srcFolder);
// $hasError = $oFolderName->extractNameParts();
print ($oFolderName->text() . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

