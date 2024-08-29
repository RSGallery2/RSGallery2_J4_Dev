<?php

namespace forceVersionId;

require_once "./commandLine.php";

require_once "./iExecTask.php";

// use \DateTime;

use ExecuteTasks\executeTasksInterface;

use FileNamesList\fileNamesList;
use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;


$HELP_MSG = <<<EOT
>>>
class forceVersionId

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class forceVersionId
================================================================================*/

class forceVersionId implements executeTasksInterface
{

    private string $srcRoot='';
    private string $name='';

    private string $componentVersion='';

    // internal
    private string $manifestPathFileName = '';


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    // ToDo: a lot of parameters ....
	public function __construct($srcFile="", $dstFile="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("Construct forceVersionId: " . "\r\n");
//            print ("srcFile: " . $srcFile . "\r\n");
//            print ("dstFile: " . $dstFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

//            $this->srcFile = $srcFile;
//            $this->dstFile = $dstFile;


        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    // Task name with options
    public function assignTask (task $task) : int
    {
        $options = $task->options;

        foreach ($options->options as $option) {

            switch (strtolower($option->name)) {

                case 'srcroot':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->srcRoot = $option->value;
                    break;

                case 'name':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->name = $option->value;
                    break;

                case 'version':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->componentVersion = $option->value;
                    break;

                default:
                    print ('Execute Default task: ' . $option->name. "\r\n");
            } // switch

            // $OutTxt .= $task->text() . "\r\n";
        }

        return 0;
    }

    public function execute (): int // $hasError
    {
        print('*********************************************************' . "\r\n");
        print ("Execute forceVersionId : " . "\r\n");
        print('---------------------------------------------------------' . "\r\n");

        $hasError = $this->exchangeVersionId();

        return $hasError;
    }

    public function executeFile (string $filePathName) : bool // $isChanged
    {
        $hasError = 0;

        // $hasError = $this->exchangeVersionId ();

        return ($hasError);
    }

    /*--------------------------------------------------------------------
    funYYY
    --------------------------------------------------------------------*/

    function exchangeVersionId() {

        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeVersionId' . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $manifestPathFileName = $this->manifestPathFileName ();
            print ("manifestPathFileName: " . $manifestPathFileName . "\r\n");

            $componentVersion = $this->componentVersion;
            print ("version: " . $componentVersion . "\r\n");

            $hasError = $this->exchangeVersionInManifestFile ($manifestPathFileName, $componentVersion);
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeVersionId: ' . $hasError . "\r\n");
        return $hasError;
    }

    private function exchangeVersionInManifestFile(string $manifestFileName, string $strVersion)
    {
        $isSaved = false;

        try {

            $lines = file($manifestFileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {

                if ($isExchanged) {

                    $outLines [] = $line;
                } else {
                    // 	<version>5.0.12.4</version>
                    if (str_contains($line, '<version>')) {
                        $outLine = preg_replace('/(.*>)(.*)(<.*)/',
                            '${1}' . $strVersion . '${3}', $line);

                        $outLines [] = $outLine;

                        $isExchanged = true;
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

//            // prepare one string
//            $fileLines = implode("\n", $outLines);
//
//            // write to file
//            //$isSaved = File::write($manifestFileName, $fileLines);
//	        $isSaved = file_put_contents($manifestFileName, $fileLines);

//            // prepare one string
//            $fileLines = implode("", $outLines);
//
//            // write to file
//            //$isSaved = File::write($manifestFileName, $fileLines);
//	        $isSaved = file_put_contents($manifestFileName, $fileLines);

            // write to file
            //$isSaved = File::write($manifestFileName, $fileLines);
            $isSaved = file_put_contents($manifestFileName, $outLines);
        }
        catch(\Exception $e)
		{
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isSaved;
    }

    private function manifestPathFileName() : string
    {

        if ($this->manifestPathFileName == '') {
            $this->manifestPathFileName = $this->srcRoot . '/' . $this->name . '.xml';
        }

        return $this->manifestPathFileName;
    }


    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- forceVersionId ---" . "\r\n";


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


    public function assignFilesNames(fileNamesList $fileNamesList)
    {
        // TODO: Implement assignFilesNames() method.
    }
} // forceVersionId

/*================================================================================
main (used from command line)
================================================================================*/

$optDefinition = "s:d:h12345";
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

$tasksLine = ' task:forceVersionId'
    . ' /srcRoot="./../../RSGallery2_J4"'
    . ' /name=rsgallery2'
//    . ' /extension=RSGallery2'
    . ' /version="5.0.12.4"'
;

foreach ($options as $idx => $option)
{
	print ("idx: " . $idx . "\r\n");
	print ("option: " . $option . "\r\n");

	switch ($idx)
	{
		case 's':
			$srcFile = $option;
			break;

		case 'd':
			$dstFile = $option;
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

$task = new task();
$task->extractTaskFromString($tasksLine);

$oForceVersionId = new forceVersionId();

$hasError = $oForceVersionId->assignTask($task);
if ($hasError) {
    print ("Error on function assignTask:" . $hasError);
}
if ( ! $hasError) {

    $hasError = $oForceVersionId->execute();
    if ($hasError) {
        print ("Error on function execute:" . $hasError);
    }
}

print_end($start);

print ("--- end  ---" . "\n");

