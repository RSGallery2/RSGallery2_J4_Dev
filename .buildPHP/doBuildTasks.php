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

use exchangeAll_licenseLines\exchangeAll_licenseLines;
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

    public executeTasksInterface $actTask;
    /**
     * @var fileNamesList
     */
	public fileNamesList $fileNamesList;

    //
	public string $basePath = "";


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
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    applyTasks
    --------------------------------------------------------------------*/

    public function applyTasks() : int {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('applyTasks' . "\r\n");
            // print ("task: " . $textTask . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            foreach ($this->textTasks->tasks as $textTask) {

                print ("--- apply task: " . $textTask->name . "\r\n");

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

                    case 'createfilenameslist':
                        print ('Execute task: ' . $textTask->name);

                        $filenamesList = new fileNamesList ();
                        $this->actTask = $this->createTask ($filenamesList, $textTask);
                        $filenamesList->execute ();

                        $this->fileNamesList = $filenamesList;

                        break;

                    //--- add more files to task -----------------------

                    case 'add2filenameslist':
                        print ('Execute task: ' . $textTask->name);
                        $filenamesList = new fileNamesList ();
                        $filenamesList->assignTask ($textTask);
                        $filenamesList->execute ();

                        $this->fileNamesList->addFilenames ($filenamesList->fileNames);

                        break;

                    //=== real task definitions =================================

                    case 'buildrelease':
                        $this->actTask = $this->createTask (new buildRelease (), $textTask);
                        break;

	                case 'forceversionid':
                        $this->actTask = $this->createTask (new forceVersionId (), $textTask);
                        break;

	                case 'forcecreationdate':
                        $this->actTask = $this->createTask (new forceCreationDate (), $textTask);
		                break;

	                case 'increaseversionid':
                        $this->actTask = $this->createTask (new increaseVersionId (), $textTask);
		                break;

                    case 'clean4gitcheckin':
//                        $this->actTask = $this->createTask (new clean4gitcheckin (), $textTask);
                        break;

                    case 'updateactcopyrightyear':
                        // $this->actTask = $this->createTask (new buildRelease (), $textTask);
                        break;

                    case 'exchangeall_licenselines':
                        $this->actTask = $this->createTask (new exchangeAll_licenseLines (), $textTask);
                        break;

//                    case 'X':
//                        $this->actTask = $this->createTask (new buildRelease (), $textTask);
//                        break;
//
//                    case 'Y':
//                        $this->actTask = $this->createTask (new buildRelease (), $textTask);//                        break;
//
//                    case 'Z':
//                        $this->actTask = $this->createTask (new buildRelease (), $textTask);
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

    private function createTask(executeTasksInterface $execTask, task $textTask) : executeTasksInterface
    {
        print ('Assign task: ' . $textTask->name);

        $execTask->assignTask ($textTask);

        return $execTask;
    }


} // doBuildTasks

