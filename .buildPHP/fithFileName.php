<?php

namespace FileName;

use \DateTime;
// use DateTime;


/*================================================================================
Class fithFileName
================================================================================*/

class fithFileName {

    // given name
    public $srcSpecifiedName = "";
    // realpath
    public $srcPathFileName = "";


    // file name part
    public $fileName = "";
    // file name part
    public $fileExtension = "";
    // file name part
    // file name part
    public $fileBaseName = "";
    public $filePath = "";

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct($srcFile="") {

        $hasError = 0;
        try {
            print('*********************************************************' . "\r\n");
            print ("srcFile: " . $srcFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->extractNameParts($srcFile);

        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit __construct: ' . $hasError . "\r\n");
    }

    /*--------------------------------------------------------------------
    extractNameParts
    --------------------------------------------------------------------*/

    function extractNameParts($srcFile="") {
        $hasError = 0;

        try {
            print('*********************************************************' . "\r\n");
            print('extractNameParts' . "\r\n");
            print("srcSpecifiedName: " . $srcFile . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            $this->clear ();

            $this->srcSpecifiedName = $srcFile;

            $this->srcPathFileName = realpath($srcFile);

            $path_parts = pathinfo($srcFile);

            $this->fileName = $path_parts['filename'];
            $this->fileExtension = $path_parts['extension'];
            $this->fileBaseName = $path_parts['basename'];
            $this->filePath = $path_parts['dirname'];
        }
        catch(\Exception $e) {
            echo 'Message: ' .$e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit extractNameParts: ' . $hasError . "\r\n");
        return $hasError;
    }

    /*--------------------------------------------------------------------
    compare for same extension
    --------------------------------------------------------------------*/

    function hasExtension($check = '') {

		$hasExtension = false;

	    if ($this->fileExtension == $check){

			$hasExtension = true;
	    }

        return $hasExtension;
    }

	/*--------------------------------------------------------------------
	compare for name matches regex
	--------------------------------------------------------------------*/

	function nameMatchesRegEx($regex = '') {

		$isMatchesRegex = false;

		if (preg_match($regex, $this->fileName)) {

			$isMatchesRegex = true;
		}

		return $isMatchesRegex;
	}

	/*--------------------------------------------------------------------
	compare for name and extension matches regex
	--------------------------------------------------------------------*/

	function basenameMatchesRegEx($regex = '') {

		$isMatchesRegex = false;

		if (preg_match($regex, $this->fileBaseName)) {

			$isMatchesRegex = true;
		}

		return $isMatchesRegex;
	}

	/*--------------------------------------------------------------------
	compare for name and extension matches regex
	--------------------------------------------------------------------*/

	function pathMatchesRegex($regex = '') {

		$isMatchesRegex = false;

		if (preg_match($regex, $this->filePath)) {

			$isMatchesRegex = true;
		}

		return $isMatchesRegex;
	}

	/*--------------------------------------------------------------------
	clear: init to empty
	--------------------------------------------------------------------*/

    function clear() {

        $this->srcSpecifiedName = "";
        $this->srcPathFileName = "";

        // file name part
        $this->fileName = "";
        $this->fileExtension = "";
        $this->fileBaseName = "";
        $this->filePath = "";

        return;
    }

    public function text()
    {
        $OutTxt = "";
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fithFileName ---" . "\r\n";

        $OutTxt .= "srcSpecifiedName: " . $this->srcSpecifiedName . "\r\n";
        $OutTxt .= "fileName: " . $this->fileName . "\r\n";
        $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
        $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
        $OutTxt .= "filePath: " . $this->filePath . "\r\n";
        $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";

        return $OutTxt;
    }

    public function text_NamePathLine()
    {
        $OutTxt = "";
        $OutTxt .= "- " . $this->fileBaseName . " :: " . $this->filePath;

        return $OutTxt;
    }

} // fithFileName

