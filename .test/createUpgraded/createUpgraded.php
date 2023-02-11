<?php

require_once('exportDB.php');
require_once('copyFiles.php');
require_once('renameInConfig.php');

const doExport = 1;
const doRecreate = 2;
const doImport = 3;

const doDeleteFiles = 4;
const doCopyFiles   = 5;

const doRenameConfig = 6;


// for debug
$startOn = doRenameConfig;

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


// class 4 delete and copy files
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

$renameInConfig = new renameInConfig();
if ($startOn <= doRenameConfig)
{
	$renameInConfig->dstFolder = "joomla4x_upgraded";
	$renameInConfig->cfgFile   = "configuration.php";
	$renameInConfig->srcString = "joomla4x_rsg2_releasebase";
	$renameInConfig->dstString = "joomla4x_upgraded";
	$renameInConfig->isOverwrite = true;

	$renameInConfig->renameInConfig();
}


