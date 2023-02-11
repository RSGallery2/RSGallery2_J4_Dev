<?php

class copyFiles
{
	public string $srcFolder = "";
	public string $dstFolder = "";

	public function __construct($srcFolder = '', $dstFolder = '')
	{
		$this->init();

		if ($srcFolder != '')
		{
			$this->srcFolder = $srcFolder;
		}
		if ($dstFolder != '')
		{
			$this->dstFolder = $dstFolder;
		}

	}

	public function init()
	{
		$this->srcFolder = "joomla4x_RSG2_ReleaseBase";
		$this->dstFolder = "joomla4x_upgraded";
	}

	public function deleteFiles($dstFolder = '')
	{
		if ($dstFolder != '')
		{
			$this->dstFolder = $dstFolder;
		}

		$absDstFolder = realpath("..\\" . $this->dstFolder);
		$this->delTree($absDstFolder);

	}


	public function copyFiles($srcFolder = '', $dstFolder = '')
	{
		if ($srcFolder != '')
		{
			$this->srcFolder = $srcFolder;
		}
		$absSrcFolder = realpath('../' . $this->srcFolder);

		if ($dstFolder != '')
		{
			$this->dstFolder = $dstFolder;
		}

		// $absSrcFolder = realpath("..\\" . $srcFolder);
		$absDscFolder = realpath('../' . $this->dstFolder);

		$isOneFileCopied = $this->recurse_copy ($absSrcFolder, $absDscFolder);

	}

	function delTree($dir)
	{
		$hasError = false;

		$files = $this->FilesInDir($dir);

		foreach ($files as $file)
		{
			unlink ($file);
		}

		$folders = $this->DirectoryInDir($dir);

		foreach ($folders as $srcFolder)
		{
			$baseName = basename($srcFolder);

			if ($baseName == '.idea') {
				continue;
			}

			if ($baseName == '.' || $baseName == '..') {
				continue;
			}

			$hasError |= $this->delTree($srcFolder);

			$hasError = rmdir($dir);
		}

		return $hasError; // hasError
	}

	function recurse_copy($src,$dst) {

		$isOneFileCopied = false;

		try
		{
			$files = $this->FilesInDir($src);

			//--- copy files ------------------------------------

			foreach ($files as $srcFile)
			{
				$baseName = basename($srcFile);
				$dstFile = $dst . '/' . $baseName;

				copy($srcFile, $dstFile);
				$isOneFileCopied = true;
			}

			//--- copy folders ------------------------------------

			$folders = $this->DirectoryInDir($src);

			foreach ($folders as $srcFolder)
			{
				$baseName = basename($srcFolder);

				if ($baseName == '.idea') {
					continue;
				}

				if ($baseName == '.' || $baseName == '..') {
					continue;
				}

				$dstFolder = $dst . '/' . $baseName;

				if (is_dir($dstFolder) === false)
				{
					mkdir($dstFolder);
					$isOneFileCopied = true;
				}

				$isOneFileCopied |= $this->recurse_copy($srcFolder, $dstFolder);
			}

		}
		catch (\RuntimeException $exception)
		{
			;
		}

		return $isOneFileCopied;
	}



	function DirectoryInDir(string $path) : array
	{
		$directories = [];
		$items = scandir($path);
		foreach ($items as $item) {
			if($item == '..' || $item == '.')
				continue;
			if(is_dir($path.'/'.$item))
				$directories[] = $item;
		}
		return $directories;
	}

	function FilesInDir(string $path) : array
	{
		$files = [];
		$items = scandir($path);
		foreach ($items as $item) {
			if($item == '..' || $item == '.')
				continue;
			if(is_file($path.'/'.$item))
				$files[] = $item;
		}
		return $files;
	}

} // class


