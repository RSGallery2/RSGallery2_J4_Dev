<?php

namespace ExecuteTasks;

use FileNamesList\fileNamesList;

class baseExecuteTasks
{
    // task name
    public string $name = '????';

    public string $srcRoot = "";
    private bool $isNoRecursion = false;

    /**
     * @var fileNamesList
     */
    public fileNamesList $fileNamesList;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct(string $srcRoot = "", bool $isNoRecursion=false)
    {
        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("srcRoot: " . $srcRoot . "\r\n");
//            print ("yearText: " . $yearText . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            $this->srcRoot = $srcRoot;
            $this->isNoRecursion = $isNoRecursion;

            $this->fileNamesList = new fileNamesList();
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }

    // TODO: Exe for forceVersionIdAll ...  -> instead
    public function assignFilesNames(fileNamesList $fileNamesList)
    {
        $this->fileNamesList = $fileNamesList;
    }

}
