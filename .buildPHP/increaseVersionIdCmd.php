<?php

namespace increaseVersionId;

require_once "./commandLine.php";
require_once "./increaseVersionId.php";

// use \DateTime;

use ExecuteTasks\executeTasksInterface;

use FileNamesList\fileNamesList;
use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;


$HELP_MSG = <<<EOT
>>>
class increaseVersionId

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

$tasksLine = ' task:increaseVersionId'
    . ' /srcRoot="./../../RSGallery2_J4"'
    . ' /name=rsgallery2'
//    . ' /extension=RSGallery2'
//    . ' /isIncreaseMajor'
//    . ' /isIncreaseMinor'
//    . ' /isIncreasePatch'
    . ' /isIncreaseDev'
;

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

$oIncreaseVersionId = new increaseVersionId();

$hasError = $oIncreaseVersionId->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if ( ! $hasError) {

    $hasError = $oIncreaseVersionId->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print_end($start);

print ("--- end  ---" . "\n");

