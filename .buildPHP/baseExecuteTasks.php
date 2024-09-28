<?php

namespace ExecuteTasks;

use FileNamesList\fileNamesList;
use option\option;

/**
 * Base classs prepares for filename list
 */
class baseExecuteTasks
{
    // task name
    public string $taskName = '????';

    public string $srcRoot = "";

    public bool $isNoRecursion = false;

    /**
     * @var fileNamesList
     */
    public fileNamesList $fileNamesList;

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct(string $srcRoot = "", bool $isNoRecursion = false)
    {
        $hasError = 0;
        try {
//            print('*********************************************************' . "\r\n");
//            print ("srcRoot: " . $srcRoot . "\r\n");
//            print ("yearText: " . $yearText . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            $this->srcRoot       = $srcRoot;
            $this->isNoRecursion = $isNoRecursion;

            $this->fileNamesList = new fileNamesList();
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }

    // TODO: check all extends to remove doble function
    public function assignFilesNames(fileNamesList $fileNamesList)
    {
        $this->fileNamesList = $fileNamesList;
    }

    // Task name with options
    public function assignBaseOption(option $option): bool
    {
        $isBaseOption = false;

        switch (strtolower($option->name)) {
            case 'srcroot':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->srcRoot = $option->value;
                $isBaseOption  = true;
                break;

            case 'isnorecursion':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isNoRecursion = boolval($option->value);
                $isBaseOption        = true;
                break;

//				case 'X':
//					print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;

        } // switch

        return $isBaseOption;
    }


}
