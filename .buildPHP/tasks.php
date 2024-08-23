<?php

namespace tasks;

require_once "./commandLine.php";
//require_once "./option.php";
//require_once "./options.php";
require_once "./task.php";

// use DateTime;

use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

use task\task;


$HELP_MSG = <<<EOT
>>>
class tasks

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class task
================================================================================*/

class tasks {

    /**
     * @var task[] $tasks
     */
    public $tasks;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public
    function __construct($tasks = [])
    {

        $this->tasks = $tasks;

    }


    public function addTask(task $task): void
    {

        if (!empty ($task->name)) {
            $this->tasks [$task->name] = $task;
        }
    }


    public function clear() : void
    {

        $this->tasks = [];

    }

    public function count() : int
    {

        return (count ($this->tasks));

    }

    // extract multiple tasks from string
    public function extractTasksFromString($tasksLine = "") : tasks
    {
        $this->clear ();

        try {
            //        $tasks = "task:task00"
            //            . 'task:task01 /option1 /option2=xxx /option3="01teststring"'
            //            . 'task:task02 /optionX /option2=Y /optionZ="Zteststring"';
	        $tasksLine = Trim($tasksLine);

	        while ($this->isTaskStart($tasksLine))
	        {
		        $idxStart = strpos($tasksLine, ":");
		        $idxNext = strpos($tasksLine, "task:", $idxStart+1);

		        // last task
		        if ($idxNext == false) {

			        $singleTask = substr($tasksLine, $idxStart+1);

			        $tasksLine = '';
		        } else {

			        // multiple options
			        $singleTask = substr($tasksLine, $idxStart+1, $idxNext - $idxStart -1-1);;

			        $tasksLine = substr($tasksLine, $idxNext);
			        $tasksLine = Trim($tasksLine);

		        }

		        $task = (new task())->extractTaskFromString($singleTask);
		        $this->addTask ($task);

	        }


        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
    }

    // ToDo: A task may have more attributes like *.ext to
    public function extractTasksFromFile(string $taskFile) : tasks
    {
        print('*********************************************************' . "\r\n");
        print ("extractTasksFromFile: " . $taskFile . "\r\n");
        print('---------------------------------------------------------' . "\r\n");

        $this->clear ();

        try {
            $content = file_get_contents('data.txt'); //Get the file
            $lines = explode("\n", $content); //Split the file by each line

            foreach ($lines as $line) {

                $line =  trim($line);

                // ToDo use before each ? "/*" comments like lang manager

                // ignore comments
                if (!str_starts_with($line, '//')) {

                    $task = (new task())->extractTaskFromString(Trim($line));
                    $this->addTask ($task);
                }
            }

            // print ($this->tasksText ());

        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }


        return $this;
    }


    public function text4Line(): string
    {
        $OutTxt = "";

        foreach ($this->tasks as $task) {
            $OutTxt .= $task->text4Line () . ' ';
        }

        $OutTxt .= "\r\n";

        return $OutTxt;
    }


    public function text() : string
    {
        $OutTxt = "--- Tasks: ---" . "\r\n";

        $OutTxt .= "Tasks count: " . count($this->tasks) . "\r\n";

        foreach ($this->tasks as $task) {
            $OutTxt .= $task->text() . "\r\n";
        }

        return $OutTxt;
    }

	private function isTaskStart(string $tasksLine)
	{
		$isTask = false;

		$tasksLine = Trim($tasksLine);
		$checkPart = strtolower(substr ($tasksLine, 0,5));

		// /option1 /option2=xxx /option3="01teststring"
		if ($checkPart == 'task:') {
			$isTask = true;
		}

		return $isTask;
	}


} // task

/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "t:h12345";
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

//$tasksLine = '/option1 $optionLine = /option2=Option /option3="01_Xteststring"';
$tasksLine = "task:task00 "
    . 'task:task01 /option1 /option2=xxx /option3="01_Xteststring" '
    . 'task:task02 /optionX /option2=Y /optionZ="02_Zteststring" '
    ;
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
//$tasksLine = "task: ";
//$tasksLine = "task: ";
//$tasksLine = "task: ";
//$tasksLine = "task: ";
//$tasksLine = "task: ";
//$tasksLine = "task: ";
//$tasksLine = "task: ";


$taskFile="";
// $taskFile="./taskFile.cmd";

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 't':
			$srcFile = $option;
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

$oTasks = new tasks();

if ($tasksLine != '')
{
	$oTasksResult = $oTasks->extractTasksFromString($tasksLine);

	print ($oTasks->text () . "\r\n");
	print ('Line: "' . $oTasksResult->text4Line () . "'" . "\r\n");
}

if ($taskFile != '')
{
	$oTasksResult = $oTasks->extractTasksFromFile($taskFile);

	print ($oTasks->text() . "\r\n");
	print ('Line: "' . $oTasksResult->text4Line() . "'" . "\r\n");
}

print_end($start);

print ("--- end  ---" . "\n");

