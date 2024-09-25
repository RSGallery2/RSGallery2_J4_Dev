<?php

namespace exchangeAll_actCopyrightYear;

require_once "./iExecTask.php";
require_once "./baseExecuteTasks.php";
require_once "./fileHeaderByFileLine.php";


// use \DateTime;
use Exception;
use ExecuteTasks\baseExecuteTasks;
use ExecuteTasks\executeTasksInterface;
use FileHeader\fileHeaderByFileLine;
use FileNamesList\fileNamesList;
use task\task;

/*================================================================================
Class exchangeAll_actCopyrightYear
================================================================================*/

class exchangeAll_actCopyrightYearLines extends baseExecuteTasks
    implements executeTasksInterface
{
    public string $yearText = "";
    /**
     * @var fileNamesList
     */

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct($srcRoot = "", $isNoRecursion=false, $yearText = "")
    {
        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("srcRoot: " . $srcRoot . "\r\n");
//            print ("yearText: " . $yearText . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            parent::__construct ($srcRoot, $isNoRecursion);

            $this->yearText = $yearText;

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }


    public function text(): string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- exchangeAll_actCopyrightYearLines ---" . "\r\n";


        $OutTxt .= "Not defined yet " . "\r\n";

        /**
         * $OutTxt .= "fileName: " . $this->fileName . "\r\n";
         * $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
         * $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
         * $OutTxt .= "filePath: " . $this->filePath . "\r\n";
         * $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
         * /**/

        return $OutTxt;
    }


    public function assignFilesNames(fileNamesList $fileNamesList)
    {
        $this->fileNamesList = $fileNamesList;
    }

    // Task name with options
    public function assignTask(task $task): int
    {
        $options = $task->options;

        foreach ($options->options as $option) {
            switch (strtolower($option->name)) {

                // ToDo: handle 'srcroot' and 'isnorecursion' in base class
                case 'srcroot':
                    print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->srcRoot = $option->value;
                    break;

                case 'isnorecursion':
                    print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->isNoRecursion = boolval($option->value);
                    break;

                case 'yeartext':
                    print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->yearText = $option->value;
                    break;

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
                    print ('!!! error required option is not supported: ' . $task->name . '.' . $option->name . ' !!!' . "\r\n");
            } // switch

            // $OutTxt .= $task->text() . "\r\n";
        }

        return 0;
    }

    public function executeFile(string $filePathName): int
    {
        // create a one file 'fileNamesList' object
        $this->fileNamesList = new fileNamesList();
        $this->fileNamesList[] = $filePathName;

        $this->execute();

        return (0);
    }

    public function execute(): int
    {
        //--- collect files ---------------------------------------

        // files not set already
        if (count($this->fileNamesList->fileNames) == 0) {
            $fileNamesList = new fileNamesList ($this->srcRoot, 'php',
                '', $this->isNoRecursion);
            $this->fileNamesList = $fileNamesList;

            $fileNamesList->scan4Filenames();
        } else {
            // use given files
            // $fileNamesList = $this->fileNamesList;
        }

        //--- use file header license task ----------------------

        $fileHeaderByFileLine = new fileHeaderByFileLine();

        //--- iterate over all files -------------------------------------

        foreach ($this->fileNamesList->fileNames as $fileName) {
            $fileHeaderByFileLine->exchangeActCopyrightYear(
                $fileName->srcPathFileName,
                $this->yearText,
            );
        }

        return (0);
    }
} // exchangeAll_actCopyrightYear

