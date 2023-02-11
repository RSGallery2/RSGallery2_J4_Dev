<?php

class renameInConfig
{
	public string $dstFolder = "";
	public string $cfgFile = "";
	public string $srcString = "";
	public string $dstString = "";
	public bool $isOverwrite = false;

	public function __construct($dstFolder = '', $cfgFile = '', $srcString = '', $dstString = '')
	{
		$this->init();

		if ($dstFolder != '')
		{
			$this->dstFolder = $dstFolder;
		}
		if ($cfgFile != '')
		{
			$this->cfgFile = $cfgFile;
		}
		if ($srcString != '')
		{
			$this->srcString = $srcString;
		}
		if ($dstString != '')
		{
			$this->dstString = $dstString;
		}

	}

	public function init()
	{
		$this->dstFolder = "joomla4x_RSG2_ReleaseBase";
		$this->cfgFile   = "configuration.php";
		$this->srcString = "joomla4x_rsg2_releasebase";
		$this->dstString = "joomla4x_upgraded";
		$this->isOverwrite = false;
	}

	public function renameInConfig ($dstFolder = '', $cfgFile = '', $srcString = '', $dstString = '')
	{
		$hasError = false;

		if ($dstFolder != '')
		{
			$this->dstFolder = $dstFolder;
		}
		if ($cfgFile != '')
		{
			$this->cfgFile = $cfgFile;
		}
		if ($srcString != '')
		{
			$this->srcString = $srcString;
		}
		if ($dstString != '')
		{
			$this->dstString = $dstString;
		}

		try
		{

			//--- read file --------------------------------------------

			$cfgFile = realpath("..\\" . $this->dstFolder) . '/' . $this->cfgFile;


			// ? PHP_EOL
			$srcLines = explode("\n", file_get_contents($cfgFile));
			if ($srcLines === false) {

				$hasError = true;
			}


			if ($hasError === false)
			{


				//--- exchange lines --------------------------------------------

				$dstLines = [];

				foreach ($srcLines as $line)
				{

					$dstLines[] = str_replace($this->srcString, $this->dstString, $line);

				}

				//--- permission remove readonlay ------------------------------------

				$dstFile = $cfgFile;

				// test file ?
				if ($this->isOverwrite == false)
				{

					$dstFile = $dstFile . '.new.php';

				}

				if (file_exists($dstFile))
				{
					$this->changePermission($dstFile, "remove_readonly");
				}

				//--- write file ----------------------------------------------

				$result   = file_put_contents($dstFile, implode(PHP_EOL, $dstLines));
				$hasError = $result === false;

				//--- permission add readonly ------------------------------------

				$this->changePermission($dstFile, "add_readonly");
			}
		}
		catch (\RuntimeException $exception)
		{
			;
		}

		return $hasError;
	}


	public function changePermission ($file = '', $action = '') {

		switch($action) {
			case "remove_readonly":
				chmod( $file, '0755' );
				break;
			case "add_readonly":
				chmod( $file, '0600' );
				break;
			default:  // default action if no action is matched
				chmod( $file, '0755' );
		}


	}

} // class

