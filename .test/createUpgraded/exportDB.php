<?php

class db_access
{

	//ENTER THE RELEVANT INFO BELOW
	public string $mysqlUserName = "";
	public string $mysqlPassword = "";
	public string $mysqlHostName = "";
	public string $DbName = "";
	public string $backup_name = "";
	public  $tables = false;

	// protected string $tables             = "Your tables";


	public function __construct($mysqlUserName = '', $mysqlPassword = '', $mysqlHostName = '', $DbName = '', $backup_name = '', $tables = false)
	{
		$this->init();

		if ($mysqlUserName != '')
		{
			$this->mysqlUserName = $mysqlUserName;
		}
		if ($mysqlPassword != '')
		{
			$this->mysqlPassword = $mysqlPassword;
		}
		if ($mysqlHostName != '')
		{
			$this->mysqlHostName = $mysqlHostName;
		}
		if ($DbName != '')
		{
			$this->DbName = $DbName;
		}
		if ($backup_name != '')
		{
			$this->backup_name = $backup_name;
		}
		if ($tables != '')
		{
			$this->tables = $tables;
		}

	}

	public function init()
	{

		$this->mysqlUserName = "root";
		$this->mysqlPassword = "";
		$this->mysqlHostName = "localhost";
//		$this->DbName        = "joomla4x_rsg2_3x";
//		$this->backup_name   = "joomla4x_upgraded.sql";  // ToDo: Date ?
		$this->DbName        = "joomla4x_RSG2_ReleaseBase";
		$this->backup_name   = "joomla4x_RSG2_ReleaseBase.sql";  // ToDo: Date ?
		// $this->tables        = "";

	}



	//or add 5th parameter(array) of specific tables:    array("mytable1","mytable2","mytable3") for multiple tables

// Export_Database($mysqlHostName, $mysqlUserName, $mysqlPassword, $DbName, $tables = false, $backup_name = false);



// d:\wamp64\bin\mysql\mysql8.0.32\bin\mysqldump.exe
// exec('d:\wamp64\bin\mysql\mysql8.0.32\bin\mysqldump.exe -u root --no-create-info joomla4x_rsg2_releasebase > joomla4x_rsg2_releasebase2.sql')
// exec('mysqldump -u [user] -p[pass] --no-create-info mydb > mydb.sql');

	function exportDb($mysqlUserName='', $mysqlPassword='', $mysqlHostName='', $DbName='', $tables = false, $backup_name = false)
	{

		if ($mysqlUserName == '')
		{
			$mysqlUserName = $this->mysqlUserName;
		}
		if ($mysqlPassword == '')
		{
			$mysqlPassword = $this->mysqlPassword;
		}
		if ($mysqlHostName == '')
		{
			$mysqlHostName = $this->mysqlHostName;
		}
		if ($DbName == '')
		{
			$DbName = $this->DbName;
		}
		if ($backup_name == '')
		{
			$backup_name = $this->backup_name;
		}
		if ($tables == '')
		{
			$tables = $this->tables;
		}

		$isExported = false;

		try
		{

//			$mysqli = new mysqli($mysqlHostName, $mysqlUserName, $mysqlPassword, $DbName);
//			$mysqli->select_db($DbName);
//			$mysqli->query("SET NAMES 'utf8'");
//
//			$queryTables = $mysqli->query('SHOW TABLES');
//			while ($row = $queryTables->fetch_row())
//			{
//				$target_tables[] = $row[0];
//			}
//			if ($tables !== false)
//			{
//				$target_tables = array_intersect($target_tables, $tables);
//			}
//			foreach ($target_tables as $table)
//			{
//				$result        = $mysqli->query('SELECT * FROM ' . $table);
//				$fields_amount = $result->field_count;
//				$rows_num      = $mysqli->affected_rows;
//				$res           = $mysqli->query('SHOW CREATE TABLE ' . $table);
//				$TableMLine    = $res->fetch_row();
//				$content       = (!isset($content) ? '' : $content) . "\n\n" . $TableMLine[1] . ";\n\n";
//
//				for ($i = 0, $st_counter = 0; $i < $fields_amount; $i++, $st_counter = 0)
//				{
//					while ($row = $result->fetch_row())
//					{ //when started (and every after 100 command cycle):
//						if ($st_counter % 100 == 0 || $st_counter == 0)
//						{
//							$content .= "\nINSERT INTO " . $table . " VALUES";
//						}
//						$content .= "\n(";
//						for ($j = 0; $j < $fields_amount; $j++)
//						{
//							$row[$j] = str_replace("\n", "\\n", addslashes($row[$j]));
//							if (isset($row[$j]))
//							{
//								$content .= '"' . $row[$j] . '"';
//							}
//							else
//							{
//								$content .= '""';
//							}
//							if ($j < ($fields_amount - 1))
//							{
//								$content .= ',';
//							}
//						}
//						$content .= ")";
//						//every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
//						if ((($st_counter + 1) % 100 == 0 && $st_counter != 0) || $st_counter + 1 == $rows_num)
//						{
//							$content .= ";";
//						}
//						else
//						{
//							$content .= ",";
//						}
//						$st_counter = $st_counter + 1;
//					}
//				}
//
//				$content .= "\n\n\n";
//			}
//
//			//--- write to backup file -----------------------------------------
//
//			//$backup_name = $backup_name ? $backup_name : $backup_name."___(".date('H-i-s')."_".date('d-m-Y').")__rand".rand(1,11111111).".sql";
//			$backup_name = $backup_name ? $backup_name : $backup_name . ".sql";
//			//$backup_name = $backup_name . ".sql";
//
//			if (file_exists ($backup_name)) {
//				unlink ($backup_name);
//			}
//
//			$myfile = fopen($backup_name, "w") or die("Unable to open file!");
//			fwrite($myfile, $content);
//			fclose($myfile);
//
//			$isExported = true;
//
//
////			header('Content-Type: application/octet-stream');
////			header("Content-Transfer-Encoding: Binary");
////			header("Content-disposition: attachment; filename=\"" . $backup_name . "\"");
////			echo $content;


// exec('d:\wamp64\bin\mysql\mysql8.0.32\bin\mysqldump.exe -u root --no-create-info joomla4x_rsg2_releasebase > joomla4x_rsg2_releasebase2.sql')

			// $mysqlUserName='', $mysqlPassword='', $mysqlHostName='', $DbName='', $tables = false, $backup_name = false
			// exec('mysqldump -u [user] -p[pass] --no-create-info mydb > mydb.sql');


//
//
//To backup:
//
//mysqldump -u user -p database > backup.sql
//To import:
//
//mysql -u user -p database < backup.sql
//
//
			// https://github.com/tazotodua/useful-php-scripts/blob/master/my-sql-export%20(backup)%20database.php
			// https://github.com/tazotodua/useful-php-scripts/blob/master/my-sql-import%20(restore)%20database.php


			//--- mysqldump ----------------------------------------------------------------------

			// $pass="''";
			$pass='';
			if (strlen($mysqlPassword) > 0) {
				$pass='-p ' . $mysqlPassword; // . '-p ' . $pass . ' '
			}

			$cmd = 'd:\wamp64\bin\mysql\mysql8.0.32\bin\mysqldump.exe '
				. '-u ' . $mysqlUserName . ' '
				. $pass . ' '
				. $DbName . ' '
				. '> ' . $DbName . '.sql';
			exec ($cmd);

		}
		catch (exception $e) {
			echo "error: " . $e->getMessage();
		}
		finally {
			//optional code that always runs
		}

		return $isExported;
	}

	public function recreateDB ($mysqlUserName='', $mysqlPassword='', $mysqlHostName='', $DbName='') {

		if ($mysqlUserName == '')
		{
			$mysqlUserName = $this->mysqlUserName;
		}
		if ($mysqlPassword == '')
		{
			$mysqlPassword = $this->mysqlPassword;
		}
		if ($mysqlHostName == '')
		{
			$mysqlHostName = $this->mysqlHostName;
		}
		if ($DbName == '')
		{
			$DbName = $this->DbName;
		}

		//$isDropped = false;
		$isCreated = false;

		try {
			
			//--- drop (delete) database ---------------------------------------------
			
			// $mysqli = new mysqli( "localhost", "user", 'password', "database");
			$mysqli = new mysqli($mysqlHostName, $mysqlUserName, $mysqlPassword, $DbName);

			//$mysqli->execute_query()
			$isDropped = $mysqli->query('DROP DATABASE IF EXISTS ' . $DbName);


//			//Set encoding
//			mysql_query("SET CHARSET utf8");
//			mysql_query("SET NAMES 'utf8' COLLATE 'utf8_general_ci'");

			//--- create empty database ---------------------------------------------
			
			//if ($isDropped)
			{
				// $isCreated = $mysqli->query('CREATE DATABASE ' . $DbName . '  CHARACTER SET utf8 COLLATE utf8_general_ci;');
				$isCreated = $mysqli->query("CREATE DATABASE " . $DbName . " CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';");
			}

		}
		catch (exception $e) {
			echo "error: " . $e->getMessage();
		}
		finally {
			//optional code that always runs
		}

		return $isCreated;
	}

	public function importDB ($mysqlUserName='', $mysqlPassword='', $mysqlHostName='', $DbName='', $backup_name = false) {

		if ($mysqlUserName == '')
		{
			$mysqlUserName = $this->mysqlUserName;
		}
		if ($mysqlPassword == '')
		{
			$mysqlPassword = $this->mysqlPassword;
		}
		if ($mysqlHostName == '')
		{
			$mysqlHostName = $this->mysqlHostName;
		}
		if ($DbName == '')
		{
			$DbName = $this->DbName;
		}
		if ($backup_name == '')
		{
			$backup_name = $this->backup_name;
		}

		//$isDropped = false;
		$isImported = false;

		try {

			$sqlLines = file_get_contents($backup_name);

			$mysqli = new mysqli($mysqlHostName, $mysqlUserName, $mysqlPassword, $DbName);
			$mysqli->select_db($DbName);
			$mysqli->query("SET NAMES 'utf8'");

			/* execute multi query */
			$isImported = $mysqli->multi_query($sqlLines);

		}
		catch (exception $e) {
			echo "error: " . $e->getMessage();
		}
		finally {
			//optional code that always runs
		}

		return $isImported;
	}

}
?>