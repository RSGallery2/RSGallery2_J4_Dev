<?php

namespace fithFileNameList;

use \DateTime;
use fithFileName\fithFileName;




/**
ToDo:
* folder name regex
* filename regex
/**/

$HELP_MSG = <<<EOT
>>>
original class ...
<<<
EOT;


/*================================================================================
Class FileNamesList
================================================================================*/

class FileNamesList {

    public $path = "";

    /** @var fithFileName[] $fileNames */
    private array $fileNames;

    private $isIncludeExt = False;
    private array $includeExtList;

    private $isExcludeExt = False;
    private array $excludeExtList;

    private $isNoRecursion = False;
    private $isWriteListToFile = False;

    private $listFileName = "";

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    function __construct($path='', $includeExt='', $excludeExt='',
                         $isNoRecursion='', $writeListToFile='') {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("construct: " . "\r\n");
            print ("path: " . $path . "\r\n");
            print ("includeExt: " . $includeExt . "\r\n");
            print ("excludeExt: " . $excludeExt . "\r\n");
            print ("isNoRecursion: " . $isNoRecursion . "\r\n");
            print ("writeListToFile: " . $writeListToFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->clean();

            $this->asssignParameters($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);
        }
        /*--- exception ----------------------------------------------------*/
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    scan4Filenames
    --------------------------------------------------------------------*/

    function scan4Filenames($path='', $includeExt='', $excludeExt='',
                            $isNoRecursion='', $writeListToFile='') {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print ("scan4Filenames: " . "\r\n");
            print ("path: " . $path . "\r\n");
            print ("includeExt: " . $includeExt . "\r\n");
            print ("excludeExt: " . $excludeExt . "\r\n");
            print ("isNoRecursion: " . $isNoRecursion . "\r\n");
            print ("writeListToFile: " . $writeListToFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            // merge with parameters (empty values will use local value
            $this->mergeParameter2Class ($path, $includeExt, $excludeExt,
                $isNoRecursion, $writeListToFile);

            $this->fileNames = [];

            // iterate over folder and recursiv if set
            $this->scanPath4Filenames($this->path);

        }
            /*--- exception ----------------------------------------------------*/
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit funYYY: ' . $hasError . "\r\n");
        return $hasError;
    }

    public function text()
    {
        $OutTxt = "";
        $OutTxt .= "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFileNames ---" . "\r\n";

        $OutTxt = "Properies:" . "\r\n";
        $OutTxt .= $this->text_listFileNames();

        $OutTxt = "File list:" . "\r\n";
        $OutTxt .= $this->text_listFileNames();

        return $OutTxt;
    }





    public function textProperties()
    {
        $OutTxt = "";

        $OutTxt .= "path: " . $this->path . "\r\n";
        
        $OutTxt .= "isIncludeExt: " . $this->isIncludeExt . "\r\n";
        $OutTxt .= "includeExtList: " . 
            $this->combineExtensionString ($this->includeExtList) . "\r\n";
        
        $OutTxt .= "isExcludeExt: " . $this->isExcludeExt . "\r\n";
        $OutTxt .= "excludeExtList: " .
            $this->combineExtensionString ($this->excludeExtList) . "\r\n";
        
        $OutTxt .= "isNoRecursion: " . $this->isNoRecursion . "\r\n";
        $OutTxt .= "isWriteListToFile: " . $this->isWriteListToFile . "\r\n";
        /**/

        return $OutTxt;
    }

    public function text_listFileNames()
    {
        $OutTxt = "";

        foreach ($this->fileNames as $fileName) {

            $OutTxt .= $fileName->text_NamePathLine() . "\r\n";

        }

        return $OutTxt;
    }

    public function clean()
    {
        $this->path = "";

        $this->fileNames = [];

        $this->isIncludeExt = False;

        $this->includeExtList = [];
        $this->isExcludeExt = False;

        $this->excludeExtList = [];
        $this->isNoRecursion = False;

        $this->isWriteListToFile = False;

        $this->listFileName = "";
    }

    private function splitExtensionString($extString = "")
    {
        $isExtFound = false;
        $extensions = [];

        if (! empty ($extString)) {

            $parts = explode(" ", $extString);

            foreach ($parts as $part) {

                if ( ! empty($part)) {

                    $extensions [] = $part;
                }

            }

            // one or more extension defined
            if (count ($extensions) > 0) {
                $isExtFound = True;
            }

        }

        return [$isExtFound, $extensions];
    }

    private function combineExtensionString($extArray = []) : string
    {
        $outTxt = implode(" ", $extArray);

        return $outTxt;
    }

    public function filesAndFoldersInDir($inPath)
    {
        $files = [];
        $folders = [];

        try {
            // Is the path a folder?
            if (is_dir($inPath)) {

                $items = scandir($inPath);

                foreach ($items as $item) {

                    if ($item !== '.' && $item !== '..') {
                        $path = $inPath . '/' . $item;
                        if (is_file($path)) {
                            $files[] = $path;
                        } elseif (is_dir($path)) {
                            $folders[] = $path;
                        }
                    }
                }

            }
        }
        catch(\Exception $e) {
                echo 'Message: ' .$e->getMessage() . "\r\n";
                $hasError = -101;
            }

        return ([$files, $folders]);
    }

    /**
     * @param $folder
     *
     * @return array|bool
     *
     * @throws \Exception
     * @since version
     */
    public function filesInDir($inPath)
    {
        $files = [];
        $folders= [];

        try {
            [$files, $folders] = $this->filesAndFoldersInDir($inPath);
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $files;
    }


    public function folderInDir($inPath)
    {
        $files = [];
        $folders= [];

        try {
            [$files, $folders] = $this->filesAndFoldersInDir($inPath);
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $folders;
    }

    /**
     * @param mixed $path
     * @param mixed $includeExt
     * @param mixed $excludeExt
     * @param mixed $isNoRecursion
     * @param mixed $writeListToFile
     * @return void
     */
    public function asssignParameters(mixed $path, mixed $includeExt, mixed $excludeExt, mixed $isNoRecursion, mixed $writeListToFile): void
    {
        $this->path = $path;

        [$this->isIncludeExt, $this->includeExtList] =
            $this->splitExtensionString($includeExt);
        [$this->isExcludeExt, $this->excludeExtList] =
            $this->splitExtensionString($excludeExt);

        $this->isNoRecursion = $isNoRecursion;

        if (!empty ($writeListToFile)) {

            $this->isWriteListToFile = True;

            $this->listFileName = $writeListToFile;
        }
    }

    private function mergeParameter2Class(mixed $path, mixed $includeExt, mixed $excludeExt, mixed $isNoRecursion, mixed $writeListToFile)
    {
        if (empty ($path)) { $path = $this->path; }
        if (empty ($includeExt)) { $includeExt = $this->includeExtList; }
        if (empty ($excludeExt)) { $excludeExt = $this->excludeExtList; }
        if (empty ($isNoRecursion)) { $isNoRecursion = $this->isNoRecursion; }
        if (empty ($writeListToFile)) { $writeListToFile = $this->listFileName; }

        $this->asssignParameters($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);
    }

    private function scanPath4Filenames(mixed $inPath)
    {
            print('*********************************************************' . "\r\n");
            print ("scanPath4Filenames: " . "\r\n");
            print ("inPath: " . $inPath . "\r\n");

        try {
            [$files, $folders] = $this->filesAndFoldersInDir($inPath);

            print ("files count: " . count($files) . "\r\n");

            foreach ($files as $file) {

                $fithFileName = new fithFileName($file);

                $isExpected = $this->check4ValidName ($fithFileName);

                // $isExpected = False;
                $isExpected = True;


                // ToDo: handle include / exclude


                if ($isExpected) {

                    $this->fileNames [] = $fithFileName;

                }

            }

            // follow sub folders
            if ( ! $this->isNoRecursion) {

                print ("folders count: " . count($folders) . "\r\n");

                foreach ($folders as $folder) {

                    $this->scanPath4Filenames($folder);
                }
            }
            else
            {
                print ("NoRecursion: Exit after base folder requested: : " . count($folders) . "\r\n");
            }

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }


    }

    private function check4ValidName(fithFileName $fithFileName)
    {
        $isValid = false;

        try {
            if ($this->isIncludeExt) {
                $isValid = $this->check4ExtExists($fithFileName, $this->includeExtList);
            } else {
                if ($this->isExcludeExt) {
                    $isValid = !$this->check4ExtExists($fithFileName, $this->excludeExtList);
                }
            }


        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isValid;
    }

    private function check4ExtExists(fithFileName $fithFileName, array $extList)
    {
        $isFound = false;

        try {

            foreach ($extList as $ext) {

                $isFound = $fithFileName->hasExtension($ext);
                if ($isFound) {
                    break;
                }
            }

        } catch (\Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isFound;
    }


} // FileNamesList

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

$options = getopt("e:i:p:w:nh12345", []);
var_dump($options);

$LeaveOut_01 = true;
$LeaveOut_02 = true;
$LeaveOut_03 = true;
$LeaveOut_04 = true;
$LeaveOut_05 = true;

/*--------------------------------------------
variables
--------------------------------------------*/

$path = "..\\..\\RSGallery2_J4";
$includeExt = "*.php *.xmp *.ini";
$excludeExt = "*.php *.xmp *.ini";

// no recursion, actual folder only
//$isNoRecursion = False;
$isNoRecursion = True;

//$writeListToFile = "";
$writeListToFile = ".\\FileNamesList.txt";

foreach ($options as $idx => $option)
{
    print ("idx: " . $idx . "\r\n");
    print ("option: " . $option . "\r\n");

    switch ($idx)
    {
        case 'p':
            $path = $option;
            break;

        case 'i':
            $includeExt = $option;
            break;

        case 'e':
            $excludeExt = $option;
            break;

        case 'n':
            $isNoRecursion = True;
            break;

        case 'w':
            $writeListToFile = $option;
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

$oFileNamesList = new FileNamesList($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);

$hasError = $oFileNamesList->scan4Filenames();

if ($hasError) {

    print ("Error on function funYYY:" . $hasError);

} else {

    print ($oFileNamesList->text () . "\r\n");
}


\original\print_end($start);

print ("--- end  ---" . "\n");

