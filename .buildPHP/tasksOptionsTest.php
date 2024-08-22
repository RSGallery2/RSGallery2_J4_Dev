<?php
//=========================================================================

//namespace option;
//
//class option {
//
//    public string $name = "";
//    public string $value = "";
//
//	public function __construct($name = "", $value = "")
//	{
//
//		$this->name = $name;
//		$this->value = $value;
//
//	}
//
//	public function clear() : void
//	{
//
//		$this->name = '';
//		$this->value = '';
//
//	}
//
//	public function extractOptionFromString($inOptionsString = "") : option
//	{
//		$this->clear();
//
//		try {
//			$optionsString = Trim($inOptionsString);
//
//			// single: /optionName or /optionName=value or /optionName="optionValue"
//
//			//$optionName = '';
//			$optionValue = '';
//
//			$idx = strpos($optionsString, "=");
//
//			// name without options
//			if ($idx == false) {
//				$optionName = $optionsString;
//			} else {
//				// name with options
//				$optionName = substr($optionsString, 0, $idx);
//				$optionValue = substr($optionsString, $idx + 1);
//
//			}
//
//			$this->name = $optionName;
//			$this->value = $optionValue;
//
//		} catch (\Exception $e) {
//			echo 'Message: ' . $e->getMessage() . "\r\n";
//			$hasError = -101;
//		}
//
//		return $this;
//	}
//
//	public function text(): string
//    {
//        $OutTxt = " "; // . "\r\n";
//
//        $OutTxt .= $this->name; // . "\r\n";
//        if ($this->value != '') {
//            $OutTxt .= '=' . $this->value; // . "\r\n";
//        }
//
//        return $OutTxt;
//    }
//
//}


////=========================================================================
//
//namespace options;
//
//use option\option;
//
//class options {
//
//	/**
//	 * @var option[] $options
//	 */
//    public $options;
//
//    public function __construct($options = [])
//    {
//
//        $this->options = $options;
//
//    }
//
//	public function clear() : void
//	{
//
//		$this->options = [];
//
//	}
//
//	public function addOption (option $option) : void {
//
//	    if ( ! empty ($option->name))
//	    {
//		    $this->options [$option->name] = $option;
//	    }
//    }
//
//	public function extractOptionsFromString($inOptionsString = "") : options
//	{
//		$this->clear ();
//
//		try {
//			$optionsString = Trim($inOptionsString);
//
//			// multiple: /optionName or /optionName=value or /optionName="optionValue"
//			while ($this->hasOptionChar($optionsString)) {
//
//				$idx = strpos($optionsString, " ");
//
//				// name without options
//				if ($idx == false) {
//					$optionName = $optionsString;
//				} else {
//					// name with options
//					$singleOption = substr($optionsString, 1, $idx);
//
//					$optionsString = substr($optionsString, $idx + 1);
//					$optionsString = Trim($optionsString);
//
//					$option = (new option())->extractOptionFromString($singleOption);
//					$this->addOption ($option);
//				}
//			}
//		} catch (\Exception $e) {
//			echo 'Message: ' . $e->getMessage() . "\r\n";
//			$hasError = -101;
//		}
//
//		return $this;
//	}
//
//	private function hasOptionChar(string $inOptionsString)
//	{
//		$isOption = false;
//
//		$optionsString = Trim($inOptionsString);
//
//		// /option1 /option2=xxx /option3="01teststring"
//		if (str_starts_with($optionsString, '/')) {
//			$isOption = true;
//		}
//
//		// -option1 -option2=xxx -option3="01teststring"
//		if (str_starts_with($optionsString, '-')) {
//			$isOption = true;
//		}
//
//		return $isOption;
//	}
//
//
//
//	public function text(): string
//    {
//        $OutTxt = " "; // . "\r\n";
//
//        foreach ($this->options as $option) {
//            $OutTxt .= $option->text() . " ";
//        }
//
//        return $OutTxt;
//    }
//
//}

////=========================================================================
//
//namespace task;
//
//use option\option;
//use options\options;
//
//class task {
//
//    public $name = "";
//
//    public options $options;
//
//    public function __construct($name = "", $options = "")
//    {
//
//        $this->name = $name;
//        $this->options = $options;
//
//    }
//
//	public function clear() : void
//	{
//
//		$this->name = '';
//		$this->options = new options();
//
//	}
//
//	public function extractTaskFromString($tasksString = "") : task
//	{
//		$this->clear ();
//
//		try {
//			$tasksString = Trim($tasksString);
//
//			$taskName = '';
//			$taskOptions = new options;
//
//			// 'task01name /option1 /option2=xxx /option3="01teststring"'
//			$idx = strpos($tasksString, " ");
//
//			// name without options
//			if ($idx == false) {
//				$taskName = $tasksString;
//			} else {
//				// name with options
//				$taskName = substr($tasksString, 0, $idx);
//				$optionsString = substr($tasksString, $idx + 1);
//
//				$taskOptions = (new options())->extractOptionsFromString($optionsString);
//			}
//
//			$this->name = $taskName;
//			$this->options = $taskOptions;
//
//		} catch (\Exception $e) {
//			echo 'Message: ' . $e->getMessage() . "\r\n";
//			$hasError = -101;
//		}
//
//		return $this;
//	}
//
//
//	public function addOption (option $option) {
//
//		$this->options->add ($option);
//
//	}
//
//    public function text(): string
//    {
//        $OutTxt = "Task: "; // . "\r\n";
//
//        $OutTxt .= $this->name . ' '; // . "\r\n";
//        $OutTxt .= $this->options->text(); // . "\r\n";
//
//        return $OutTxt;
//    }
//
//}

////=========================================================================
//
//namespace tasks;
//
//// use option\option;
//use task\task;
//
//class tasks
//{
//
//    /**
//     * @var task[] $tasks
//     */
//    public $tasks = [];
//
//    public
//    function __construct($tasks = [])
//    {
//
//        $this->tasks = $tasks;
//
//    }
//
//
//    public function addTask(task $task): void
//    {
//
//        if (!empty ($option->name)) {
//            $this->tasks [$task->name] = $task;
//        }
//    }
//
//
//	public function clear() : void
//	{
//
//		$this->tasks = [];
//
//	}
//
//	// extract multiple tasks from string
//	public function extractTasksFromString($tasksString = "")
//	{
//		$this->clear ();
//
//		try {
//			//        $tasks = "task:task00"
//			//            . 'task:task01 /option1 /option2=xxx /option3="01teststring"'
//			//            . 'task:task02 /optionX /option2=Y /optionZ="Zteststring"';
//
//			$tasksString = Trim($tasksString);
//			if (!empty ($tasksString)) {
//
//				$parts = explode("task:", $tasksString);
//
//				foreach ($parts as $part) {
//
//					if (!empty($part)) {
//
//						$task = (new task())->extractTaskFromString(Trim($part));
//						$this->addTask ($task);
//					}
//
//				}
//
//				// print ($this->tasksText ());
//			}
//
//		} catch (\Exception $e) {
//			echo 'Message: ' . $e->getMessage() . "\r\n";
//			$hasError = -101;
//		}
//
//		return $this;
//	}
//
//	// ToDO: A task may have more attributes like *.ext to
//	public function extractTasksFromFile(string $taskFile) : tasks
//	{
//		print('*********************************************************' . "\r\n");
//		print ("extractTasksFromFile: " . $taskFile . "\r\n");
//		print('---------------------------------------------------------' . "\r\n");
//
//		$this->clear ();
//
//		try {
//			$content = file_get_contents('data.txt'); //Get the file
//			$lines = explode("\n", $content); //Split the file by each line
//
//			foreach ($lines as $line) {
//
//				$line =  trim($line);
//
//				// ToDo use before each ? "/*" comments like lang manager
//
//				// ignore comments
//				if (!str_starts_with($line, '//')) {
//
//					$task = (new task())->extractTaskFromString(Trim($line));
//					$this->addTask ($task);
//				}
//			}
//
//			// print ($this->tasksText ());
//
//		} catch (\Exception $e) {
//			echo 'Message: ' . $e->getMessage() . "\r\n";
//			$hasError = -101;
//		}
//
//
//		return $this;
//	}
//
//
//	public function text(): string
//    {
//        $OutTxt = "--- Tasks: ---" . "\r\n";
//
//        $OutTxt .= "Tasks count: " . count($this->tasks) . "\r\n";
//
//        foreach ($this->tasks as $task) {
//            $OutTxt .= $task->text() . "\r\n";
//        }
//
//        return $OutTxt;
//    }
//
//}
