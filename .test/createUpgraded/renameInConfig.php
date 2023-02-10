<?php

class renameInConfig
{
	public string $srcFolder = "";
	public string $cfgFile = "";
	public string $srcString = "";
	public string $dstString = "";

	public function __construct($srcFolder = '', $cfgFile = '', $srcString = '', $dstString = '')
	{
		$this->init();

		if ($srcFolder != '')
		{
			$this->srcFolder = $srcFolder;
		}
		if ($cfgFile != '')
		{
			$this->dstFolder = $cfgFile;
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
		$this->srcFolder = "joomla4x_RSG2_ReleaseBase";
		$this->cfgFile = "configuration.php";
		$this->srcString = "joomla4x_rsg2_releasebase";
		$this->dstString = "joomla4x_upgraded";
	}

	public function renameInConfig ($srcFolder = '', $cfgFile = '', $srcString = '', $dstString = '')
	{
		if ($srcFolder != '')
		{
			$this->srcFolder = $srcFolder;
		}
		if ($cfgFile != '')
		{
			$this->dstFolder = $cfgFile;
		}
		if ($srcString != '')
		{
			$this->srcString = $srcString;
		}
		if ($dstString != '')
		{
			$this->dstString = $dstString;
		}


		//--- read file --------------------------------------------

		$handle = fopen("inputfile.txt", "r");
		if ($handle) {
			while (($line = fgets($handle)) !== false) {
				// process the line read.
			}

			fclose($handle);
		}

		//--- exchange lines --------------------------------------------





		//--- permission remove readonlay ------------------------------------

		$this->changePermission($this->srcFolder, "remove_readonly");

		//--- write file ----------------------------------------------





		//--- permission add readonly ------------------------------------

		$this->changePermission($this->srcFolder, "add_readonly");

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
				chanchmodgepermission( $file, '0755' );
		}


	}

} // class

