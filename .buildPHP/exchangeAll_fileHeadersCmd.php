<?php

namespace exchangeAll_fileHeaders;

require_once "./commandLine.php";
require_once "./exchangeAll_fileHeaders.php";

// use \DateTime;

use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_end;
use function commandLine\print_header;


$HELP_MSG = <<<EOT
    >>>
    class exchangeAll_fileHeaders
    
    Reads file, exchanges one 'author' line 
    Standard replace text is defined in class fileHeaderData
    <<<
    EOT;


/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "s:a:h12345";
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

//// idea: own task for filenames
//$filesTaskLine = "task:createFilenamesList"
//    . ' /srcRoot="./../../RSGallery2_J4"'
//    . ' /isNoRecursion=true'
////    . ' /isCrawlSilent=false' default true ToDo:
//    . ' /includeExt="php"'
////    . ' /includeExt="xmp"'
////    . ' /includeExt="xmp"'
////    . ' /includeExt="ini"'
////    . ' /includeFiles="???"'
////    . ' /excludeFiles="./../../RSGallery2_J4/.gitignore ./../../RSGallery2_J4/LICENSE.txt /../../RSGallery2_J4/README.md ./../../RSGallery2_J4/index.html "'
////   . ' /includeFolder="./Administrator'
////   . ' /includeFolder="./Administrator'
//    . ' ';


$tasksLine = ' task:exchangeAll_fileHeaders'
    . ' /srcRoot="./../../RSGallery2_J4"'
//    . ' /srcRoot="./../../RSGallery2_J4/administrator/components/com_rsgallery2/tmpl/develop"'
//    . ' /isNoRecursion=true'
// ToDo:    . ' /authorText = ""'//    . ' /s='
;

//$srcRoot = './../../RSGallery2_J4/administrator/components/com_rsgallery2/tmpl/develop';
//$srcRoot = './../../RSGallery2_J4';
$srcRoot = '';

//$authorText = "GNU General Public author version 2 or later;";
//$this->author = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";
$authorText = '';

foreach ($options as $idx => $option) {
    print ("idx: " . $idx . "\r\n");
    print ("option: " . $option . "\r\n");

    switch ($idx) {
        case 's':
            $srcRoot = $option;
            break;

        case 'a':
            $authorText = $option;
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

$task = new task();
$task->extractTaskFromString($tasksLine);

$oexchangeAll_fileHeaders = new exchangeAll_fileHeaders($srcRoot, $authorText);

$hasError = $oexchangeAll_fileHeaders->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if (!$hasError) {
    $hasError = $oexchangeAll_fileHeaders->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print ($oexchangeAll_fileHeaders->text() . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

