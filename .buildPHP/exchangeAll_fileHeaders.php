<?php

namespace exchangeAll_fileHeaders;

require_once "./iExecTask.php";
require_once "./baseExecuteTasks.php";

require_once "./fileHeaderByFileData.php";


// use \DateTime;
use Exception;
use ExecuteTasks\executeTasksInterface;
use FileHeader\fileHeaderByFileData;
use FileNamesList\fileNamesList;
use task\task;

/*================================================================================
Class exchangeAll_fileHeaders
================================================================================*/

class exchangeAll_fileHeaders implements executeTasksInterface
{

    public string $srcRoot = "";
    /**
     * @var fileNamesList
     */
    public fileNamesList $fileNamesList;
    private bool $isNoRecursion = false;
    public readonly string $name;


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct($srcRoot = "")
    {
        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("srcRoot: " . $srcRoot . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            $this->srcRoot = $srcRoot;

            $this->fileNamesList = new fileNamesList();
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }


    public function text(): string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- exchangeAll_fileHeaders ---" . "\r\n";


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
                case 'srcroot':
                    print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->srcRoot = $option->value;
                    break;

                case 'isnorecursion':
                    print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->isNoRecursion = boolval($option->value);
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

        // files not set already use local file nam+es task
        if (count($this->fileNamesList->fileNames) == 0) {
            $fileNamesList = new fileNamesList ($this->srcRoot, 'php ts',
                '', $this->isNoRecursion);
            $this->fileNamesList = $fileNamesList;

            $fileNamesList->scan4Filenames();
        } else {
            // use given files
            // $fileNamesList = $this->fileNamesList;
        }

        //--- use file header author task ----------------------

        $fileHeaderByFileData = new fileHeaderByFileData();

        //--- iterate over all files -------------------------------------

        foreach ($this->fileNamesList->fileNames as $fileName) {
            $fileHeaderByFileData->upgradeHeader($fileName->srcPathFileName);
        }

        return (0);
    }
} // exchangeAll_fileHeaders

