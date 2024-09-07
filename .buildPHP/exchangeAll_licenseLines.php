<?php

namespace exchangeAll_licenseLines;

require_once "./iExecTask.php";
require_once "./fileHeaderByFileLine.php";


// use \DateTime;
use ExecuteTasks\executeTasksInterface;
use FileHeader\fileHeaderByFileLine;
use FileNamesList\fileNamesList;
use task\task;

/*================================================================================
Class exchangeAllLicenses
================================================================================*/

class exchangeAll_licenseLines implements executeTasksInterface {

    public string $srcRoot = "";
    public string $licenseText = "";

    /**
     * @var fileNamesList
     */
    public fileNamesList $fileNamesList;


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($srcRoot="", $licenseText="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("srcRoot: " . $srcRoot . "\r\n");
            print ("licenseText: " . $licenseText . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->srcRoot = $srcRoot;
            $this->licenseText = $licenseText;


        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }


    public function text() : string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- exchangeAll_LicenseLines ---" . "\r\n";


        $OutTxt .= "Not defined yet " . "\r\n";
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

                case 'licensetext':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->licenseText = $option->value;
                    break;

//				case 'X':
//					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;
//
//				case 'Y':
//					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;
//
//				case 'Z':
//					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
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

        $fileNamesList = new fileNamesList ($this->srcRoot, 'php');
        $this->fileNamesList = $fileNamesList;

        $fileNamesList->scan4Filenames();

        //--- use file header license task ----------------------

        $fileHeaderByFile = new fileHeaderByFileLine();

        //--- iterate over all files -------------------------------------

        foreach ($this->fileNamesList->fileNames as $fileName) {

            $fileHeaderByFile->exchangeLicense ( $fileName->srcPathFileName);

        }

        return (0);
    }

    public function executeFile(string $filePathName): bool
    {
        // TODO: Implement executeFile() method.

        return (0);
    }
} // exchangeAllLicenses

