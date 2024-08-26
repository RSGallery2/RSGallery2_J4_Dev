<?php

namespace ExecuteTasks;

require_once "./commandLine.php";

require_once "./iExecTask.php";

require_once "./fileNamesList.php";
require_once "./task.php";

use \DateTime;
// use DateTime;

use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use SplFileInfo;
use ZipArchive;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;

use FileNamesList\fileNamesList;
use task\task;

$HELP_MSG = <<<EOT
>>>
class buildRelease

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class buildRelease
================================================================================*/

class buildRelease implements executeTasksInterface
{

	/**
	 * @var fileNamesList
	 */
	// public fileNamesList $fileNamesList;

	// Options 
	private string $srcRoot='';
	private string $buildDir='';
	private string $name='';
	private string $extension='';

	private string $componentVersion = '5.0.12.4';




	// internal 
	private string $manifestPathFileName = '';

	private string $componentType = '';

    private string $dateToday;
    private string $dateReleaseZip;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    // ToDo: a lot of parameters ....
	public function __construct($srcFile="", $dstFile="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("Construct buildRelease: " . "\r\n");
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

    // List of filenames to use
    public function assignFilesNames (fileNamesList $fileNamesList)
    {

	    // ($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);
	    // $this->fileNamesList = $fileNamesList;

    }

    // Task name with options
    public function assignTask (task $task) : int
    {
		$options = $task->options;

		foreach ($options->options as $option) {
			

			switch (strtolower($option->name)) {

				case 'srcroot':
					print ('Task option: ' . $option->name . "\r\n");
					$this->srcRoot = $option->value;

					break;

				case 'builddir':
					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
					$this->buildDir = $option->value;
					break;

				case 'name':
					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
					$this->name = $option->value;
					break;

				case 'extension':
					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
					$this->extension = $option->value;
					break;

				case 'type':
					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
					$this->componentType = $option->value;
					break;

				case 'version':
					print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
					$this->componentVersion = $option->value;
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

    public function execute (): int // $hasError
    {
	    print('*********************************************************' . "\r\n");
	    print ("Execute buildRelease: " . "\r\n");
	    print('---------------------------------------------------------' . "\r\n");

	    $componentType =  $this->componentType ();

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

    public function executeFile (string $filePathName) : bool // $isChanged
    {

		// not supported
	    return (0);
    }



    public function text()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- buildRelease --------" . "\r\n";
		
        $OutTxt .= "Not defined jet " . "\r\n";
        /**
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcRootFileName: " . $this->srcRootFileName . "\r\n";
        /**/

        return $OutTxt;
    }

	private function manifestPathFileName() : string
	{

		if ($this->manifestPathFileName == '') {
			$this->manifestPathFileName = $this->srcRoot . '/' . $this->name . '.xml';
		}

		return $this->manifestPathFileName;
	}

	private function componentType()
	{

		if ($this->componentType == '') {
			$this->componentType = $this->detectCompTypeFromFile ($this->manifestPathFileName);
		}

		return $this->componentType;
	}

	private function detectCompTypeFromFile(string $manifestPathFileName)
	{
		$componentType = 'component';

		// ToDo: read file for version


		return $componentType;
	}

	private function componentVersion()
	{
		// ToDo: option for version
		// ToDo: retrieve version from manifest

		if ($this->componentVersion == '') {
			$this->componentVersion = $this->detectCompVersionFromFile ($this->manifestPathFileName);
		}

		return $this->componentVersion;

	}

	private function detectCompVersionFromFile(string $manifestPathFileName)
	{
		$componentVersion = '';

		// ToDo: read file for


		return $componentVersion;
	}

	private function buildComponent()
	{
        //--------------------------------------------------------------------
        // date in manifest file
        //--------------------------------------------------------------------

        $manifestPathFileName = $this->manifestPathFileName ();
        print ("manifestPathFileName: " . $manifestPathFileName . "\r\n");

        // ToDo: ;
        $date_format = 'Ymd_His';
        $dateText = date ($date_format);

        $this->exchangeDateInManifestFile ($manifestPathFileName, $dateText);

        //--------------------------------------------------------------------
		// destination temp folder
		//--------------------------------------------------------------------

		$dstRoot = $this->buildDir;
		$tmpFolder = $dstRoot . '/tmp';


		// remove tmp folder
		if (is_dir($tmpFolder)) {

			delDir($tmpFolder);

		}

		// ToDo: Clean Temp, create temp

		mkdir($tmpFolder, 0777, true);


		//--------------------------------------------------------------------
		// copy to temp
		//--------------------------------------------------------------------

		$srcRoot =$this->srcRoot;

		$this->xcopyElement ('administrator',  $srcRoot, $tmpFolder);
		$this->xcopyElement ('components',  $srcRoot, $tmpFolder);
		$this->xcopyElement ('media',  $srcRoot, $tmpFolder);

		$this->xcopyElement ('rsgallery2.xml',  $srcRoot, $tmpFolder);
		$this->xcopyElement ('install_rsg2.php',  $srcRoot, $tmpFolder);
		$this->xcopyElement ('LICENSE.txt',  $srcRoot, $tmpFolder);
		$this->xcopyElement ('index.html',  $srcRoot, $tmpFolder);

		//--------------------------------------------------------------------
		// zip to destination
		//--------------------------------------------------------------------

		$zipFileName = $dstRoot . '/' . $this->createComponentZipName ();
		zipIt ($tmpFolder, $zipFileName);
		
		//--------------------------------------------------------------------
		// remove temp
		//--------------------------------------------------------------------

		// remove tmp folder
		if (is_dir($tmpFolder)) {

			delDir($tmpFolder);

		}

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

	private function createComponentZipName()
	{
		// rsgallery2.5.0.12.4_20240818.zip

		// ToDo: option for version
		// ToDo: retrieve version from manifest

		// $date = "20240824";
		$date_format = 'Ymd';
		$date = date ($date_format);

		$ZipName = $this->name . '.' . $this->componentVersion . '_' .$date . '.zip';

		return $ZipName;
	}

	private function xcopyElement(string $name, string $srcRoot, string $dstRoot)
	{
		$hasError = 0;
		try {

			$srcPath = $srcRoot . '/' . $name ;
			$dstPath = $dstRoot . '/' . $name ;

			if (is_dir ($srcPath))
			{
				mkdir ($dstPath);
				xcopy ($srcPath, $dstPath);
			} else {
				copy($srcPath, $dstPath);
			}

		}
		catch(\Exception $e)
		{
			echo 'Message: ' . $e->getMessage() . "\r\n";
			$hasError = -101;
		}

	}

    private function exchangeDateInManifestFile(string $manifestFileName, string $strDate)
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
                    // <creationDate>31. May. 2024</creationDate>
                    if (str_contains($line, '<creationDate>')) {
                        $outLine = preg_replace('/(.*>)(.*)(<.*)/', '$1' . $strDate . '$3', $line);

                        $outLines [] = $outLine;

                        $isExchanged = true;
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




} // buildRelease


//========================================================
// ToDo: folder lib

function xcopy($src, $dest) {
	foreach (scandir($src) as $file)
	{
		if ($file == '.' || $file == '..') {
			continue;
		}
		if (!is_readable($src . '/' . $file)) {
			continue;
		}
		if (is_dir($src .'/' . $file) && ($file != '.') && ($file != '..') )
		{
			mkdir($dest . '/' . $file);
			xcopy($src . '/' . $file, $dest . '/' . $file);
		} else {
			copy($src . '/' . $file, $dest . '/' . $file);
		}
	}
}

function delDir($dir) {

	// do not deleted from root accidentally
	if ($dir == '' ) return;
	if (strlen ($dir) < 10) return;

	if (is_dir($dir)) {
		$objects = scandir($dir);
		foreach ($objects as $object) {
			if ($object != "." && $object != "..") {
				if (is_dir($dir. DIRECTORY_SEPARATOR .$object) && !is_link($dir."/".$object))
					delDir($dir. DIRECTORY_SEPARATOR .$object);
				else
					unlink($dir. DIRECTORY_SEPARATOR .$object);
			}
		}
		rmdir($dir);
	}
}

function zipIt ($rootPath, $zipFilename)
{
	// Initialize archive object
	$zip = new ZipArchive();
	$zip->open($zipFilename, ZipArchive::CREATE | ZipArchive::OVERWRITE);

	// Create recursive directory iterator
	/** @var SplFileInfo[] $files */
	$files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($rootPath), RecursiveIteratorIterator::LEAVES_ONLY);

	foreach ($files as $name => $file)
	{
		// Get real and relative path for current file
		$filePath     = $file->getRealPath();
		$relativePath = substr($filePath, strlen($rootPath) + 1);

		if (!$file->isDir())
		{
			// Add current file to archive
			$zip->addFile($filePath, $relativePath);
		}
		else
		{
			if ($relativePath !== false)
				$zip->addEmptyDir($relativePath);
		}
	}

	// Zip archive will be created only after closing object
	$zip->close();
}

function join_paths() {
	$paths = array();

	foreach (func_get_args() as $arg) {
		if ($arg !== '') { $paths[] = $arg; }
	}

	return preg_replace('#/+#','/',join('/', $paths));
}

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

$tasksLine = ' task:buildRelease'
	. ' /type=component'
	. ' /srcRoot="./../../RSGallery2_J4"'
	. ' /buildDir="./../.packages"'
//    . ' /adminPath='
//    . ' /sitePath='
//    . ' /mediaPath='
	. ' /name=rsgallery2'
	. ' /extension=RSGallery2'
	. ' /version=5.0.12.4'
// name.xml ?    . '/manifestFile='
//    . '/s='
//    . '/s='
//    . '/s='
;

// ToDo: option release date option releasefiledate

$basePath = "..\\..\\RSGallery2_J4";


$srcFile = "";
$dstFile = "";

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

$fileNamesList = new fileNamesList($basePath);
$task = new task();
$task->extractTaskFromString($tasksLine);

$oBuildRelease = new buildRelease();

$oBuildRelease->assignFilesNames($fileNamesList);

$hasError = $oBuildRelease->assignTask($task);

if ($hasError) {

    print ("Error on function funYYY:" . $hasError);
}

$hasError = $oBuildRelease->execute();


print ($oBuildRelease->text () . "\r\n");

print_end($start);

print ("--- end  ---" . "\n");

