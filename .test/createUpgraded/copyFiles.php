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

		$absDscFolder = realpath("..\\" . $this->dstFolder);

		$files = array_diff(scandir($absDscFolder), array('.', '..'));

		foreach ($files as $file)
		{

			$baseName = basename($file);

			if ($baseName != '.idea')
			{

				$dstFile = $absDscFolder . '/' . $baseName;

				if (is_file($dstFile))
				{

					unlink($dstFile);

				}
				else
				{
					// delete file / folders

					$this->delTree($dstFile);
				}

			}
			else
			{
				// .idea;

				$dstFile = $absDscFolder . '/' . $baseName;

			}

		}

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
		if (strlen($dir) > strlen('d:\wamp64\www\joomla4x_'))
		{

			$files = array_diff(scandir($dir), array('.', '..'));

			foreach ($files as $file)
			{
				(is_dir("$dir/$file")) ? $this->delTree("$dir/$file") : unlink("$dir/$file");
			}

			return rmdir($dir);
		}
	}

	function recurse_copy($src,$dst) {

		$isOneFileCopied = false;

		try
		{
			//--- copy files ------------------------------------

			$files = array_diff(array_filter(glob($src . '/*'), 'is_file'), array('.', '..'));

			foreach ($files as $srcFile)
			{
				$baseName = basename($srcFile);
				$dstFile = $dst . '/' . $baseName;

				if ($baseName != '.idea')
				{
					copy($srcFile, $dstFile);
					$isOneFileCopied = true;
				}
			}


			//--- copy folders ------------------------------------

			$folders = array_diff(array_filter(glob($src . '/*'), 'is_dir'), array('.', '..'));

			foreach ($folders as $srcFolder)
			{
				$baseName = basename($srcFolder);
				$dstFolder = $dst . '/' . $baseName;

				if ($baseName != '.idea')
				{
					if (is_dir($dstFolder) === false)
					{
						mkdir($dstFolder);
						$isOneFileCopied = true;
					}

					$isOneFileCopied |= $this->recurse_copy($srcFolder, $dstFolder);
				}
			}

		}
		catch (\RuntimeException $exception)
		{
			;
		}

		return $isOneFileCopied;
	}

} // class


