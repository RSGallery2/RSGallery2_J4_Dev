<?php

namespace increaseVersionId;

require_once "./iExecTask.php";

// use \DateTime;

use ExecuteTasks\executeTasksInterface;

use FileNamesList\fileNamesList;
use task\task;
use function commandLine\argsAndOptions;
use function commandLine\print_header;
use function commandLine\print_end;


/*================================================================================
Class increaseVersionId
================================================================================*/

class increaseVersionId implements executeTasksInterface
{

    private string $srcRoot='';
    private string $name='';

    private string $componentVersion='';

    // internal
    private string $manifestPathFileName = '';


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    // ToDo: a lot of parameters ....
	private $isIncreaseMajor;
	private $isIncreasePatch;
	private $isIncreaseMinor;
	private $isIncreaseDev;

	public function __construct($srcFile="", $dstFile="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("Construct increaseVersionId: " . "\r\n");
//            print ("srcFile: " . $srcFile . "\r\n");
//            print ("dstFile: " . $dstFile . "\r\n");
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

                case 'name':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->name = $option->value;
                    break;

                case 'version':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->componentVersion = $option->value;
                    break;

                case 'isincreasemajor':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->isIncreaseMajor = True;
                    break;

                case 'isincreaseminor':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->isIncreaseMinor = True;
                    break;

                case 'isincreasepatch':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->isIncreasePatch = True;
                    break;

                case 'isincreasedev':
                    print ('Task option: ' . $option->name . ' ' . $option->value . "\r\n");
                    $this->isIncreaseDev = True;
                    break;

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
        print ("Execute increaseVersionId : " . "\r\n");
        print('---------------------------------------------------------' . "\r\n");

        $hasError = $this->exchangeVersionId();

        return $hasError;
    }

    public function executeFile (string $filePathName) : bool // $isChanged
    {
        $hasError = 0;

        // $hasError = $this->exchangeVersionId ();

        return ($hasError);
    }

    /*--------------------------------------------------------------------
    funYYY
    --------------------------------------------------------------------*/

    function exchangeVersionId() {

        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('exchangeVersionId' . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $manifestPathFileName = $this->manifestPathFileName ();
            print ("manifestPathFileName: " . $manifestPathFileName . "\r\n");

            $componentVersion = $this->componentVersion;
            print ("version: " . $componentVersion . "\r\n");

            $hasError = $this->exchangeVersionInManifestFile ($manifestPathFileName, $componentVersion);
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit exchangeVersionId: ' . $hasError . "\r\n");
        return $hasError;
    }

    private function exchangeVersionInManifestFile(string $manifestFileName, string $strVersion)
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
                    // 	<version>5.0.12.4</version>
                    if (str_contains($line, '<version>')) {

						$actVersion = preg_replace('/.*<version>(.*)<\/version>.*/',
							'${1}', trim($line));
	                    $newVersion = $this->increaseVersion ($actVersion);
						// exchange for new version
                        $outLine = preg_replace('/(.*>?)(.*)(<.*)/',
                            '${1}' . $newVersion . '${3}', $line);

                        $outLines [] = $outLine;

                        $isExchanged = true;
                    } else {
                        $outLines [] = $line;
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

	private function increaseVersion(string $actVersion)
	{
		$newVersion = $actVersion;

		$parts = explode('.', $actVersion);

		// standard is 3 parts. optional 4th dev part
		if (count($parts) > 2)
		{
			if ($this->isIncreaseMajor)
			{
				$major = intval($parts[0]);
				$parts[0] = strval($major + 1);
			}
			if ($this->isIncreaseMinor)
			{
				$minor = intval($parts[1]);
				$parts[1] = strval($minor + 1);
			}
			if ($this->isIncreasePatch)
			{
				$patch = intval($parts[2]);
				$parts[2] = strval($patch + 1);
			}
			if ($this->isIncreaseDev)
			{
				$dev = intval($parts[3]);
				$parts[3] = strval($dev + 1);
			}

			$newVersion = implode('.', $parts);
		}

		return $newVersion;
	}
    private function manifestPathFileName() : string
    {

        if ($this->manifestPathFileName == '') {
            $this->manifestPathFileName = $this->srcRoot . '/' . $this->name . '.xml';
        }

        return $this->manifestPathFileName;
    }


    public function text() : string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- increaseVersionId ---" . "\r\n";


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


    // TODO: Exe for forceVersionIdAll ...  -> instead
    public function assignFilesNames(fileNamesList $fileNamesList)
    {
        // TODO: Implement assignFilesNames() method.
        $this->fileNamesList = $fileNamesList;
    }

} // increaseVersionId

