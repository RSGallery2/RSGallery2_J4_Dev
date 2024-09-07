<?php

namespace exchangeAll_actCopyrightYear;

require_once "./commandLine.php";
require_once "./exchangeAll_actCopyrightYear.php";

// use \DateTime;

use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;


$HELP_MSG = <<<EOT
>>>
class exchangeAll_actCopyrightYear

Reads file, exchanges one 'copyright' line for actual year part (second year in line)
Standard replace text is actual year
<<<
EOT;


/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "s:y:h12345";
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

$tasksLine = ' task:exchangeAll_actCopyrightYear'
//    . ' /srcRoot="./../../RSGallery2_J4"'
    . ' /srcRoot="./../../RSGallery2_J4/administrator/components/com_rsgallery2/tmpl/develop"'
    . ' /yearText = "1984"'
//    . ' /s='
;

//$srcRoot = './../../RSGallery2_J4/administrator/components/com_rsgallery2/tmpl/develop';
//$srcRoot = './../../RSGallery2_J4';
$srcRoot = '';

//$licenseText = "GNU General Public License version 2 or later;";
//$this->license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";
$yearText = '';

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$srcRoot = $option;
			break;

		case 'y':
            $yearText = $option;
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


$oExchangeAllActCopyright = new exchangeAll_actCopyrightYearLines($srcRoot, $yearText);

$hasError = $oExchangeAllActCopyright->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if ( ! $hasError) {

    $hasError = $oExchangeAllActCopyright->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print ($oExchangeAllActCopyright->text () . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

