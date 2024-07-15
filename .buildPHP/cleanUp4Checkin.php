<?php

$HELP_MSG = <<<EOT


EOT;













    function print_header(string $start)
    {

    }
    function print_end(string $start)
    {

    }


// ================================================================================
// main (used from command line)
// ================================================================================

//--- argv ---------------------------------

// print ("--- argv ---" . "\r\n");
// var_dump($argv);

// print ("--- inArgs ---" . "\r\n");
$inArgs = [];
foreach ($argv as $inArg)
{
	if ( ! str_starts_with($inArg, '-') ) 
	{
		$inArgs[] = $inArg;
	}
	
}
// var_dump($inArgs);

//--- options ---------------------------------

// print ( "--- getopt ---" . "\n");
   
$long_options="";

$options = getopt("fx:", []);

//var_dump($options);

//--- variables ---------------------------------


$LeaveOut_01 = True;
$LeaveOut_02 = True;
$LeaveOut_03 = True;
$LeaveOut_04 = True;
$LeaveOut_05 = True;

$start = date("Y-m-d H:i:s");
dump ($start);



foreach ($options as $option)
{

	switch ($option)
	{
		case 'com_rsgallery2':
			parent::cleanCache('com_rsgallery2');
			parent::cleanCache('mod_articles_archive');
			parent::cleanCache('mod_articles_categories');
			parent::cleanCache('mod_articles_category');
			parent::cleanCache('mod_articles_latest');
			parent::cleanCache('mod_articles_news');
			parent::cleanCache('mod_articles_popular');
			break;

		case "-1":
			$LeaveOut_01 = True;
            print("LeaveOut_01");
			break;
        case "-2":
	        $LeaveOut_02 = True;
            print("LeaveOut__02");
	        break;
        case "-3":
	        $LeaveOut_03 = True;
            print("LeaveOut__03");
	        break;
        case "-4":
	        $LeaveOut_04 = True;
            print("LeaveOut__04");
	        break;
        case "-5":
	        $LeaveOut_05 = True;
            print("LeaveOut__05");
			break;

		default:
			print("Option not supported '" . $option . "'");
			break;
	}

}

//--- call function ---------------------------------

	print_header($start);

	print_end($start);

print ( "--- end  ---" . "\n");

?>
