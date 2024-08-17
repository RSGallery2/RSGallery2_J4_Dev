<?php
namespace option;

class option {

    public
        $name = "";
    public
        $value = "";

    public
    function __construct($name = "", $value = "")
    {

        $this->name = $name;
        $this->value = $value;

    }

}

namespace options;

use option;

class options {

    public $options = [];

    public
    function __construct($options = [])
    {

        $this->options = $options;

    }

    public function addOption (option $option) {

        $this->options [$option->name] = $option;

    }
}

namespace task;

use options;

class task {

    public $name = "";

    public options $options = []: array;

    public
    function __construct($name = "", $options = "")
    {

        $this->name = $name;
        $this->options = $options;

    }

}

namespace tasks;

class tasks {

    /**
     * @var task[] $tasks
     */
    public $tasks = [];

    public
    function __construct($tasks = [])
    {

        $this->tasks = $tasks;

    }


    public function addTask (tasks $task) {

        $this->tasks [$task->name] = $task;

    }

    public function addOption (option $option) {

        $this->options [$option->name] = $option;

    }
}

