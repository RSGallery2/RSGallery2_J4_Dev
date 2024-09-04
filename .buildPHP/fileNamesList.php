<?php

namespace FileNamesList;

require_once "./fithFileName.php";
require_once "./folderName.php";

use \DateTime;
use FileName\fithFileName;
use FolderName\fithFolderName;

/**
ToDo:
* folder name regex
* filename regex
/**/

/*================================================================================
Class FileNamesList
================================================================================*/

class fileNamesList {

	/** @var string $path */
    public $path = "";

    /** @var fithFileName[] $fileNames */
    public array $fileNames;

	/** @var bool */
    private $isIncludeExt = False;
    private array $includeExtList;

	/** @var bool */
    private $isExcludeExt = False;
    private array $excludeExtList;

	/** @var bool */
    private $isNoRecursion = False;
	/** @var bool */
    private $isWriteListToFile = False;

	/** @var string  */
    private $listFileName = "";

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($path='', $includeExt='', $excludeExt='',
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

        print('exit scan4Filenames: ' . $hasError . "\r\n");
        return $hasError;
    }

    public function text() : string
    {
        $OutTxt = "";
        $OutTxt .= "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFileNameList ---" . "\r\n";

        $OutTxt = "Properies:" . "\r\n";
        $OutTxt .= $this->text_listFileNames();

        $OutTxt = "File list:" . "\r\n";
        $OutTxt .= $this->text_listFileNames();

        return $OutTxt;
    }





    public function textProperties() : string
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

    public function text_listFileNames() : string
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
        if (empty ($includeExt)) { $includeExt = implode(' ', $this->includeExtList); }
        if (empty ($excludeExt)) { $excludeExt = implode(' ', $this->excludeExtList); }
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

                $isExpected = $this->check4ValidFileName ($fithFileName);

                // ToDo: handle include / exclude


                if ($isExpected) {

                    $this->fileNames [] = $fithFileName;

                }

            }

            // follow sub folders
            if ( ! $this->isNoRecursion) {

                print ("folders count: " . count($folders) . "\r\n");

                foreach ($folders as $folder) {


	                $isExpected = $this->check4ValidFolderName ($folder);

	                // $isExpected = False;
	                // $isExpected = True;


	                // ToDo: handle include / exclude


	                if ($isExpected)
	                {
		                $this->scanPath4Filenames($folder);
	                }
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

    private function check4ValidFileName(fithFileName $fithFileName)
    {
        $isValid = false;

        try {
            if ($this->isIncludeExt) {
                $isValid = $this->check4ExtExists($fithFileName, $this->includeExtList);
            } else {
                if ($this->isExcludeExt) {
                    $isValid = !$this->check4ExtExists($fithFileName, $this->excludeExtList);
                }
				else {
					// $isExpected = False;
					$isValid = True;
				}
            }

	        if ($fithFileName->fileBaseName == '.gitignore') {
		        $isValid = false;
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

	private function check4ValidFolderName(string $folder)
	{
		$isValid = true;

		try {
			$fithFolderName = new fithFolderName($folder);


			if ($fithFolderName->folderName == '.git') {
				$isValid = false;
			}


		} catch (\Exception $e) {
			echo 'Message: ' . $e->getMessage() . "\r\n";
			$hasError = -101;
		}

		return $isValid;
	}


} // FileNamesList

