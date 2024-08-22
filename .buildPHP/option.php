<?php

namespace option;

require_once "./commandLine.php";

// use DateTime;

use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

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

				// Just name
                $optionName = substr($optionsString, 1);
            } else {

                // name with options
                $optionName = substr($optionsString, 1, $idx - 1);
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
        $OutTxt = "/"; // . "\r\n";

        $OutTxt .= $this->name; // . "\r\n";
        if ($this->value != '') {
            $OutTxt .= "=" . $this->value; // . "\r\n";
        }

        return $OutTxt;
    }


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- option ---" . "\r\n";

        $OutTxt .= "name: " . $this->name . "\r\n";
        $OutTxt .= "value: " . "'" . $this->value . "'" . "\r\n";
	    /**
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
        /**/

        return $OutTxt;
    }


} // option

/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "o:h12345";
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

//$optionLine = '/option1';
$optionLine = '/option2=02_Option';
//$optionLine = '/option3="01_Xteststring"';


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
$start = print_header($options, $inArgs);

$oOption = new option();

$oOptionResult = $oOption->extractOptionFromString($optionLine);

print ($oOption->text () . "\r\n");
print ("Line: '" . $oOptionResult->text4Line () . "'" . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

