<?php

namespace ExecuteTasks;

require_once "./commandLine.php";
require_once "./buildRelease.php";

use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_end;
use function commandLine\print_header;

// use DateTime;

$HELP_MSG = <<<EOT
    >>>
    class buildRelease
    
    ToDo: option commands , example
    
    <<<
    EOT;

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

$tasksLine = ' task:buildRelease'
    . ' /type=component'
    . ' /srcRoot="./../../RSGallery2_J4"'
//    . ' /isNoRecursion=true'
    . ' /buildDir="./../.packages"'
//    . ' /adminPath='
//    . ' /sitePath='
//    . ' /mediaPath='
    . ' /name=rsgallery2'
    . ' /extension=RSGallery2'
//    . ' /version=5.0.12.4'
//    . ' /isForceVersion=false'
//    . ' /isIncrementVersion_major = true'
//    . ' /isIncrementVersion_minor = true'
//    . ' /isIncrementVersion_revision = true'
    // each creation of package will increase the build number
//    . ' /isIncrementVersion_build = false'
    . ' /isIncrementVersion_build = true'

    // release will increase minor and reset revision and build counter
//    . ' /isBuildRelease = true'

    // fix will increase revision and reset build counter
//    . ' /isBuildFix = true'

// name.xml ?    . '/manifestFile='
//    . '/s='
//    . '/s='
//    . '/s='
;

// ToDo: option release date option releasefiledate

$basePath = "..\\..\\RSGallery2_J4";


$srcFile = "";
$dstFile = "";

foreach ($options as $idx => $option) {
    print ("idx: " . $idx . "\r\n");
    print ("option: " . $option . "\r\n");

    switch ($idx) {
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
$start = print_header($options, $inArgs);

$task = new task();
$task->extractTaskFromString($tasksLine);

$oBuildRelease = new buildRelease();

$hasError = $oBuildRelease->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if (!$hasError) {
    $hasError = $oBuildRelease->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print ($oBuildRelease->text() . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

