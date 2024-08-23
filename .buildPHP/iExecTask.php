<?php
//namespace \Vendor\App\DatabaseAccess;
namespace ExecuteTasks;

interface executeTasksInterface
{
    // List of filenames to use
   public function assignFilesNames (fileNamesList $fileNamesList);

   // Task with options
   public function assignTask (task $task);

   public function execute () : int; // $hasError

   public function executeFile (string $filePathName) : bool; // $isChanged


}