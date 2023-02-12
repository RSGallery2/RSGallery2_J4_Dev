<?php

require_once('exportDB.php');
require_once('copyFiles.php');
require_once('renameInConfig.php');

//--- constants ---------------------------------------------------

const doExport = 1;
const doRecreate = 2;
const doImport = 3;

const doDeleteFiles = 4;
const doCopyFiles   = 5;

const doRenameConfig = 6;

// for debug
$startOn = doExport;


/*------------------------------------------------------------------------
select sources
------------------------------------------------------------------------*/

//---  --------------------------------------------------------

/* stufe 1 joomla 3x +  to 4 prepare *
$srcDbName = 'joomla3x';
$dstDbName = 'joomla4x_RSG2_ReleaseBase';

$srcFolder = 'joomla3x';
$dstFolder = 'joomla4x_RSG2_ReleaseBase';
$cfgFile   = 'configuration.php';
$srcString = 'joomla3x';
$dstString = 'joomla4x_rsg2_releasebase';
/**/

/* stufe 2 (J3x RSG2) on joomla4x  to J4x upgrade */
$srcDbName = 'joomla4x_RSG2_ReleaseBase';
$dstDbName = 'joomla4x_upgraded';

$srcFolder = 'joomla4x_RSG2_ReleaseBase';
$dstFolder = 'joomla4x_upgraded';
$cfgFile   = 'configuration.php';
$srcString = 'joomla4x_rsg2_releasebase';
$dstString = 'joomla4x_upgraded';
/**/


//--- start move --------------------------------------------------------

$isOverwrite = true;


// extract from database
$db_access = new db_access ();

if ($startOn <= doExport)
{
	$db_access->DbName = $srcDbName;
	$db_access->backup_name = $srcDbName . '.sql';
	$isExported        = $db_access->exportDb();
}

if ($startOn <= doRecreate)
{
	$db_access->DbName = $dstDbName;
	$isRecreated       = $db_access->recreateDB();
}


if ($startOn <= doImport)
{
	$db_access->DbName      = $dstDbName;
	$db_access->backup_name = $srcDbName . '.sql';
	$isImported             = $db_access->importDb();
}


// class 4 delete and copy files
$copyFiles = new copyFiles ();

if ($startOn <= doDeleteFiles)
{
	$copyFiles->dstFolder = $dstFolder;
	$copyFiles->deleteFiles();
}


if ($startOn <= doCopyFiles)
{
	$copyFiles->srcFolder = $srcFolder;
	$copyFiles->dstFolder = $dstFolder;
	$copyFiles->copyFiles();
}

$renameInConfig = new renameInConfig();
if ($startOn <= doRenameConfig)
{
	$renameInConfig->dstFolder = $dstFolder;
	$renameInConfig->cfgFile   = $cfgFile;
	$renameInConfig->srcString = $srcString;
	$renameInConfig->dstString = $dstString;
	$renameInConfig->isOverwrite = $isOverwrite;

	$renameInConfig->renameInConfig();
}


