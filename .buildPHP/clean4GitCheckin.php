<?php

namespace clean4GitCheckin;

require_once "./iExecTask.php";
require_once "./fileHeaderByFileLine.php";


// use \DateTime;
use ExecuteTasks\executeTasksInterface;
use FileHeader\fileHeaderByFileLine;
use FileNamesList\fileNamesList;
use task\task;

/*================================================================================
Class clean4GitCheckin
================================================================================*/

class clean4GitCheckin implements executeTasksInterface {

    public string $srcRoot = "";

    /**
     * @var fileNamesList
     */
    public fileNamesList $fileNamesList;


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($srcRoot="") {

        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("srcRoot: " . $srcRoot . "\r\n");
//            print ("linkText: " . $linkText . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            $this->srcRoot = $srcRoot;

            $this->fileNamesList = new fileNamesList();
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        // print('exit __construct: ' . $hasError . "\r\n");
    }


    public function text() : string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- clean4GitCheckin ---" . "\r\n";


        $OutTxt .= "Not defined yet " . "\r\n";
        /**
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
        /**/

        return $OutTxt;
    }


    public function assignFilesNames(fileNamesList $fileNamesList)
    {
        $this->fileNamesList = $fileNamesList;

    }

    // Task name with options
    public function assignTask (task $task) : int
    {
        $options = $task->options;

        foreach ($options->options as $option) {

            switch (strtolower($option->name)) {

                case 'srcroot':
                     print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                     $this->srcRoot = $option->value;
                    break;

//                case 'Xlinktext':
//                    // print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//                    // $this->linkText = $option->value;
//                    break;
//
//				case 'X':
//					print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;
//
//				case 'Y':
//					print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;
//
//				case 'Z':
//					print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;

                default:
                    print ('Execute Default task: ' . $option->name. "\r\n");
            } // switch

            // $OutTxt .= $task->text() . "\r\n";
        }

        return 0;
    }

    public function execute(): int
    {
        //--- collect files ---------------------------------------

        // files not set already
        if (count($this->fileNamesList->fileNames) == 0) {
            $fileNamesList = new fileNamesList ($this->srcRoot, '');
            $this->fileNamesList = $fileNamesList;

            $fileNamesList->scan4Filenames();
        } else {
            // use given files
            // $fileNamesList = $this->fileNamesList;
        }

        //--- iterate over all files -------------------------------------

        foreach ($this->fileNamesList->fileNames as $fileName) {

            $this->trimFile ($fileName->srcPathFileName);

        }

        return (0);
    }

    public function executeFile(string $filePathName): int
    {
        // create a one file 'fileNamesList' object
        $this->fileNamesList = new fileNamesList();
        $this->fileNamesList[] = $filePathName;

        $this->execute();

        return (0);
    }

    private function trimFile(string $fileName) : bool
    {
        $isExchanged = false;

        try {

            $lines = file($fileName);
            $outLines = [];

            // all lines
            foreach ($lines as $line) {

                if ($isExchanged) {
                    $outLines [] = rtrim($line) . "\r\n";
                } else {
                    $trimmed = rtrim($line) . "\r\n";
                    $outLines [] = $trimmed;

                    if (strlen ($trimmed) < strlen($line)) {
                        $isExchanged = true;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isExchanged;
    }

} // clean4GitCheckin

