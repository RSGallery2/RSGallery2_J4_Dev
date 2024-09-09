<?php

namespace DoBuildTasks;

require_once "./fileNamesList.php";
require_once "./buildRelease.php";

// require_once "./option.php";
// require_once "./options.php";
// require_once "./task.php";
require_once "./tasks.php";

// use \DateTime;
// use DateTime;

use ExecuteTasks\executeTasksInterface;
use FileNamesList\fileNamesList;
use ExecuteTasks\buildRelease;

//use option\option;
//use options\options;
//use task\task;
use forceCreationDate\forceCreationDate;
use forceVersionId\forceVersionId;
use increaseVersionId\increaseVersionId;
use task\task;
use tasks\tasks;

$HELP_MSG = <<<EOT
>>>
doBuildTasks class 

ToDo: option commands , example

<<<
EOT;


/*================================================================================
Class doBuildTasks
================================================================================*/

class doBuildTasks {

    /**
     * @var tasks
     */
	public tasks $textTasks;
	public task $actTextTask;

    public executeTasksInterface $actTask;
    /**
     * @var fileNamesList
     */
	public fileNamesList $fileNamesList;

    //
	public string $basePath = "";


	public bool $isIncreaseMajor = False;
	public bool $isIncreaseMinor = False;
	public bool $isIncreasePatch = False;
	public bool $isIncreaseDev = False;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

	public function __construct($basePath="", $tasksLine="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print("basePath: " . $basePath . "\r\n");
            print("tasks: " . $tasksLine . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->basePath = $basePath;
            $tasks = new tasks();
            $this->textTasks = $tasks->extractTasksFromString($tasksLine);

            // print ($this->tasksText ());
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    applyTasks
    --------------------------------------------------------------------*/

    public function applyTasks($textTask="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('applyTasks' . "\r\n");
            print ("task: " . $textTask . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            foreach ($this->textTasks->tasks as $textTask) {

                switch (strtolower($textTask->name)) {

                    //--- let the task run -------------------------

                    case 'execute':
                        print ('>>> Execute task: >>>');

                        // prepared filenames list
                        $this->actTask->assignFilesNames($this->fileNamesList);

                        // run task
                        $hasError = $this->actTask->execute ();

                        break;

                    //--- assign files to task -----------------------

                    case 'createfilenamesList':
                        print ('Execute task: ' . $textTask->name);

                        $filenamesList = new fileNamesList ();
                        $filenamesList->assignTask ($textTask);
                        $filenamesList->execute ($textTask);

                        $this->fileNamesList = $filenamesList;

                        break;

                    //--- add more files to task -----------------------

                    case 'add2FilenamesList':
                        print ('Execute task: ' . $textTask->name);
                        $filenamesList = new fileNamesList ();
                        $filenamesList->assignTask ($textTask);
                        $filenamesList->execute ($textTask);

                        $this->fileNamesList->addFilenames ($filenamesList->fileNames);

                        break;

                    //=== real task definitions =================================

                    case 'buildrelease':
                        print ('Assign task: ' . $textTask->name);

                        $execTask = new buildRelease ();

                        $execTask->assignTask ($textTask);

                        $this->actTask = $execTask;
                        break;

	                case 'forceversionid':
		                print ('Assign task: ' . $textTask->name);
		                $execTask = new forceVersionId ();

		                $execTask->assignTask ($textTask);

                        $this->actTask = $execTask;
                        break;

	                case 'forcecreationdate':
		                print ('Assign task: ' . $textTask->name);
		                $execTask = new forceCreationDate ();

		                $execTask->assignTask ($textTask);

                        $this->actTask = $execTask;
		                break;

	                case 'increaseversionid':
                        print ('Assign task: ' . $textTask->name);
		                $execTask = new increaseVersionId ();

		                $execTask->assignTask ($textTask);

                        $this->actTask = $execTask;
		                break;

                    case 'clean4gitcheckin':
                        print ('Assign task: ' . $textTask->name);
//                        $execTask = new clean4gitcheckin ();
//
//                        $execTask->assignTask ($textTask);
//
//                        $this->actTask = $execTask;

                        break;

                    case 'updateactcopyrightyear':
                        print ('Assign task: ' . $textTask->name);
//                        $execTask = new clean4gitcheckin ();
//
//                        $execTask->assignTask ($textTask);
//
//                        $this->actTask = $execTask;

                        break;

                    case 'Zt':
                        print ('Assign task: ' . $textTask->name);
                        break;

//                    case 'X':
//                        print ('Assign task: ' . $task->name);
//                        break;
//
//                    case 'Y':
//                        print ('Assign task: ' . $task->name);
//                        break;
//
//                    case 'Z':
//                        print ('Assign task: ' . $task->name);
//                        break;
//
                    default:
                        print ('Execute Default task: ' . $textTask->name);
                } // switch

                // $OutTxt .= $task->text() . "\r\n";
            }

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit applyTasks: ' . $hasError . "\r\n");
        return $hasError;
    }


    /*--------------------------------------------------------------------
    executeTask
    --------------------------------------------------------------------*/

    public function collectFiles($path="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('collectFiles' . "\r\n");
            print ("path: " . $path . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            // ($path, $includeExt, $excludeExt, $isNoRecursion, $writeListToFile);
            $this->fileNamesList = new fileNamesList($path);

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit collectFiles: ' . $hasError . "\r\n");
        return $hasError;
    }


    public function text() : string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: class  ---" . "\r\n";


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

    public function tasksText()
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- doBuildTasks: Tasks ---" . "\r\n";

	    $OutTxt .= "Tasks count: " . $this->textTasks->count() . "\r\n";

        $OutTxt .= $this->textTasks->text() . "\r\n";

        return $OutTxt;
    }

	public function extractTasksFromString(mixed $tasksLine)
	{
		$task = new tasks();
		$this->textTasks = $task->extractTasksFromString($tasksLine);
	}

	public function extractTasksFromFile(mixed $taskFile)
	{
		$task = new tasks();
		$this->textTasks = $task->extractTasksFromFile($taskFile);
	}


} // doBuildTasks

