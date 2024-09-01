<?php

namespace FileHeader;

require_once "./fileHeader.php";

//use \DateTime;
// use DateTime;

use FileHeader\fileHeader;
use task\task;
use tasks\tasks;

/*================================================================================
Class fileHeaderByFile
================================================================================*/

class fileHeaderByFile extends fileHeader {

    //
    public fileHeader $oByFile;

    public string $pathFileName;

    /**
     * @var string array
     */
    public $originalLines =  [];

    public bool $isValid = false;

    public int $idxFirstLine = 0;
    public int $idxLastLine = 0;

    public task $task;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct($srcFile="") {

        parent::__construct();

        // dummy
        $this->oByFile = new fileHeader();

        $this->pathFileName = $srcFile;
    }


    /*--------------------------------------------------------------------
    exchangeLicense
    --------------------------------------------------------------------*/

    function exchangeLicense(string $fileName="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeLicense' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if ( ! empty ($fileName)) {

                $this->pathFileName = $fileName;

            }  else {

                $fileName = $this->pathFileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;
            $licenseLine = $this->license;

            foreach ($lines as $line) {

                if ($isExchanged) {

                    $outLines [] = $line;
                } else {
                    //  * @license     GNU General Public License version 2 or la ....
                    if (str_contains($line, '@license')) {

                        $outLines [] = $licenseLine;

                        $isExchanged = true;
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            $isSaved = file_put_contents($fileName, $outLines);
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeLicense: ' . $hasError . "\r\n");
        return $hasError;
    }


    /*--------------------------------------------------------------------
    exchangeLicense
    --------------------------------------------------------------------*/

    function extendCopyrightYear(string $fileName="", string $toYear='') {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('extendCopyrightYear' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print ("Up to year in: " . $toYear . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if ( ! empty ($fileName)) {

                $this->pathFileName = $fileName;

            }  else {

                $fileName = $this->pathFileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            if (empty ($toYear)) {

                $date_format        = 'Y';
                $toYear = date ($date_format);
            }
            print ("Up to year use: " . $toYear . "\r\n");


            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {

                if ($isExchanged) {

                    $outLines [] = $line;
                } else {
                    //   * @copyright (c)  2020-2022 Team
                    if (str_contains($line, '@copyright')) {

                        //  * @copyright (c)  2020-2022 Team
                        // $outLine = preg_replace('/(.*\d+\-)(.* ?)(.*)/',
                        $outLine = preg_replace('/(.* \d+-)(\d+)(.*)/',
                            '${1}' . $toYear . '${3}', $line);

                        $outLines [] = $outLine;
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            $isSaved = file_put_contents($fileName, $outLines);
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeLicense: ' . $hasError . "\r\n");
        return $hasError;
    }

    /*--------------------------------------------------------------------
    extractHeaderFromFile
    --------------------------------------------------------------------*/

    function extractHeaderFromFile(string $fileName="") {

        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('extractFileHeader' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if ( ! empty ($fileName)) {

                $this->pathFileName = $fileName;

            }  else {

                $fileName = $this->pathFileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);

            $headerLines =  [];

            $isHasStart = false;
            $isHasEnd = false;
            $isValid = false;

            $idx = 0;
            $idxFirstLine = 0;
            $idxLastLine = 0;
            $maxIdx = 30;

            foreach ($lines as $line) {

                if (str_starts_with(trim ($line), '/**')) {
                    $isHasStart = true;
                    $idxFirstLine = $idx;
                }

                if ($isHasStart ){

                    $headerLines [] = $line;

                    if (str_contains($line,'@package')){
                        $isValid = true;
                    }

                }

                // exit on valid section  (containing @package)
                if (str_contains(trim ($line), ' */')) {

                    // comment before comment ?
                    if (!$isValid) {
                        $isHasStart = false;
                        $headerLines = [] ;

                    } else {
                        // valid section
                        $idxLastLine = $idx;
                        $isHasEnd = true;
                        break;
                    }
                }

                $idx++;
                //$idxLastLine = $idx;

                // must be within first lines
                if ($idx > $maxIdx) {
                    break;
                }
            } // for lines n section


            $this->extractHeaderFromFileLines ($headerLines);

            // todo: print ("headerLines: " . $headerLines . "\r\n");
            // ToDo: print result
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit extractFileHeader: ' . $hasError . "\r\n");
        return $hasError;
    }

    /*--------------------------------------------------------------------
    extractHeaderFromFileLines
    --------------------------------------------------------------------*/

    function extractHeaderFromFileLines(array $lines = []) {

        $hasError = 0;

        $this->additionalLines = [];

        try {
            print('*********************************************************' . "\r\n");
            print('extractHeaderFromFileLines' . "\r\n");
            print ("lines in: " . count ($lines) . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            // ToDo: Init write to log file with actual name
            foreach ($lines as $line) {

                [$name, $value] = $this->extractHeaderLine ($line);

                if ( ! empty ($name)) {

                    switch ($name) {

                        case 'package':
                            $this->package = $value;
                            break;
                        case 'subpackage':
                            $this->subpackage = $value;
                            break;
                        case 'copyright':
                            $this->copyright = $value;
                            break;
                        case 'license':
                            $this->license = $value;
                            break;
                        case 'author':
                            $this->author = $value;
                            break;
                        case 'link':
                            $this->link = $value;
                           break;

                        default:
                            $this->additionalLines [] = $line;

                            break;
                    }
                }

            } // for lines n section

//            // ToDo: Write to log file with actual name
//            print ('!!! additional header line found: "' . $name . '" !!!' . "\r\n");
//            if (count ($this->adittionalLines)) {
//
//            }
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit extractFileHeader: ' . $hasError . "\r\n");
        return $hasError;
    }

    private function extractHeaderLine(mixed $line)
    {
        $name = '';
        $value = '';

        //  * @copyright (c) 2005-2024 RSGallery2 Team
        $atIdx = strpos($line, '@');
        if ( ! empty($atIdx)){
            $blankIdx = strpos($line, ' ', $atIdx+1);

            $name = substr($line, $atIdx+1, $blankIdx - $atIdx - 1);
            $name = trim($name);
            $value = substr($line, $blankIdx + 1);
            $value = trim($value);
        }

        return [$name, $value];
    }



    public function assignTask(\task\task $task)
    {
        $this->task = $task;

//        $options = $task->options;
//
//        foreach ($options->options as $option) {
//
//            switch (strtolower($option->name)) {
//
//                case 'srcroot':
//                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
//                    $this->srcRoot = $option->value;
//                    break;

    }

    public function execute()
    {
        $task = $this->task;
        switch (strtolower($task->name)) {

            case 'exchangelicense':
                print ('Execute task: ' . $task->name);

                $options = $task->options;
                $fileName = $options->getOption ('fileName');
                $this->exchangeLicense($fileName);
                break;

            case 'extendcopyrightyear':
                print ('Execute task: ' . $task->name);

                $options = $task->options;
                $fileName = $options->getOption ('fileName');
                $copyrightDate = $options->getOption ('copyrightDate');

                $this->extendCopyrightYear($fileName, $copyrightDate);
                break;

            case 'BexchangeLicense':
                print ('Execute task: ' . $task->name);


                break;

            case 'CexchangeLicense':
                print ('Execute task: ' . $task->name);


                break;

            default:
                print ('!!! Task not executed: ' . $task->name . '!!!');

                break;
        }

    }






    public function byFileText()
    {
        $OutTxt = "";
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fileHeaderByFile ---" . "\r\n";

        $OutTxt .= ">>> --- result ----------------" . "\r\n";

        $OutTxt .= $this->text() . "\r\n";

        $OutTxt .= ">>> --- file data ----------------" . "\r\n";

        $OutTxt .= "fileName: " . $this->pathFileName . "\r\n";
        $OutTxt .= $this->oByFile->text();

        $OutTxt .= ">>> --- file lines ----------------" . "\r\n";

        $OutTxt .= "fileName: " . $this->pathFileName . "\r\n";

        return $OutTxt;
    }

} // fileHeaderByFile

