<?php

namespace FileHeader;

require_once "./fileHeaderData.php";

//use \DateTime;
// use DateTime;

use Exception;
use task\task;

/*================================================================================
Class fileHeaderByFile
================================================================================*/

class fileHeaderByFileLine extends fileHeaderData
{

    //
    // public fileHeaderData $oByFile;

    public string $fileName;

    /**
     * @var string array
     */
    public $originalLines = [];

    public bool $isValid = false;

    public int $idxFirstLine = 0;
    public int $idxLastLine = 0;

    public task $task;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct($srcFile = "")
    {
        parent::__construct();

        // dummy
        //$this->oByFile = new fileHeaderData();

        $this->fileName = $srcFile;
    }


    /*--------------------------------------------------------------------
    exchangePackage
    --------------------------------------------------------------------*/

    function exchangePackage(string $fileName = "")
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangePackage' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //  * @package  ....
                    if (str_contains($line, '@package')) {

                        $packageLine = $this->replacePackageLine($line);

                        if ($line != $packageLine) {
                            $outLines [] = $packageLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed , no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangePackage: ' . $hasError . "\r\n");

        return $hasError;
    }


    /*--------------------------------------------------------------------
    exchangeSubPackage
    --------------------------------------------------------------------*/

    function exchangeSubPackage(string $fileName = "")
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeSubPackage' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;
            $isFound = false;
            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //  ToDo:
                    if (str_contains($line, '@subpackage')) {
                        $isFound = true;

                        $subPackageLine = $this->replaceSubPackageLine($line);

                        if ($line != $subPackageLine) {
                            $outLines [] = $subPackageLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed , no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            } else {
                // insert if not found
                if ($isFound == false) {
                    $this->insertSubPackage();
                }
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeSubPackage: ' . $hasError . "\r\n");

        return $hasError;
    }

    /*--------------------------------------------------------------------
    insertSubPackage
    --------------------------------------------------------------------*/

    function insertSubPackage(string $fileName = "")
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeSubPackage' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;
            $isFound = false;

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //  ToDo:
                    if (str_contains($line, '@package')) {
                        $subPackageLine = $this->replaceSubPackageLine($line);

                        if ($line != $subPackageLine) {
                            $outLines [] = $subPackageLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed , no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit insertSubPackage: ' . $hasError . "\r\n");

        return $hasError;
    }


    /*--------------------------------------------------------------------
    exchangeLicense
    --------------------------------------------------------------------*/

    function exchangeLicense(string $fileName = "")
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeLicense' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //  * @license     GNU General Public License version 2 or la ....
                    if (str_contains($line, '@license')) {

                        $isFound = true;

                        $licenseLine = $this->replaceLicenseLine($line);

                        if ($line != $licenseLine) {
                            // assign standard
                            $outLines [] = $licenseLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed , no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeLicense: ' . $hasError . "\r\n");

        return $hasError;
    }


    /*--------------------------------------------------------------------
    exchangeActCopyrightYear
    --------------------------------------------------------------------*/

    function exchangeActCopyrightYear(string $fileName = "", string $toYear = '')
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeActCopyrightYear' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print ("Up to year in: " . $toYear . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            if (empty ($toYear)) {
                $date_format = 'Y';
                $toYear = date($date_format);
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

                        $copyrightLine = $this->replaceActCopyrightLine($line, $toYear);

                        if ($line != $copyrightLine) {
                            $outLines [] = $copyrightLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed, no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeActCopyrightYear: ' . $hasError . "\r\n");

        return $hasError;
    }

    /*--------------------------------------------------------------------
    exchangeSinceCopyrightYear
    --------------------------------------------------------------------*/
    public function exchangeSinceCopyrightYear(string $fileName, string $sinceYear)
    {
        // ToDo: create exchangeSinceCopyrightYear function

//        throw new Exception("test before use: ??? overwrite valid ...");

        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeSinceCopyrightYear' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print ("Since year in: " . $sinceYear . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            if (empty ($sinceYear)) {
                $date_format = 'Y';
                $sinceYear = date($date_format);
            }
            print ("Since year use: " . $sinceYear . "\r\n");


            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //   * @copyright (c)  2020-2022 Team
                    if (str_contains($line, '@copyright')) {

                        $copyrightLine = $this->replaceSinceCopyrightLine($line, $sinceYear);

                        if ($line != $copyrightLine) {
                            $outLines [] = $copyrightLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed, no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeSinceCopyrightYear: ' . $hasError . "\r\n");

        return $hasError;
    }


    /*--------------------------------------------------------------------
    exchangeAuthor
    --------------------------------------------------------------------*/

    function exchangeAuthor(string $fileName = "")
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeAuthor' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //  * @author     ...
                    if (str_contains($line, '@author')) {

                        $authorLine = $this->replaceAuthorLine($line);

                        // assign standard
                        if ($line != $authorLine) {
                            $outLines [] = $authorLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed , no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch
        (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeAuthor: ' . $hasError . "\r\n");

        return $hasError;
    }

    /*--------------------------------------------------------------------
    exchangeLink
    --------------------------------------------------------------------*/

    function exchangeLink(string $fileName = "")
    {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeLink' . "\r\n");
            print ("FileName in: " . $fileName . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            if (!empty ($fileName)) {
                $this->fileName = $fileName;
            } else {
                $fileName = $this->fileName;
            }
            print ("FileName use: " . $fileName . "\r\n");

            $lines = file($fileName);
            $outLines = [];
            $isExchanged = false;

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    //  * @link
                    if (str_contains($line, '@link')) {

                        $LinkLine = $this->replaceLinkLine($line);

                        if ($line != $LinkLine) {
                            $outLines [] = $LinkLine;
                            $isExchanged = true;
                        } else {
                            // line already fixed , no file write
                            break;
                        }
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

            // write to file
            if ($isExchanged == true) {
                $isSaved = file_put_contents($fileName, $outLines);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeLink: ' . $hasError . "\r\n");

        return $hasError;
    }

//    /*--------------------------------------------------------------------
//    extractHeaderFromFile
//    --------------------------------------------------------------------*/
//
//    function extractHeaderFromFile(string $fileName = ""): int
//    {
//        $hasError = 0;
//
//        try {
//            print('*********************************************************' . "\r\n");
//            print('extractFileHeader' . "\r\n");
//            print ("FileName in: " . $fileName . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");
//
//            if (!empty ($fileName)) {
//                $this->fileName = $fileName;
//            } else {
//                $fileName = $this->fileName;
//            }
//            print ("FileName use: " . $fileName . "\r\n");
//
//            $lines = file($fileName);
//
//            $headerLines = [];
//            $originalLines = [];
//            $this->isValid = false;
//
//            $isHasStart = false;
//            $isHasEnd = false;
//            $isValid = false;
//
//            $idx = 0;
//            $idxFirstLine = 0;
//            $idxLastLine = 0;
//            $maxIdx = 30;
//
//            foreach ($lines as $line) {
//                if (str_starts_with(trim($line), '/**')) {
//                    $isHasStart = true;
//                    $idxFirstLine = $idx;
//                }
//
//                if ($isHasStart) {
//                    // keep original
//                    $originalLines [] = $line;
//
//                    $headerLines [] = $line;
//
//                    if (str_contains($line, '@package')) {
//                        $isValid = true;
//                    }
//                }
//
//                // exit on valid section  (containing @package)
//                if (str_contains(trim($line), ' */')) {
//                    // comment before comment ?
//                    if (!$isValid) {
//                        $isHasStart = false;
//                        $headerLines = [];
//                    } else {
//                        // valid section
//                        $idxLastLine = $idx;
//                        $isHasEnd = true;
//                        break;
//                    }
//                }
//
//                $idx++;
//                //$idxLastLine = $idx;
//
//                // must be within first lines
//                if ($idx > $maxIdx) {
//                    break;
//                }
//            } // for lines n section
//
//            $this->originalLines = $originalLines;
//
//            if ($isHasEnd) {
//                $this->extractHeaderFromFileLines($headerLines);
//                $this->isValid = true;
//
//                $this->idxFirstLine = $idxFirstLine;
//                $this->idxLastLine = $idxLastLine;
//            }
//
//            // todo: print ("headerLines: " . $headerLines . "\r\n");
//            // ToDo: print result
//        } catch (Exception $e) {
//            echo 'Message: ' . $e->getMessage() . "\r\n";
//            $hasError = -101;
//        }
//
//        print('exit extractFileHeader: ' . $hasError . "\r\n");
//
//        return $hasError;
//    }
//
//    /*--------------------------------------------------------------------
//    extractHeaderFromFileLines
//    --------------------------------------------------------------------*/
//
//    function extractHeaderFromFileLines(array $lines = [])
//    {
//        $hasError = 0;
//
//        $this->additionalLines = [];
//
//        try {
//            print('*********************************************************' . "\r\n");
//            print('extractHeaderFromFileLines' . "\r\n");
//            print ("lines in: " . count($lines) . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");
//
//            // ToDo: Init write to log file with actual name
//            foreach ($lines as $line) {
//                [$name, $value] = $this->extractHeaderLine($line);
//
//                if (!empty ($name)) {
//                    switch ($name) {
//                        case 'package':
//                            $this->package = $value;
//                            break;
//                        case 'subpackage':
//                            $this->subpackage = $value;
//                            break;
//                        case 'copyright':
//                            $this->copyright = $value;
//                            break;
//                        case 'license':
//                            $this->license = $value;
//                            break;
//                        case 'author':
//                            $this->author = $value;
//                            break;
//                        case 'link':
//                            $this->link = $value;
//                            break;
//
//                        default:
//                            $this->additionalLines [] = $line;
//
//                            break;
//                    }
//                }
//            } // for lines n section
//
////            // ToDo: Write to log file with actual name
////            print ('!!! additional header line found: "' . $name . '" !!!' . "\r\n");
////            if (count ($this->adittionalLines)) {
////
////            }
//        } catch (Exception $e) {
//            echo 'Message: ' . $e->getMessage() . "\r\n";
//            $hasError = -101;
//        }
//
//        print('exit extractFileHeader: ' . $hasError . "\r\n");
//
//        return $hasError;
//    }
//
//    private function extractHeaderLine(mixed $line)
//    {
//        $name = '';
//        $value = '';
//
//        //  * @copyright (c) 2005-2024 RSGallery2 Team
//        $atIdx = strpos($line, '@');
//        if (!empty($atIdx)) {
//            $blankIdx = strpos($line, ' ', $atIdx + 1);
//
//            $name = substr($line, $atIdx + 1, $blankIdx - $atIdx - 1);
//            $name = trim($name);
//            $value = substr($line, $blankIdx + 1);
//            $value = trim($value);
//        }
//
//        return [$name, $value];
//    }


    public function assignTask(task $task)
    {
        $this->task = $task;

//        $options = $task->options;
//
//        foreach ($options->options as $option) {
//
//            switch (strtolower($option->name)) {
//
//                case 'srcroot':
//                    print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//                    $this->srcRoot = $option->value;
//                    break;

    }

    public function execute()
    {
        $task = $this->task;
        switch (strtolower($task->name)) {
            case 'exchangepackage':
                print ('Execute task: ' . $task->name . "\r\n");


                break;

            case 'exchangesubpackage':
                print ('Execute task: ' . $task->name . "\r\n");


                break;

            case 'exchangelicense':
                print ('Execute task: ' . $task->name . "\r\n");

                $options = $task->options;
                $fileName = $options->getOption('fileName');
                $this->exchangeLicense($fileName);
                break;

            case 'exchangeActCopyrightYear':
                print ('Execute task: ' . $task->name . "\r\n");

                $options = $task->options;
                $fileName = $options->getOption('fileName');
                $copyrightDate = $options->getOption('copyrightDate');

                $this->exchangeActCopyrightYear($fileName, $copyrightDate);
                break;

            case 'exchangeSinceCopyrightYear':
                print ('Execute task: ' . $task->name . "\r\n");

                $options = $task->options;
                $fileName = $options->getOption('fileName');
                $copyrightDate = $options->getOption('copyrightDate');

                // ToDo: create exchangeSinceCopyrightYear function
                $this->exchangeSinceCopyrightYear($fileName, $copyrightDate);
                break;

            case 'exchangeauthor':
                print ('Execute task: ' . $task->name . "\r\n");

                $options = $task->options;
                $fileName = $options->getOption('fileName');
                $this->exchangeAuthor($fileName);
                break;

            case 'exchangersglink':
                print ('Execute task: ' . $task->name . "\r\n");


                break;

            case 'X':
                print ('Execute task: ' . $task->name . "\r\n");


                break;

            case 'Y':
                print ('Execute task: ' . $task->name . "\r\n");


                break;

            default:
                print ('!!! Task not executed: ' . $task->name . '!!!' . "\r\n");

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

        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
//        $OutTxt .= $this->oByFile->text();

        $OutTxt .= ">>> --- file lines ----------------" . "\r\n";

        $OutTxt .= "fileName: " . $this->fileName . "\r\n";

        return $OutTxt;
    }

    /**
     * @param mixed $line
     * @return string
     */
    public function replacePackageLine(mixed $line): string
    {
        $oldValue = $this->scan4HeaderValueInLine('package', $line);

        // assign standard
        $packageLine = $this->headerFormat('package', $this->package);
        return $packageLine;
    }

    /**
     * @param mixed $line
     * @return string
     */
    public function replaceSubPackageLine(mixed $line): string
    {
        $oldValue = $this->scan4HeaderValueInLine('subpackage', $line);

        // assign standard
        $subPackageLine = $this->headerFormat('subpackage', $this->subpackage);
        return $subPackageLine;
    }

    /**
     * @param mixed $line
     * @return string
     */
    public function replaceLicenseLine(mixed $line): string
    {
        $oldValue = $this->scan4HeaderValueInLine('license', $line);

        // assign standard
        $licenseLine = $this->headerFormat('license', $this->license);
        return $licenseLine;
    }

    /**
     * @param mixed $line
     * @param string $toYear
     * @return string
     */
    public function replaceActCopyrightLine(mixed $line, string $toYear): string
    {
        $oldValue = $this->scan4CopyrightHeaderInLine($line);

        //  * @copyright (c)  2020-2022 Team
        // value: 2020-2022 Rsgallery2 Team
        $newValue = preg_replace(
            '/(.*\d+-)(\d+)(.*)/',
            '${1}' . $toYear . '${3}',
            $oldValue,
        );
        $copyrightLine = $this->headerFormat('copyright  (c)', $newValue);
        return $copyrightLine;
    }

    /**
     * @param mixed $line
     * @param string $sinceYear
     * @return string
     */
    public function replaceSinceCopyrightLine(mixed $line, string $sinceYear): string
    {
        $oldValue = $this->scan4CopyrightHeaderInLine($line);

        //  * @copyright (c)  2020-2022 Rsgallery2 Team
        // value: 2020-2022 Rsgallery2 Team
        // $outLine = preg_replace('/(.*\d+\-)(.* ?)(.*)/',
        $newValue = preg_replace(
            '/(\d+)(-\d+.*)/',
            $sinceYear . '${2}',
            $oldValue,
        );
        $copyrightLine = $this->headerFormat('copyright  (c)', $newValue);
        return $copyrightLine;
    }

    /**
     * @param mixed $line
     * @return string
     */
    public function replaceAuthorLine(mixed $line): string
    {
        $oldValue = $this->scan4HeaderValueInLine('author', $line);

        // keep author
        if ($oldValue == 'finnern') {
            // "RSGallery2 Team <team2@rsgallery2.org>";
            $newValue = $this->author;
        } else {
            // keep author
            if (str_starts_with(strtolower($oldValue), 'rsgallery2')) {
                // "RSGallery2 Team <team2@rsgallery2.org>";
                $newValue = $this->author;
            } else {
                // $newValue      = $author; // not given then format old value
                $newValue = $oldValue;
            }
        }

        $authorLine = $this->headerFormat('author', $newValue);
        return $authorLine;
    }

    /**
     * @param mixed $line
     * @return string
     */
    public function replaceLinkLine(mixed $line): string
    {
        $oldValue = $this->scan4HeaderValueInLine('link', $line);

        // assign standard
        $LinkLine = $this->headerFormat('link', $this->link);
        return $LinkLine;
    }


} // fileHeaderByFile

