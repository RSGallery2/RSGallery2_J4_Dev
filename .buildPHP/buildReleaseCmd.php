<?php

namespace ExecuteTasks;

require_once "./commandLine.php";
require_once "./buidRelease.php";

use \DateTime;
// use DateTime;

use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use SplFileInfo;
use ZipArchive;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

use FileNamesList\fileNamesList;
use task\task;

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

list($inArgs, $options) = argsAndOptions($argv, $optDefinition, $isPrintArguments);

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
	. ' /buildDir="./../.packages"'
//    . ' /adminPath='
//    . ' /sitePath='
//    . ' /mediaPath='
	. ' /name=rsgallery2'
	. ' /extension=RSGallery2'
	. ' /version=5.0.12.4'
// name.xml ?    . '/manifestFile='
//    . '/s='
//    . '/s='
//    . '/s='
;

// ToDo: option release date option releasefiledate

$basePath = "..\\..\\RSGallery2_J4";


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
$start = print_header($options, $inArgs);

$task = new task();
$task->extractTaskFromString($tasksLine);

$oBuildRelease = new buildRelease();

//$fileNamesList = new fileNamesList($basePath);
//$oBuildRelease->assignFilesNames($fileNamesList);

$hasError = $oBuildRelease->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if ( ! $hasError) {

    $hasError = $oBuildRelease->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print ($oBuildRelease->text () . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

