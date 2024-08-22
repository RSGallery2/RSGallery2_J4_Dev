<?php

namespace options;

require_once "./commandLine.php";
require_once "./option.php";

// use DateTime;

use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

use option\option;


$HELP_MSG = <<<EOT
>>>
option class 

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class options
================================================================================*/

class options {

	/**
	 * @var option[] $options
	 */
    public $options;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($options = []) {

        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("count options: " . count ($options) . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            $this->options = $options;
            
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

//        print('exit __construct: ' . $hasError . "\r\n");
    }

    public function clear() : void
    {

        $this->options = [];

    }

    public function count() : int
    {

        return (count ($this->options));

    }


    public function addOption (option $option) : void {

        if ( ! empty ($option->name))
        {
            $this->options [$option->name] = $option;
        }
    }

    /*--------------------------------------------------------------------
    extractOptionsFromString
    --------------------------------------------------------------------*/

    public function extractOptionsFromString($inOptionsString = "") : options
    {
        $this->clear ();

        try {
            $optionsString = Trim($inOptionsString);

            // multiple: /optionName or /optionName=value or /optionName="optionValue"
            while ($this->hasOptionChar($optionsString)) {

                $idx = strpos($optionsString, " ");

                // last option
                if ($idx == false) {
	                $singleOption = $optionsString;

	                $optionsString = '';
                } else {
                    // multiple options
                    $singleOption = substr($optionsString, 0, $idx);

                    $optionsString = substr($optionsString, $idx + 1);
                    $optionsString = Trim($optionsString);
                }

	            $option = (new option())->extractOptionFromString($singleOption);
	            $this->addOption ($option);

            }
        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
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

    public function text4Line(): string
    {
        $OutTxt = ""; // . "\r\n";

        foreach ($this->options as $option) {
            $OutTxt .= " " . $option->text4Line();
        }

        return $OutTxt;
    }


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- options ---" . "\r\n";

        foreach ($this->options as $option) {
            $OutTxt .= $option->text() . " ";
        }

        return $OutTxt;
    }


} // options

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

$optionsLine = '/option1 /option2=01_Option /option3="02_Xteststring"';

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
        case 'o':
            $optionsLine = $option;
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

$oOptions = new options();

$oOptionsResult = $oOptions->extractOptionsFromString($optionsLine);

print ($oOptions->text () . "\r\n");
print ('Line: "' . $oOptionsResult->text4Line () . "'" . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

