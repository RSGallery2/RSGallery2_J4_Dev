<?php

/**
 * Containing folder must be copied parallel to folders to be copied
 *
 *
 * @copyright   (C) 2023 - 2023 RSGallery2 Team
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */


require_once('exportDB.php');
require_once('copyFiles.php');
require_once('renameInConfig.php');

//--- constants ---------------------------------------------------

//--- start of task ---------------------------------
const doExport     = 1;
const doRecreateDB = 2;
const doImport     = 3;
const doDeleteFiles = 4;
const doCopyFiles   = 5;
const doRenameConfig = 6;

//--- source/destination project ----------------------

const prj_3x_to_4x = 1;
const prj_j4_release_to_upgraded = 2;
const prj_j4_release_to_rsg2_j3 = 3;
const prj_joomla3x_rsg2_php8 = 4;
const prj_j4_release_to_upgraded__yyyy = 5;

//--- selections --------------------------------------

// for debug
$startOn = doExport;
$project = prj_joomla3x_rsg2_php8;

/*------------------------------------------------------------------------
select sources
------------------------------------------------------------------------*/

//---  --------------------------------------------------------

// ToDo: more logs
// ToDo: Test github version for export / import again

//--- init source and destination paths -----------------------------------

function sourceAndDestinations(int $project)
{
	switch ($project) {

		case prj_3x_to_4x:
			/* stufe 1 joomla 3x +  to 4 prepare */
			$srcDbName = 'joomla3x';
			$dstDbName = 'joomla4x_RSG2_ReleaseBase';

			$srcFolder = 'joomla3x';
			$dstFolder = 'joomla4x_RSG2_ReleaseBase';
			$cfgFile   = 'configuration.php';
			$srcString = 'joomla3x';
			$dstString = 'joomla4x_rsg2_releasebase';
			/**/
		break;

		case prj_j4_release_to_upgraded:
			/* stufe 2 (J3x RSG2) on joomla4x  to J4x upgrade */
			$srcDbName = 'joomla4x_RSG2_ReleaseBase';
			$dstDbName = 'joomla4x_upgraded';

			$srcFolder = 'joomla4x_RSG2_ReleaseBase';
			$dstFolder = 'joomla4x_upgraded';
			$cfgFile   = 'configuration.php';
			$srcString = 'joomla4x_rsg2_releasebase';
			$dstString = 'joomla4x_upgraded';
			/**/
			break;

		case prj_j4_release_to_rsg2_j3:
			/* stufe 2  on joomla4x  to rsg2 Of J3 on J4 */
			$srcDbName = 'joomla4x_RSG2_ReleaseBase';
			$dstDbName = 'joomla4x_rsg2_3x';

			$srcFolder = 'joomla4x_RSG2_ReleaseBase';
			$dstFolder = 'joomla4x_rsg2_3x';
			$cfgFile   = 'configuration.php';
			$srcString = 'joomla4x_rsg2_releasebase';
			$dstString = 'joomla4x_rsg2_3x';
			/**/
			break;

		case prj_joomla3x_rsg2_php8:
			/* stufe 1  joomla3x  to rsg2 Of J3 with php8 tests */
			$srcDbName = 'joomla3x';
			$dstDbName = 'joomla3x_rsg2_php8';

			$srcFolder = 'joomla3x';
			$dstFolder = 'joomla3x_rsg2_php8';
			$cfgFile   = 'configuration.php';
			$srcString = 'joomla3x';
			$dstString = 'joomla3x_rsg2_php8';
			/**/
			break;

		case prj_j4_release_to_upgraded__yyyy:

			break;

	}

	return [$srcDbName, $dstDbName,
		$srcFolder, $dstFolder,
		$cfgFile,
		$srcString, $dstString];
}

[$srcDbName, $dstDbName,
	$srcFolder, $dstFolder,
	$cfgFile,
	$srcString, $dstString] =
	sourceAndDestinations ($project);

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

if ($startOn <= doRecreateDB)
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


