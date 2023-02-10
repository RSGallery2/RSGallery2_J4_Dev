<?php

require_once('exportDB.php');
require_once('copyFiles.php');

define("doExport", 1);
define("doRecreate", 2);
define("doImport", 3);

define("doDeleteFiles", 4);
define("doCopyFiles", 5);


// for debug
$startOn = doDeleteFiles;

// extract from database
$db_access = new db_access ();

if ($startOn <= doExport)
{
	$db_access->DbName = 'joomla4x_RSG2_ReleaseBase';
	$isExported        = $db_access->exportDb();
}

if ($startOn <= doRecreate)
{
	$db_access->DbName = 'joomla4x_upgraded';
	$isRecreated        = $db_access->recreateDB();
}


if ($startOn <= doImport)
{
	$db_access->DbName      = 'joomla4x_upgraded';
	$db_access->backup_name = "joomla4x_RSG2_ReleaseBase.sql";
	$isImported             = $db_access->importDb();
}



// extract from database
$copyFiles = new copyFiles ();



if ($startOn <= doDeleteFiles)
{
	$copyFiles->srcFolder = 'joomla4x_RSG2_ReleaseBase';
	$copyFiles->deleteFiles();
}


if ($startOn <= doCopyFiles)
{
	$copyFiles->srcFolder = 'joomla4x_RSG2_ReleaseBase';
	$copyFiles->dstFolder = 'joomla4x_upgraded';
	$copyFiles->copyFiles();
}



