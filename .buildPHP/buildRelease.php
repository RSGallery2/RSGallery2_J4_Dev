<?php

namespace ExecuteTasks;

require_once "./commandLine.php";

require_once "./iExecTask.php";

require_once "./fileNamesList.php";
require_once "./task.php";

// use \DateTime;
// use DateTime;

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
Class buildRelease
================================================================================*/

class buildRelease
  implements executeTasksInterface
{

	/**
	 * @var fileNamesList
	 */
	public $fileNamesList;






    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($srcFile="", $dstFile="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
//            print ("srcFile: " . $srcFile . "\r\n");
//            print ("dstFile: " . $dstFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

//            $this->srcFile = $srcFile;
//            $this->dstFile = $dstFile;


        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    funYYY
    --------------------------------------------------------------------*/

    function funYYY($zzz="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('funYYY' . "\r\n");
            print ("zzz: " . $zzz . "\r\n");
            print('---------------------------------------------------------' . "\r\n");





        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit funYYY: ' . $hasError . "\r\n");
        return $hasError;
    }

    // List of filenames to use
    public function assignFilesNames (fileNamesList $fileNamesList)
    {

	    // ($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);
	    $this->fileNamesList = $fileNamesList;

    }

    // Task name with options
    public function assignTask (task $task) : int
    {
		$options = $task->options;

		foreach ($options as $option) {

			switch (strtolower($option->name)) {

				case 'buildrelease':
					print ('Execute task: ' . $option->name);


					break;

				case 'forceversionid':
					print ('Execute task: ' . $option->name);
					break;

				case 'increaseversionid':
					print ('Execute task: ' . $option->name);
					break;

				case 'clean4git':
					print ('Execute task: ' . $option->name);
					break;

				case 'X':
					print ('Execute task: ' . $option->name);
					break;

				case 'Y':
					print ('Execute task: ' . $option->name);
					break;

				case 'Z':
					print ('Execute task: ' . $option->name);
					break;

				default:
					print ('Execute Default task: ' . $option->name);
			} // switch

			// $OutTxt .= $task->text() . "\r\n";
		}








		return 0;
    }

    public function execute (): int // $hasError
    {


		return (0);
    }

    public function executeFile (string $filePathName) : bool // $isChanged
    {


	    return (0);
    }



    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- buildRelease
 ---" . "\r\n";


        $OutTxt .= "Not defined jet " . "\r\n";
        /**
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
        /**/

        return $OutTxt;
    }


} // buildRelease


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

$fileNamesList = new fileNamesList($basePath);
$task = new task();
$task->extractTaskFromString($tasksLine);

$oBuildRelease = new buildRelease();

$oBuildRelease->assignFilesNames($fileNamesList);

$hasError = $oBuildRelease->assignTask($task);

if ($hasError) {

    print ("Error on function funYYY:" . $hasError);
}

$hasError = $oBuildRelease->execute();


print ($oBuildRelease->text () . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

