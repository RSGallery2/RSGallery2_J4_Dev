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

use FileNamesList\fileNamesList;
use ExecuteTasks\buildRelease;

//use option\option;
//use options\options;
//use task\task;
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
	public tasks $tasks;

    /**
     * @var fileNamesList
     */
	public $fileNamesList;

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
            $this->tasks = $tasks->extractTasksFromString($tasksLine);

            // print ($this->tasksText ());
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    executeTask
    --------------------------------------------------------------------*/

    public function executeTasks($task="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('executeTask' . "\r\n");
            print ("task: " . $task . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            foreach ($this->tasks->tasks as $task) {

                $execTasks = [];

                switch (strtolower($task->name)) {

                    case 'buildrelease':
                        print ('Execute task: ' . $task->name);

                        $execTask = new buildRelease ();
                        // $execTask->assignFilesNames ($this->fileNamesList);
                        $execTask->assignTask ($task);

                        $hasError = $execTask->execute ();

//                        // ToDo: execute later and feed single files to execute
//                        $execTasks [] = $execTask;

                        break;

	                case 'forceversionid':
		                print ('Execute task: ' . $task->name);
		                $execTask = new forceVersionId ();
		                // $execTask->assignFilesNames ($this->fileNamesList);
		                $execTask->assignTask ($task);

		                $hasError = $execTask->execute ();

		                break;

	                case 'forcecrreationdate':
		                print ('Execute task: ' . $task->name);
		                $execTask = new forceVersionId ();
		                // $execTask->assignFilesNames ($this->fileNamesList);
		                $execTask->assignTask ($task);

		                $hasError = $execTask->execute ();

		                break;

	                case 'increaseversionid':
                        print ('Execute task: ' . $task->name);
		                $execTask = new increaseVersionId ();
		                // $execTask->assignFilesNames ($this->fileNamesList);
		                $execTask->assignTask ($task);

		                $hasError = $execTask->execute ();

		                break;

                    case 'clean4git':
                        print ('Execute task: ' . $task->name);
                        break;

                    case 'updatecopyrightyear':
                        print ('Execute task: ' . $task->name);
                        break;

                    case 'X':
                        print ('Execute task: ' . $task->name);
                        break;

                    case 'Y':
                        print ('Execute task: ' . $task->name);
                        break;

                    case 'Z':
                        print ('Execute task: ' . $task->name);
                        break;

                    default:
                        print ('Execute Default task: ' . $task->name);
                } // switch

                // $OutTxt .= $task->text() . "\r\n";
            }

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit executeTask: ' . $hasError . "\r\n");
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

	    $OutTxt .= "Tasks count: " . $this->tasks->count() . "\r\n";

        $OutTxt .= $this->tasks->text() . "\r\n";

        return $OutTxt;
    }

	public function extractTasksFromString(mixed $tasksLine)
	{
		$task = new tasks();
		$this->tasks = $task->extractTasksFromString($tasksLine);
	}

	public function extractTasksFromFile(mixed $taskFile)
	{
		$task = new tasks();
		$this->tasks = $task->extractTasksFromFile($taskFile);
	}


} // doBuildTasks

