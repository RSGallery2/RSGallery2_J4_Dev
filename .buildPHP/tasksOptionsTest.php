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

use option\option;

class options {

	/**
	 * @var option[] $options
	 */
    public $options;

    public
    function __construct($options = [])
    {

        $this->options = $options;

    }

    public function addOption (option $option) : void {

	    if ( ! empty ($option->name))
	    {
		    $this->options [$option->name] = $option;
	    }
    }
}

namespace task;

use option\option;
use options\options;

class task {

    public $name = "";

    public options $options;

    public
    function __construct($name = "", $options = "")
    {

        $this->name = $name;
        $this->options = $options;

    }

	public function addOption (option $option) {

		$this->options->add ($option);

	}
}

namespace tasks;

use option\option;
use task\task;

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


    public function addTask (task $task) : void {

	    if ( ! empty ($option->name))
	    {
		    $this->tasks [$task->name] = $task;
	    }
    }

}

