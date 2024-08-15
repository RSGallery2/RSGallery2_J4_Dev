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

    // extract multiple tasks from string
    public function extractTasksFromString($tasksString = "")
    {
        $isTaskFound = false;
        $tasks = [];

        try {
//        $tasks = "task:task00"
//            . 'task:task01 /option1 /option2=xxx /option3="01teststring"'
//            . 'task:task02 /optionX /option2=Y /optionZ="Zteststring"';

            $tasksString = Trim($tasksString);
            if (!empty ($tasksString)) {

                $parts = explode("task:", $tasksString);

                foreach ($parts as $part) {

                    if (!empty($part)) {

                        $tasks [] = extractTaskFromString($part . Trim());
                    }

                }

//            // one or more extension defined
//            if (count ($tasks) > 0) {
//                $isTaskFound = True;
//            }

            }
        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $tasks;
    }

    // ToDO: A task may have more attributes like *.ext to
    public function extractTasksFromFile(string $taskFile)
    {
        $hasError = 0;

        try {
            $content = file_get_contents('data.txt'); //Get the file
            $lines = explode("\n", $content); //Split the file by each line

            foreach ($lines as $line) {

                $line = $line . trim();

                // ignore comments
                // ToDo use before each ? "/*" comments like lang manager
                if (!str_starts_with('//')) {
                    $hasError = extractTaskFromString($line);
                }

                if ($hasError != 0) {
                    break;
                }
            }
        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }


        return $hasError;
    }

    private function extractTaskFromString($tasksString = "")
    {
        $task = "?"; // ToDo: empty ?

        try {
            // $taskName = '';
            $taskOptions = [];

            $tasksString = $tasksString . Trim();

            // 'task:task01 /option1 /option2=xxx /option3="01teststring"'
            $idx = strpos($tasksString, " ");

            // name without options
            if ($idx == false) {
                $taskName = $tasksString;
            } else {
                // name with options
                $taskName = substr($tasksString, 0, $idx);
                $taskOptions = $this->extractOptionsFromString($optionsString);

                $optionsString = substr($tasksString, $idx + 1);
            }

            $task [$taskName] = $taskOptions;

            return $task;
        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

    }


    private function extractOptionsFromString($inOptionsString = "")
    {
        $options = [];

        try {
            $optionsString = Trim($inOptionsString);

            // /option or /option=xxx or /option="01teststring"
            while ($this->hasOptionChar($optionsString)) {

                $optionName = '';
                $optionValue = '';

                $idxNextOption = strpos($optionsString, " ");

                // name without options
                if ($idxNextOption == false) {
                    $optionName = $optionsString;
                } else {
                    // name with options
                    $optionName = substr($optionsString, 0, $idx);

                    $optionsString = substr($optionsString, $idx + 1);
                    $optionsString = Trim($optionsString);

                    $optionsList = $this->extractOptionFromString($optionsString);

                }
            }
        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $options;
    }


    private function extractOptionFromString($inOptionsString = "")
    {
        $option = '?'; // ToDo: empty

        try {
            $optionsString = Trim($inOptionsString);

            // /option1 or /option2=xxx or /option3="01teststring"'

            while (str_starts_with($optionsString)) {

                $optionName = '';
                $optionValue = '';

                $idx = strpos($optionsString, "=");

                // name without options
                if ($idx == false) {
                    $optionName = $optionsString;
                } else {
                    // name with options
                    $optionName = substr($optionsString, 0, $idx);
                    $optionsString = substr($optionsString, $idx + 1);
                    $pptionsList = $this->extractOptionsString($optionsString);
                }


            }
        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $option;
    }

    private function hasOptionChar(string $inOptionsString)
    {
        $isOption = false;

        $optionsString = Trim($inOptionsString);

        // /option1 /option2=xxx /option3="01teststring"
        if (str_starts_with($optionsString, '/')) {
            $isOption = true;
        }

        // -option1 -option2=xxx -option3="01teststring"
        if (str_starts_with($optionsString, '-')) {
            $isOption = true;
        }

        return $isOption;
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
    . 'task:task01 /option1 /option2=xxx /option3="01teststring"'
    . 'task:task02 /optionX /option2=Y /optionZ="Zteststring"'
;

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

