<?php

namespace DoBuildTasks;

require_once "./commandLine.php";
require_once "./dBuildTasks.php";

use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

$HELP_MSG = <<<EOT
>>>
doBuildTasks class 

ToDo: option commands , example

<<<
EOT;



/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "t:p:h12345";
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

//$tasksString = "task:task00" . "\r\n"
//    . 'task:task01 /option1 /option2=xxx /option3="01teststring"' . "\r\n"
//    . 'task:task02 /optionX /option2=Y /optionZ="Zteststring"' . "\r\n"
//;

//$tasksLine = "task:task00"
//    . 'task:task01 /option1 /option2=xxx /option3="01_Xteststring"'
//    . 'task:task02 /optionX /option2=Y /optionZ="02_Zteststring"'
//;
//$tasksLine = "task:clean4git";
//$tasksLine = "task:clean4release";
//$tasksLine = "task:updateCopyrightYear";

// build without properties: component path to rsgallery2_j4
// build without changes, increase id, prepare for release
// build type: component module plugin package
// build folder:
// build dev update version
// Version ID  /increaseDevelop: x.x.x.n, release x.n.00, versionByConfig
//
//$tasksLine = "task:build /type=component";
//$tasksLine = "task:build /increaseId";
//$tasksLine = "task:build /increaseId /clean4release";

$tasksLine = '';

$tasksLine .= ' task:forceVersionId'
    . ' /id="9.9.9"'
    . ' /type=component'
    . ' /srcRoot="./../../RSGallery2_J4/=component'
    . ' /name=rsgallery2'
;

$tasksLine .= ' task:forceVersionId'
    . ' /idFile="./VersionId.txt"'
    . ' /type=component'
    . ' /srcRoot="./../../RSGallery2_J4/=component'
    . ' /name=rsgallery2'
;

$tasksLine .= ' task:increaseVersionId'
    . ' /type=component'
    . ' /srcRoot="./../../RSGallery2_J4/=component'
    . ' /name=rsgallery2'
    . ' /version=major|minor|patch|dev'
;

//$tasksLine .= ' task:clean4release'
//    . ' /type=component'
//    . ' /name=rsgallery2'
//;

$tasksLine .= ' task:clean4git'
    . ' /type=component'
    . ' /name=rsgallery2'
;

$tasksLine .= ' task:updateCopyrightYear'
    . ' /type=component'
    . ' /name=rsgallery2'
;

$tasksLine .= ' task:buildRelease'
    . ' /type=component'
    . ' /srcRoot="./../../RSGallery2_J4/=component'
    . ' /buildDir="./../.packages/"'
//    . ' /adminPath='
//    . ' /sitePath='
//    . ' /mediaPath='
    . ' /name=rsgallery2'
    . ' /extension=RSGallery2'
// name.xml ?    . '/manifestFile='
//    . '/s='
//    . '/s='
//    . '/s='
;

//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";


$basePath = "..\\..\\RSGallery2_J4";

$taskFile="";
// $taskFile="./taskFile.cmd";

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$tasks = $option;
			break;

		case 't':
            $tasksLine = $option;
			break;

		case 'f':
            $taskFile = $option;
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

//--- create class object ---------------------------------

// for start / end diff
$start = print_header($options, $inArgs);

$oDoBuildTasks = new doBuildTasks(); // $basePath, $tasksString

//--- extract tasks from string or file ---------------------------------

if (empty ($hasError) ) {
    if ($taskFile!="") {
        $hasError = $oDoBuildTasks->extractTasksFromFile($taskFile);
        if (!empty ($hasError) ) {
            print ("Error on function extractTasksFromFile:" . $hasError
                . ' path: ' . $basePath);
        }
    } else {
        $hasError = $oDoBuildTasks->extractTasksFromString($tasksLine);
        if (!empty ($hasError) ) {
            print ("Error on function extractTasksFromString:" . $hasError
                . ' path: ' . $basePath);
        }
    }
}

print ($oDoBuildTasks->tasksText());

//--- collect files to execute tasks on  ---------------------------------

$hasError = $oDoBuildTasks->collectFiles($basePath);
if (!empty ($hasError) ) {
    print ("Error on function collectFiles:" . $hasError
        . ' path: ' . $basePath);
}

//--- execute tasks ---------------------------------

if (empty ($hasError) ) {

    $hasError = $oDoBuildTasks->executeTasks();

    if ($hasError) {

        print ("Error on function collectFiles:" . $hasError
            . ' path: ' . $basePath);
    }
}

if (empty ($hasError)) {

    print ($oDoBuildTasks->text () . "\r\n");
}


print_end($start);

print ("--- end  ---" . "\n");

