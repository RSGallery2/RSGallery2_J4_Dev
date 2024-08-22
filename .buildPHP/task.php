<?php

namespace task; // not used see tasksOptionsTest.php: add tasks and options *.php also

require_once "./commandLine.php";
require_once "./option.php";
require_once "./options.php";

// use DateTime;

use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

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


    public function __construct()
    {
        $this->clear ();
    }

    public function __construct1(string $name, options $options)
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

        $this->options->addOption ($option);

    }

    public function text4Line(): string
    {
        $OutTxt = "task:"; // . "\r\n";
        
        $OutTxt .= $this->name; // . "\r\n";
        if ($this->options->count() > 0) {
            $OutTxt .= $this->options->text4Line(); // . "\r\n";
        }
	    // -> tasks: $OutTxt .= " "; // . "\r\n";

        return $OutTxt;
    }

    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- task ---" . "\r\n";

        $OutTxt .= "name: " . $this->name . "\r\n";
	    if ($this->options->count() > 0)
	    {
		    $OutTxt .= "options: " . $OutTxt .= $this->options->text(); // . "\r\n";
	    }

        return $OutTxt;
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

$taskLine = 'Task::task1';
$taskLine = 'Task::task1 /option1 ';
//$taskLine = 'Task::task1 /option2=Option';
//$taskLine = 'Task::task1 /option3="01_Xteststring"';
$taskLine = 'Task::task1 /option1 /option2=Option /option3="01_Xteststring"';

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
$start = print_header($options, $inArgs);

$oTask = new task();

$oTaskResult = $oTask->extractTaskFromString($taskLine);

print ($oTask->text () . "\r\n");
print ('Line: "' . $oTaskResult->text4Line () . "'" . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

