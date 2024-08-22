<?php

namespace tasks;

// require "./option.php";
// require "./options.php";
require "./task.php";

use \DateTime;
// use DateTime;

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

        if (!empty ($option->name)) {
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
    public function extractTasksFromString($tasksString = "")
    {
        $this->clear ();

        try {
            //        $tasks = "task:task00"
            //            . 'task:task01 /option1 /option2=xxx /option3="01teststring"'
            //            . 'task:task02 /optionX /option2=Y /optionZ="Zteststring"';

            $tasksString = Trim($tasksString);
            if (!empty ($tasksString)) {

                $parts = explode("task:", $tasksString);

                foreach ($parts as $part) {

                    if (!empty($part)) {

                        $task = (new task())->extractTaskFromString(Trim($part));
                        $this->addTask ($task);
                    }

                }

                // print ($this->tasksText ());
            }

        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
    }

    // ToDO: A task may have more attributes like *.ext to
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


    public function textLine(): string
    {
        $OutTxt = "";

        foreach ($this->tasks as $task) {
            $OutTxt .= $task->textLine () . ' ';
        }

        $OutTxt .= "\r\n";

        return $OutTxt;
    }


    public function text()
    {
        $OutTxt = "--- Tasks: ---" . "\r\n";

        $OutTxt .= "Tasks count: " . count($this->tasks) . "\r\n";

        foreach ($this->tasks as $task) {
            $OutTxt .= $task->text() . "\r\n";
        }

        return $OutTxt;
    }


} // task

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

$options = getopt("s:d:h12345", []);
var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

$tasksLine = '/option1 $optionLine = /option2=Option /option3="01_Xteststring"';
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


// $taskFile="";
$taskFile=".\\taskFile.cmd";

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
$start = new DateTime();
print_header($start, $options, $inArgs);

$oTasks = new tasks();

$oTasksResult = $oTasks->extractTasksFromString($tasksLine);

print ($oTasks->text () . "\r\n");
print ('Line: "' . $oTasksResult->textLine () . "'" . "\r\n");

$oTasksResult = $oTasks->extractTasksFromFile($taskFile);

print ($oTasks->text () . "\r\n");
print ('Line: "' . $oTasksResult->textLine () . "'" . "\r\n");


print_end($start);

print ("--- end  ---" . "\n");

