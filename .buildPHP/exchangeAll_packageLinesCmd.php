<?php

namespace exchangeAll_packageLines;

require_once "./commandLine.php";
require_once "./exchangeAll_packageLines.php";

// use \DateTime;

use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;


$HELP_MSG = <<<EOT
>>>
class exchangeAll_packages

Reads file, exchanges one 'package' line 
Standard replace text is defined in class fileHeaderData
<<<
EOT;


/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "s:p:h12345";
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

$tasksLine = ' task:exchangeAll_packages'
//    . ' /srcRoot="./../../RSGallery2_J4"'
    . ' /srcRoot="./../../RSGallery2_J4/administrator/components/com_rsgallery2/tmpl/develop"'
//    . ' /packageText = "RSGallery2"'
//    . ' /s='
;

//$srcRoot = './../../RSGallery2_J4/administrator/components/com_rsgallery2/tmpl/develop';
//$srcRoot = './../../RSGallery2_J4';
$srcRoot = '';

//$packageText = "RSGallery";
$packageText = '';

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$srcRoot = $option;
			break;

        case 'p':
            $packageText = $option;
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

//$fileNamesList = new fileNamesList($basePath);
//$oBuildRelease->assignFilesNames($fileNamesList);


$oExchangeAll_packages = new exchangeAll_packages($srcRoot, $packageText);

$hasError = $oExchangeAll_packages->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if ( ! $hasError) {

    $hasError = $oExchangeAll_packages->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print ($oExchangeAll_packages->text () . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");
