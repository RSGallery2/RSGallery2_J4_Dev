<?php

namespace FileHeader;

//use \DateTime;
// use DateTime;


/*================================================================================
Class fileHeader
================================================================================*/

class fileHeaderData
{

    //
    public string $package = "RSGallery2";
    //
    public string $subpackage = "com_rsgallery2";
    //
    public string $copyright = "2016-2024 RSGallery2 Team";
    public string $copyrightToday = "2024-2024 RSGallery2 Team";

    //public string $license = "GNU General Public License version 3 or later";
    public string $license = "GNU General Public License version 2 or later";
    //public string $license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";

    //
    public string $author = "RSGallery2 Team <team2@rsgallery2.org>";

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
    private int $padCount = 20; // By 'subpackage' name length
    // private int $padCountCopyright = 15; // By 'subpackage' name length


    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    public function __construct()
    {
        $this->init();
    }

    public function init()
    {
        // $date_format        = 'Ymd';
        $date_format   = 'Y';
        $copyrightDate = date($date_format);

        $this->package        = "RSGallery2";
        $this->subpackage     = "com_rsgallery2";
        $this->copyright      = "2016-2024 RSGallery2 Team";
        $this->copyrightToday = $copyrightDate . "-" . $copyrightDate . " RSGallery2 Team";
        $this->license        = "GNU General Public License version 2 or later";
        //$this->license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";
        $this->author = "RSGallery2 Team <team2@rsgallery2.org>";
        $this->link   = "https://www.rsgallery2.org";

        // $this->addition = "RSGallery is Free Software";
        // $this->since = ""; see constManifest.php
        // $this->$version = ""; see constManifest.php

    }

    public function text(): string
    {
        $OutTxt = "";
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fileHeader ---" . "\r\n";

        $OutTxt .= "copyright: " . $this->copyright . "\r\n";
        $OutTxt .= "creationDateToday: " . $this->copyrightToday . "\r\n";
        $OutTxt .= "license: " . $this->license . "\r\n";
        $OutTxt .= "package: " . $this->package . "\r\n";
        $OutTxt .= "rsgLink: " . $this->link . "\r\n";
        $OutTxt .= "author: " . $this->author . "\r\n";

        return $OutTxt;
    }

    public function headerText()
    {
        $OutTxt = "";
        $OutTxt .= "/**" . "\r\n";

        $OutTxt .= $this->headerFormat('package', $this->package);
        $OutTxt .= $this->headerFormat('subpackage', $this->subpackage);
        $OutTxt .= $this->headerFormat('copyright  (c)', $this->copyright);
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
        // copyright begins earlier
        $padCount = $this->padCount;

        $headerLine = str_pad(" * @" . $name, $padCount, " ", STR_PAD_RIGHT);
        $headerLine .= $value;

        $headerLine = rtrim($headerLine) . "\r\n";

        return $headerLine;
    }

    public function isDifferent(fileHeaderData $fileHeaderExtern): bool
    {
        $headerLocal  = $this->headerText();
        $headerExtern = $fileHeaderExtern->headerText();

        return $headerLocal !== $headerExtern;
    }

    public function isDifferentByString(string $externHeaderAsString): bool
    {
        $headerLocal  = $this->headerText();
        $headerExtern = $externHeaderAsString;

        return $headerLocal !== $headerExtern;
    }

    public function scan4HeaderValueInLine(string $name, string $line): string
    {
        $value = '';

        $idx = strpos($line, '@' . $name);
        if ($idx !== false) {
            $idx   += 1 + strlen($name);

            $value = trim(substr($line, $idx));
        }

        return $value;
    }

    public function scan4CopyrightHeaderInLine(string $line)
    {
        // fall back
        $value = $this->copyrightToday;

        //   * @copyright (c)  2020-2022 Team
        $idx = strpos($line, '(c)');
        if ($idx !== false) {
            $idx += 1 + strlen('(c)');

            $value = trim(substr($line, $idx));
        }

        return $value;
    }

} // fileHeader
