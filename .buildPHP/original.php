<?php
/*================================================================================
   main (used from command line)
================================================================================*/

print ("--- argv ---" . "\r\n");
   
var_dump($argv);

print ("--- inArgs ---" . "\r\n");
$inArgs = [];
foreach ($argv as $inArg)
{
	if ( ! str_starts_with($inArg, '-') ) 
	{
		$inArgs[] = $inArg;
	}
	
}
var_dump($inArgs);

print ( "--- getopt ---" . "\n");
   
$long_options="";

$options = getopt("fx:", []);


var_dump($options);
//print ( "." . '\r\n');

print ( "--- end  ---" . "\n");
   
