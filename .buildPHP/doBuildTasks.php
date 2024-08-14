<?php

namespace DoBuildTasks;

require ".\\fileNamesList.php";

use \DateTime;
// use DateTime;
use FileNamesList\fileNamesList;

$HELP_MSG = <<<EOT
>>>
original class ...
<<<
EOT;


/*================================================================================
Class doBuildTasks
================================================================================*/

class doBuildTasks {

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

            print ($this->TasksText ());
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

    function executeTask($task="") {
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


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFileName ---" . "\r\n";


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

    // ToDO: create multiple tasks from string
    private function extractTasksFromString($tasksString = "")
    {
        $isTaskFound = false;
        $tasks = [];

        $tasksString = Trim($tasksString);
        if (! empty ($tasksString)) {

            $parts = explode("task:", $tasksString);

            foreach ($parts as $part) {

                if ( ! empty($part)) {

                    $tasks [] = extractTaskFromString ($part.Trim());
                }

            }

//            // one or more extension defined
//            if (count ($tasks) > 0) {
//                $isTaskFound = True;
//            }

        }

        return [$tasks];
    }

    // ToDO: A task may have more attributes like *.ext to
    private function extractTaskFromString($tasksString = "")
    {
        $task = null;

        // $taskName = '';
        $taskOptions = [];

// ToDo:        try{ ...}
//
        $tasksString = $tasksString.Trim ();

        // starts with task name
        $idx = strpos ($tasksString, " ");

        // name without options
        if ($idx == false) {
            $taskName = $tasksString;
        } else {
            // name with options
            $taskName = substr($tasksString, 0, $idx);
            $optionsString = substr($tasksString, $idx +1);
            $taskOptions = $this->extractOptionsFromString ($optionsString);
        }

        $task [$taskName] = $taskOptions;

        return [$task];
    }


    private function extractOptionsFromString($inOptionsString = "")
    {
        $options = [];


// ToDo:        try{ ...}

        $optionsString = Trim ($inOptionsString);

        while (str_starts_with($optionsString, '-')) {

            $optionName = '';
            $optionValue = '';

            $idx = strpos ($optionsString, " ");

            // name without options
            if ($idx == false) {
	            $optionName = $optionsString;
            } else {
                // name with options
	            $optionName = substr($optionsString, 0, $idx);
                $optionsString = substr($optionsString, $idx +1);
                $pptionsList = $this->extractOptionFromString ($optionsString);
            }




        }



        return $options;
    }


    private function extractOptionFromString($inOptionsString = "")
    {
        $options = [];


// ToDo:        try{ ...}

        $optionsString = Trim ($inOptionsString);

        while (str_starts_with($optionsString)) {

            $optionName = '';
            $optionValue = '';

            $idx = strpos ($optionsString, "=");

            // name without options
            if ($idx == false) {
	            $optionName = $optionsString;
            } else {
                // name with options
	            $optionName = substr($optionsString, 0, $idx);
                $optionsString = substr($optionsString, $idx +1);
                $pptionsList = $this->extractOptionsString ($optionsString);
            }




        }



        return $options;
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

$tasks = "";
$basePath = "";



foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$tasks = $option;
			break;

		case 'd':
			$basePath = $option;
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

$oDoBuildTasks = new doBuildTasks($tasks, $basePath);

$hasError = $oDoBuildTasks->executeTask();

if ($hasError) {

    print ("Error on function executeTask:" . $hasError);

} else {

    print ($oDoBuildTasks->text () . "\r\n");
}


print_end($start);

print ("--- end  ---" . "\n");

