<?php

namespace task; // not used see tasksOptionsTest.php: add tasks and options *.php also

require "./option.php";
require "./options.php";


use \DateTime;
// use DateTime;

use option\option;
use options\options;

$HELP_MSG = <<<EOT
>>>
task class 

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class task
================================================================================*/

class task {

	public $name = "";

    public options $options;


	/*--------------------------------------------------------------------
	construction
	--------------------------------------------------------------------*/


    public function __construct($name = "", $options = "")
    {

        $this->name = $name;
        $this->options = $options;

    }

    public function clear() : void
    {

        $this->name = '';
        $this->options = new options();

    }

    public function extractTaskFromString($tasksString = "") : task
    {
        $this->clear ();

        try {
            $tasksString = Trim($tasksString);

            $taskName = '';
            $taskOptions = new options;

            // 'task01name /option1 /option2=xxx /option3="01teststring"'
            $idx = strpos($tasksString, " ");

            // name without options
            if ($idx == false) {
                $taskName = $tasksString;
            } else {
                // name with options
                $taskName = substr($tasksString, 0, $idx);
                $optionsString = substr($tasksString, $idx + 1);

                $taskOptions = (new options())->extractOptionsFromString($optionsString);
            }

            $this->name = $taskName;
            $this->options = $taskOptions;

        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
    }


    public function addOption (option $option) {

        $this->options->add ($option);

    }

    public function textLine(): string
    {
        $OutTxt = " "; // . "\r\n";
        
        $OutTxt .= $this->name . ' '; // . "\r\n";
        if (empty ($options->value != '')) {
            $OutTxt .= $this->options->text(); // . "\r\n";
        }

        return $OutTxt;
    }

    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- task ---" . "\r\n";

        $OutTxt .= "name: " . $this->name . "\r\n";
        $OutTxt .= "options: " . $OutTxt .= $this->options->text(); // . "\r\n";

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

$options = getopt("t:h12345", []);
var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

$taskLine = 'Task::task1';
//$taskLine = 'Task::task1 /option1 ';
//$taskLine = 'Task::task1 /option2=Option';
//$taskLine = 'Task::task1 /option3="01_Xteststring"';
//$taskLine = 'Task::task1 /option1 /option2=Option /option3="01_Xteststring"';

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 't':
            $taskLine = $option;
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

$oTask = new task();

$oTaskResult = $oTask->extractTaskFromString($taskLine);

print ($oTask->text () . "\r\n");
print ('Line: "' . $oTaskResult->textLine () . "'" . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

