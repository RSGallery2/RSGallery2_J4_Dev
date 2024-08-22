<?php

namespace options;

require "./option.php";

use \DateTime;
// use DateTime;

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
            print('*********************************************************' . "\r\n");
            print ("count $options: " . count ($options) . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->options = $options;
            
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
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

                // name without options
                if ($idx == false) {
                    $optionName = $optionsString;
                } else {
                    // name with options
                    $singleOption = substr($optionsString, 1, $idx);

                    $optionsString = substr($optionsString, $idx + 1);
                    $optionsString = Trim($optionsString);

                    $option = (new option())->extractOptionFromString($singleOption);
                    $this->addOption ($option);
                }
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

    public function textLine(): string
    {
        $OutTxt = " "; // . "\r\n";

        foreach ($this->options as $option) {
            $OutTxt .= $option->textLine() . " ";
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

$optionsLine = '/option1 $optionLine = /option2=Option /option3="01_Xteststring"';

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
$start = new DateTime();
print_header($start, $options, $inArgs);

$oOptions = new options();

$oOptionsResult = $oOptions->extractOptionsFromString($optionsLine);

print ($oOptions->text () . "\r\n");
print ('Line: "' . $oOptionsResult->textLine () . "'" . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

