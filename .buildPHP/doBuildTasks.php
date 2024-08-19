<?php

namespace DoBuildTasks;

require ".\\fileNamesList.php";
require ".\\tasksOptionsTest.php";


use \DateTime;
// use DateTime;
use FileNamesList\fileNamesList;

use option\option;
use options\options;
use task\task;
use tasks\tasks;

$HELP_MSG = <<<EOT
>>>
doBuildTasks class ...
<<<
EOT;


/*================================================================================
Class doBuildTasks
================================================================================*/

class doBuildTasks {

    /**
     * @var tasks
     */
	public $tasks = "";
    public $basePath = "";


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($basePath="", $tasks="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("basePath: " . $basePath . "\r\n");
            print ("tasks: " . $tasks . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->basePath = $basePath;
            $this->tasks = $this->extractTasksFromString($tasks);

            // print ($this->tasksText ());
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    executeTask
    --------------------------------------------------------------------*/

    public function executeTasks($task="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('executeTask' . "\r\n");
            print ("task: " . $task . "\r\n");
            print('---------------------------------------------------------' . "\r\n");





        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit executeTask: ' . $hasError . "\r\n");
        return $hasError;
    }


    /*--------------------------------------------------------------------
    executeTask
    --------------------------------------------------------------------*/

    public function collectFiles($path="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('collectFiles' . "\r\n");
            print ("path: " . $path . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            // ($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);
            new fileNamesList($path);


        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit collectFiles: ' . $hasError . "\r\n");
        return $hasError;
    }


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: class  ---" . "\r\n";


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

    public function tasksText()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: Tasks ---" . "\r\n";

	    $OutTxt .= "Tasks count: " . count ($this->tasks) . "\r\n";

        $OutTxt .= $this->tasks->text() . "\r\n";

        return $OutTxt;
    }

    public function taskText($task)
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: Tasks ---" . "\r\n";

	    $OutTxt .= "Tasks count: " . count ($this->tasks) . "\r\n";

		foreach ($this->tasks as $task)
		{



		}

        return $OutTxt;
    }

    public function optionsText()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: Tasks ---" . "\r\n";

	    $OutTxt .= "Tasks count: " . count ($this->tasks) . "\r\n";

		foreach ($this->tasks as $task)
		{



		}

        return $OutTxt;
    }

    public function optionText()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: Tasks ---" . "\r\n";

	    $OutTxt .= "Tasks count: " . count ($this->tasks) . "\r\n";

		foreach ($this->tasks as $task)
		{



		}

        return $OutTxt;
    }


} // doBuildTasks

/*--------------------------------------------------------------------
print_header
--------------------------------------------------------------------*/

function print_header($start, $options, $inArgs)
{
    global $argc, $argv;

    print('------------------------------------------' . "\r\n");
    echo ('Command line: ');

    for($i = 1; $i < $argc; $i++) {
        echo ($argv[$i]) . " ";
    }

    print(''  . "\r\n");
    print('Start time:   ' . $start->format('Y-m-d H:i:s') . "\r\n");
    print('------------------------------------------' . "\r\n");

    return $start;
}

/*--------------------------------------------------------------------
print_end
--------------------------------------------------------------------*/

function print_end(DateTime $start)
{
    $now = new DateTime ();
    print('' . "\r\n");
    print('End time:               ' . $now->format('Y-m-d H:i:s') . "\r\n");
    $difference = $start->diff($now);
    print('Time of run:            ' .  $difference->format("%H:%I:%S") . "\r\n");
}

/*================================================================================
main (used from command line)
================================================================================*/

//--- argv ---------------------------------

print ("--- argv ---" . "\r\n");
var_dump($argv);

print ("--- inArgs ---" . "\r\n");
$inArgs = [];
foreach ($argv as $inArg)
{
    if (!str_starts_with($inArg, '-'))
    {
        $inArgs[] = $inArg;
    }
}
var_dump($inArgs);

//--- options ---------------------------------

print ( "--- getopt ---" . "\n");

$long_options = "";

$options = getopt("t:p:h12345", []);
var_dump($options);

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

$tasksString = "task:task00"
    . 'task:task01 /option1 /option2=xxx /option3="01_Xteststring"'
    . 'task:task02 /optionX /option2=Y /optionZ="02_Zteststring"'
;
$tasksString = "task:clean4git";
$tasksString = "task:clean4release";
$tasksString = "task:updateCopyrightYear";

// build without properties: component path to rsgallery2_j4
// build without changes, increase id, prepare for release
// build type: component module plugin package
// build folder:
// build dev update version
// Version ID  /increaseDevelop: x.x.x.n, release x.n.00, versionByConfig
//
$tasksString = "task:build /type=component";
$tasksString = "task:build /increaseId";
$tasksString = "task:build /increaseId /clean4release";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";
//$tasksString = "task: ";





$basePath = "..\\..\\RSGallery2_J4";

$taskFile="";
// $taskFile=".\\taskFile.cmd";

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
            $tasksString = $option;
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
$start = new DateTime();
print_header($start, $options, $inArgs);

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
        $hasError = $oDoBuildTasks->extractTasksFromString($tasksString);
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

