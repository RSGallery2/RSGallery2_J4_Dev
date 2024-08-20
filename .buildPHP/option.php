<?php

namespace option;  

use \DateTime;
// use DateTime;


$HELP_MSG = <<<EOT
>>>
option class 

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class option
================================================================================*/

class option {

    public $name = "";
    public $value = "";


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($name="", $value="") {

        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("name: " . $name . "\r\n");
//            print ("value: " . $value . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            $this->name = $name;
            $this->value = $value;
			
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

//        print('exit __construct: ' . $hasError . "\r\n");
    }

    public function clear() : void
    {

        $this->name = '';
        $this->value = '';

    }

    public function extractOptionFromString($inOptionsString = "") : option
    {
        $this->clear();

        try {
            $optionsString = Trim($inOptionsString);

            // single: /optionName or /optionName=value or /optionName="optionValue"

            //$optionName = '';
            $optionValue = '';

            $idx = strpos($optionsString, "=");

            // name without options
            if ($idx == false) {
                $optionName = $optionsString;
            } else {
                // name with options
                $optionName = substr($optionsString, 0, $idx);
                $optionValue = substr($optionsString, $idx + 1);

            }

            $this->name = $optionName;
            $this->value = $optionValue;

        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
    }

    public function text4Line(): string
    {
        $OutTxt = " "; // . "\r\n";

        $OutTxt .= $this->name; // . "\r\n";
        if ($this->value != '') {
            $OutTxt .= '=' . $this->value; // . "\r\n";
        }

        return $OutTxt;
    }


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- option ---" . "\r\n";

        $OutTxt .= "name: " . $this->name . "\r\n";
        $OutTxt .= "value: " . $this->value . "\r\n";
	    /**
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
        /**/

        return $OutTxt;
    }


} // option

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

$options = getopt("o:h12345", []);
var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

$optionLine = '/option1';
$optionLine = '/option2=Option';
$optionLine = '/option3="01_Xteststring"';


foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 'o':
			$optionLine = $option;
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

$oOption = new option();

$oOptionResult = $oOption->extractOptionFromString($optionLine);

print ($oOption->text () . "\r\n");
print ('Line: "' . $oOptionResult->textLine () . "'" . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

