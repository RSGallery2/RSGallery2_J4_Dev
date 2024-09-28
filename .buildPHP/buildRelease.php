<?php

namespace ExecuteTasks;

require_once "./iExecTask.php";
require_once "./baseExecuteTasks.php";

require_once "./fileNamesList.php";
require_once "./task.php";

use Exception;
use FileNamesList\fileNamesList;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use SplFileInfo;
use task\task;
use VersionId\versionId;
use ZipArchive;

$HELP_MSG = <<<EOT
    >>>
    class buildRelease
    
    ToDo: option commands , example
    
    <<<
    EOT;


/*================================================================================
Class buildRelease
================================================================================*/

class buildRelease extends baseExecuteTasks
    implements executeTasksInterface
{
    private string $buildDir = '';
    public readonly string $name;
    private string $extension = '';

    private versionId $versionId;

    // internal
    private string $manifestPathFileName = '';

    private string $componentType = '';

    private string $dateToday;
    private string $dateReleaseZip;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    // ToDo: a lot of parameters ....
    public function __construct($srcFile = "", $dstFile = "")
    {
        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("Construct buildRelease: " . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

//            $this->srcFile = $srcFile;
//            $this->dstFile = $dstFile;


        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }

    // Task name with options
    public function assignTask(task $task): int
    {
        $this->taskName = $task->name;

        $options = $task->options;

        foreach ($options->options as $option) {

            $isBaseOption = assignBaseOption($option);
            $isVersionOption = assignVersionOption($option);

            if (!$isBaseOption && !$isVersionOption) {
                switch (strtolower($option->name)) {
                    case 'builddir':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->buildDir = $option->value;
                        break;

                    // component name
                    case 'name':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->name = $option->value;
                        break;

                    case 'extension':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->extension = $option->value;
                        break;

                    case 'type':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->componentType = $option->value;
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
        }

        return 0;
    }

    public function execute(): int // $hasError
    {
        print('*********************************************************' . "\r\n");
        print ("Execute buildRelease: " . "\r\n");
        print('---------------------------------------------------------' . "\r\n");

        $componentType = $this->componentType();

        // $componentVersion =  $this->componentVersion ();

        switch (strtolower($componentType)) {
            case 'component':
                $this->buildComponent();

                break;

            case 'module':
                $this->buildModule();
                break;

            case 'plugin':
                $this->buildPlugin();
                break;

            case 'package':
                $this->buildPackage();
                break;

            default:
                print ('Default componentType: ' . $componentType);
        } // switch

        return (0);
    }

    private function componentType()
    {
        if ($this->componentType == '') {
            $this->componentType = $this->detectCompTypeFromFile($this->manifestPathFileName);
        }

        return $this->componentType;
    }

    private function detectCompTypeFromFile(string $manifestPathFileName)
    {
        $componentType = 'component';

        // ToDo: read file for version


        return $componentType;
    }

    private function buildComponent()
    {
        //--------------------------------------------------------------------
        // data in manifest file
        //--------------------------------------------------------------------

        $manifestPathFileName = $this->manifestPathFileName();
        print ("manifestPathFileName: " . $manifestPathFileName . "\r\n");

        $this->exchangeDataInManifestFile($manifestPathFileName);
        
        //--------------------------------------------------------------------
        // destination temp folder
        //--------------------------------------------------------------------

        $dstRoot = realpath($this->buildDir);
        print ('build dir: "' . $this->buildDir . '"' . "\r\n");
        print ('dstRoot: "' . $dstRoot . '"' . "\r\n");
        $tmpFolder = $this->buildDir . '/tmp';
        print ('temp folder(1): "' . $tmpFolder . '"' . "\r\n");
//		$tmpFolder = realpath($tmpFolder);
//		print ('temp folder(2): "' .  $tmpFolder . '"' . "\r\n");

        // create .packages folder
        if (!is_dir($dstRoot)) {
            print ('Create dir: "' . $dstRoot . '"' . "\r\n");
            mkdir($dstRoot, 0777, true);

            exit(556);
        }

        // remove tmp folder
        if (is_dir($tmpFolder)) {
            // length big enough to do no damage
            if (strLen($tmpFolder) < 10) {
                exit (555);
            }
            print ('Delete dir: "' . $tmpFolder . '"' . "\r\n");
            delDir($tmpFolder);
        }

        // create tmp folder
        print ('Create dir: "' . $tmpFolder . '"' . "\r\n");
        mkdir($tmpFolder, 0777, true);

        //--------------------------------------------------------------------
        // copy to temp
        //--------------------------------------------------------------------

        $srcRoot = realpath($this->srcRoot);

        $this->xcopyElement('administrator', $srcRoot, $tmpFolder);
        $this->xcopyElement('components', $srcRoot, $tmpFolder);
        $this->xcopyElement('media', $srcRoot, $tmpFolder);

        $this->xcopyElement('rsgallery2.xml', $srcRoot, $tmpFolder);
        $this->xcopyElement('install_rsg2.php', $srcRoot, $tmpFolder);
        $this->xcopyElement('LICENSE.txt', $srcRoot, $tmpFolder);
        $this->xcopyElement('index.html', $srcRoot, $tmpFolder);

        //--------------------------------------------------------------------
        // zip to destination
        //--------------------------------------------------------------------

        $zipFileName = $dstRoot . '/' . $this->createComponentZipName();
        zipItRelative(realpath($tmpFolder), $zipFileName);

        //--------------------------------------------------------------------
        // remove temp
        //--------------------------------------------------------------------

        // remove tmp folder
        if (is_dir($tmpFolder)) {
            delDir($tmpFolder);
        }
    }

    private function manifestPathFileName(): string
    {
        if ($this->manifestPathFileName == '') {
            $this->manifestPathFileName = $this->srcRoot . '/' . $this->name . '.xml';
        }

        return $this->manifestPathFileName;
    }

    private function exchangeDataInManifestFile(string $manifestPathFileName) {

        $isSaved = false;

        try {
            $lines = file($manifestPathFileName);

            //--- actual date ------------------------------------

            [$isExchanged, $dateLines] = $this->exchangeDateInManifestFile($manifestPathFileName, $lines);

            //--- actual date ------------------------------------






            //--- write to file -----------------------------------------------

            $outLines = $lines;
            
            //$isSaved = File::write($manifestFileName, $fileLines);
       //     $isSaved = file_put_contents($manifestFileName, $outLines);

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isSaved;
    }



    private function exchangeDateInManifestFile(string $manifestFileName, array $lines)
    {
        $isExchanged = false;
        $outLines = [];

        try {

            // ToDo: external parameter;
            $date_format = 'Y.m.d';
            $dateText = date($date_format);

            foreach ($lines as $line) {
                if ($isExchanged) {
                    $outLines [] = $line;
                } else {
                    // <creationDate>31. May. 2024</creationDate>
                    if (str_contains($line, '<creationDate>')) {
                        $outLine = preg_replace(
                            '/(.*<creationDate>)(.+)(<\/creationDate.*)/i',
                            '${1}' . $dateText . '${3}',
                            $line,
                        );
                        $outLines [] = $outLine;

                        $isExchanged = true;
                    } else {
                        $outLines [] = $line;
                    }
                }
            }

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return [$isExchanged, $outLines];
    }

    private function xcopyElement(string $name, string $srcRoot, string $dstRoot)
    {
        $hasError = 0;
        try {
            $srcPath = $srcRoot . '/' . $name;
            $dstPath = $dstRoot . '/' . $name;

            if (is_dir($srcPath)) {
                mkdir($dstPath);
                xcopy($srcPath, $dstPath);
            } else {
                copy($srcPath, $dstPath);
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
    }

    private function createComponentZipName()
    {
        // rsgallery2.5.0.12.4_20240818.zip

        // ToDo: option for version
        // ToDo: retrieve version from manifest

        // $date = "20240824";
        $date_format = 'Ymd';
        $date = date($date_format);

        $ZipName = $this->name . '.' . $this->componentVersion . '_' . $date . '.zip';

        return $ZipName;
    }

    private function buildModule()
    {


    }

    private function buildPlugin()
    {


    }

    private function buildPackage()
    {
        // build component

        // on all module folder build module


        // on all plugins folder build plugins

        // ? Specialities

        // remove temp

    }

    public function executeFile(string $filePathName): int
    {
        // not supported
        return (0);
    }

    public function text(): string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- buildRelease --------" . "\r\n";

        $OutTxt .= "Not defined yet " . "\r\n";

        /**
         * $OutTxt .= "fileName: " . $this->fileName . "\r\n";
         * $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
         * $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
         * $OutTxt .= "filePath: " . $this->filePath . "\r\n";
         * $OutTxt .= "srcRootFileName: " . $this->srcRootFileName . "\r\n";
         * /**/

        return $OutTxt;
    }

    private function componentVersion()
    {
        // ToDo: option for version
        // ToDo: retrieve version from manifest

        if ($this->componentVersion == '') {
            $this->componentVersion = $this->detectCompVersionFromFile($this->manifestPathFileName);
        }

        return $this->componentVersion;
    }

    private function detectCompVersionFromFile(string $manifestPathFileName)
    {
        $componentVersion = '';

        // ToDo: read file for


        return $componentVersion;
    }


} // buildRelease


//========================================================
// ToDo: into folder lib

function xcopy($src, $dest)
{
    foreach (scandir($src) as $file) {
        if ($file == '.' || $file == '..') {
            continue;
        }
        if (!is_readable($src . '/' . $file)) {
            continue;
        }
        if (is_dir($src . '/' . $file) && ($file != '.') && ($file != '..')) {
            mkdir($dest . '/' . $file);
            xcopy($src . '/' . $file, $dest . '/' . $file);
        } else {
            copy($src . '/' . $file, $dest . '/' . $file);
        }
    }
}

//========================================================
// ToDo: into folder lib

function delDir($dir)
{
    // do not delete from root accidentally
    if ($dir == '') {
        return;
    }
    if (strlen($dir) < 10) {
        return;
    }

    if (is_dir($dir)) {
        $objects = scandir($dir);
        foreach ($objects as $object) {
            if ($object != "." && $object != "..") {
                if (is_dir($dir . DIRECTORY_SEPARATOR . $object) && !is_link($dir . "/" . $object)) {
                    delDir($dir . DIRECTORY_SEPARATOR . $object);
                } else {
                    unlink($dir . DIRECTORY_SEPARATOR . $object);
                }
            }
        }
        rmdir($dir);
    }
}

//========================================================
// ToDo: into folder lib

function zipItRelative($rootPath, $zipFilename)
{
    print ('rootPath: "' . $rootPath . '"' . "\r\n");
    print ('zipFilename: "' . $zipFilename . '"' . "\r\n");

    // Initialize archive object
    $zip = new ZipArchive();
    $zip->open($zipFilename, ZipArchive::CREATE | ZipArchive::OVERWRITE);

    // Create recursive directory iterator
    /** @var SplFileInfo[] $files */
    $files = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($rootPath),
        RecursiveIteratorIterator::LEAVES_ONLY,
    );

    foreach ($files as $name => $file) {
        // Get real and relative path for current file
        $filePath = $file->getRealPath();
        $relativePath = substr($filePath, strlen($rootPath) + 1);

        if (!$file->isDir()) {
            // Add current file to archive
            $zip->addFile($filePath, $relativePath);
        } else {
            if ($relativePath !== false) {
                $zip->addEmptyDir($relativePath);
            }
        }
    }

    // Zip archive will be created only after closing object
    $zip->close();
}

function join_paths()
{
    $paths = [];

    foreach (func_get_args() as $arg) {
        if ($arg !== '') {
            $paths[] = $arg;
        }
    }

    return preg_replace('#/+#', '/', join('/', $paths));
}

