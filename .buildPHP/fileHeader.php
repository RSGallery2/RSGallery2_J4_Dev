<?php

namespace FileHeader;

//use \DateTime;
// use DateTime;


/*================================================================================
Class fileHeader
================================================================================*/

class fileHeader {

    //
    public string $package =  "com_rsgallery2";
    //
    public string $subpackage =  "com_rsgallery2";
    //
    public string $copyright = "(C) 2016-2024 RSGallery2 Team";
    public string $copyrightToday = "(C) 2024-2024 RSGallery2 Team";

    //public string $license = "GNU General Public License version 3 or later";
    public string $license = "GNU General Public License version 2 or later; see LICENSE.txt";
    //public string $license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";

    //
    public string $author = "rsgallery2 team";

    //
    public string $link = "https://www.rsgallery2.org";

    //
    // public string $addition = "RSGallery is Free Software";

    //
    // public string $since = ""; see constManifest.php

    //
    // public string $version = ""; see constManifest.php

    /**
     * @var string array
     */
    public $additionalLines = [];

    // adjust lengt of 'name' before value
    private int $padCount = 15; // By 'subpackage' name length


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct() {

        $this->init ();

    }

    public function init () {

        // $date_format        = 'Ymd';
        $date_format        = 'd.m.Y';
        $copyrightDate = date ($date_format);

        $this->package =  "RSGallery2";
        $this->subpackage =  "com_rsgallery2";
        $this->copyright = "(C) 2016-2024 RSGallery2 Team";
        $this->copyrightToday = "(C) " . '-' . $copyrightDate . "-" . $copyrightDate .  "RSGallery2 Team";
        $this->license = "GNU General Public License version 2 or later; see LICENSE.txt";
        //$this->license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";
        $this->author = "rsgallery2 team";
        $this->link = "https://www.rsgallery2.org";

        // $this->addition = "RSGallery is Free Software";
        // $this->since = ""; see constManifest.php
        // $this->$version = ""; see constManifest.php

    }

    public function text()
    {
        $OutTxt = "";
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fileHeader ---" . "\r\n";

        $OutTxt .= "copyright: " . $this->copyright . "\r\n";
        $OutTxt .= "creationDateToday: " . $this->copyrightToday . "\r\n";
        $OutTxt .= "license: " . $this->license . "\r\n";
        $OutTxt .= "package: " . $this->package . "\r\n";
        $OutTxt .= "link: " . $this->link . "\r\n";
        $OutTxt .= "author: " . $this->author . "\r\n";

        return $OutTxt;
    }

    public function headerText()
    {
        $OutTxt = "";
        $OutTxt .= "/**" . "\r\n";

        $OutTxt .= $this->headerFormat('package', $this->package);
        $OutTxt .= $this->headerFormat('subpackage', $this->subpackage);
        $OutTxt .= $this->headerFormat('copyright', $this->copyright);
        $OutTxt .= $this->headerFormat('license', $this->license);

        $OutTxt .= $this->headerFormat('author', $this->author);
        $OutTxt .= $this->headerFormat('link', $this->link);

//        $OutTxt .= $this->headerFormat('', $this->license);
//        $OutTxt .= $this->headerFormat('license', $this->license);
//        $OutTxt .= $this->headerFormat('license', $this->license);
//        $OutTxt .= $this->headerFormat('license', $this->license);


        $OutTxt .= " */" . "\r\n";

        return $OutTxt;
    }

    public function headerFormat($name, $value) // , int $padCount
    {
        $headerLine = str_pad(" * @" . $name, $this->padCount, " ", STR_PAD_RIGHT);
        $headerLine .= $value . "\r\n";

        return $headerLine;
    }
} // fileHeader

