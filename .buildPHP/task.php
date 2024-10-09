<?php

namespace task;

// not used see tasksOptionsTest.php: add tasks and options *.php also

require_once "./option.php";
require_once "./options.php";

use Exception;
use option\option;
use options\options;

/*================================================================================
Class task
================================================================================*/

class task
{

    public $name = "";

    public options $options;


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/


    public function __construct()
    {
        $this->clear();
    }

    public function clear(): void
    {
        $this->name = '';
        $this->options = new options();
    }

    public function __construct1(string $name, options $options)
    {
        $this->name = $name;
        $this->options = $options;
    }

    public function extractTaskFromString($tasksString = ""): task
    {
        $this->clear();

        try {
            $tasksString = Trim($tasksString);

            $taskName = '';
            $taskOptions = new options;

            // 'task01name /option1 /option2=xxx /option3="01teststring"'
            $idx = strpos($tasksString, " ");

            // name without options
            if ($idx == false) {
                $taskName = substr($tasksString, 5);
            } else {
                // name with options (task:exchangeActCopyrightYear /fileName=".../src/Model/GalleryTreeModel.php" /copyrightDate=1999)
                $taskName = substr($tasksString, 5, $idx - 5);
                $optionsString = substr($tasksString, $idx + 1);

                $taskOptions = (new options())->extractOptionsFromString($optionsString);
            }

            $this->name = $taskName;
            $this->options = $taskOptions;
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
    }

    public function extractTaskFromFile(string $taskFile): task
    {
        print('*********************************************************' . "\r\n");
        print ("extractTasksFromFile: " . $taskFile . "\r\n");
        print('---------------------------------------------------------' . "\r\n");

        $this->clear();

        try {
            $content = file_get_contents('data.txt'); //Get the file
            $lines = explode("\n", $content); //Split the file by each line

            foreach ($lines as $line) {
                $line = trim($line);

                // ToDo use before each ? "/*" comments like lang manager

                // ignore comments
                if (!str_starts_with($line, '//')) {
                    $this->extractTaskFromString(Trim($line));
                }
            }
            // print ($this->tasksText ());

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $this;
    }


    public function addOption(option $option)
    {
        $this->options->addOption($option);
    }

    public function text4Line(): string
    {
        $OutTxt = "task:"; // . "\r\n";

        $OutTxt .= $this->name; // . "\r\n";
        if ($this->options->count() > 0) {
            $OutTxt .= $this->options->text4Line(); // . "\r\n";
        }

        // -> tasks: $OutTxt .= " "; // . "\r\n";

        return $OutTxt;
    }

    public function text(): string
    {
        // $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt = "";
        $OutTxt .= "--- task: " . $this->name . "\r\n";
        if ($this->options->count() > 0) {
            // $OutTxt .= "options: ";
            $OutTxt .= $this->options->text(); // . "\r\n";
        }

        return $OutTxt;
    }


} // task
