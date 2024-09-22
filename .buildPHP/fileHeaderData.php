<?php

namespace FileHeader;

//use \DateTime;
// use DateTime;


/*================================================================================
Class fileHeader
================================================================================*/

use Exception;

class fileHeaderData
{
    const CONSTANT = 'constant value';

    const PACKAGE = "RSGallery2";
    const SUBPACKAGE = "com_rsgallery2";
    // 2019 start of J!4 version
    const SINCE_COPYRIGHT_DATE = "2019";
    const LICENSE = "GNU General Public License version 2 or later";
    //$this->license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";
    const AUTHOR = "RSGallery2 Team <team2@rsgallery2.org>";
    const LINK = "https://www.rsgallery2.org";


    //
    public string $package; // = "RSGallery2";
    //
    public string $subpackage; // = "com_rsgallery2";

    // copyright
    // " * @copyright  (c)  2003-2024 RSGallery2 Team"

    private string $copyrightPreHeader; // = "copyright  (c)";
    public string $actCopyrightDate; // = "2024";
    public string $sinceCopyrightDate; // = "2019";
    private string $postCopyrightAuthor; // = "RSGallery2 team";
    
    public string $yearToday = "????";

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

    // adjust length of 'name' before value
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
        $date_format = 'Y';
        $yearToday = date($date_format);

        $this->package = self::PACKAGE;
        $this->subpackage = self::SUBPACKAGE;
        // 2019 start of J!4 version
        $this->actCopyrightDate = $yearToday;
        $this->sinceCopyrightDate = self::SINCE_COPYRIGHT_DATE;
        $this->yearToday = $yearToday;
        $this->license = self::LICENSE;
        $this->author = self::AUTHOR;
        $this->link = self::LINK;

        // $this->addition = "RSGallery is Free Software";
        // $this->since = ""; see constManifest.php
        // $this->$version = ""; see constManifest.php
    }

    function useActual4SinceDate () {

        $this->sinceCopyrightDate  = $this->actCopyrightDate;

    }

/*--------------------------------------------------------------------
    extractNameFromHeaderLine
    --------------------------------------------------------------------*/

    function extractHeaderValuesFromLines(array $headerLines = [])
    {
        $hasError = 0;

        $this->additionalLines = [];

        try {
            $this->init();

            print('*********************************************************' . "\r\n");
            print('extractHeaderValuesFromLines' . "\r\n");
            print ("header lines in: " . count($headerLines) . "\r\n");
            print('---------------------------------------------------------' . "\r\n");

            foreach ($headerLines as $line) {
                [$name, $behind] = $this->extractNameFromHeaderLine($line);

                if (!empty ($name)) {
                    if ($name == 'copyright') {
                        [$this->actCopyrightDate, $this->sinceCopyrightDate] =
                            $this->scan4CopyrightHeaderInLine($line);
                    } else {
                        $value = $this->scan4HeaderValueInLine($name, $line);

                        switch ($name) {
                            case 'package':
                                $this->package = $value;
                                break;
                            case 'subpackage':
                                $this->subpackage = $value;
                                break;
                            case 'license':
                                $this->license = $value;
                                break;
                            case 'author':
                                $this->author = $value;
                                break;
                            case 'link':
                                $this->link = $value;
                                break;

                            default:
                                if (trim($line) != '') {
                                    $this->additionalLines [] = $line;
                                }
                                break;
                        }
                    }
                } else {
                    if (trim($line) != '') {
                        $this->additionalLines [] = $line;
                    }
                }

            } // for lines n section

//            // ToDo: Write to log file with actual name
//            print ('!!! additional header line found: "' . $name . '" !!!' . "\r\n");
//            if (count ($this-> additional Lines)) {
//
//            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        print('exit extractHeaderValuesFromLines: ' . $hasError . "\r\n");

        return $hasError;
    }

    /*--------------------------------------------------------------------
    extractHeaderValuesFromLines
    --------------------------------------------------------------------*/

    // '(c)' of copyright will be ignored here
    private function extractNameFromHeaderLine(string $line)
    {
        $name = '';
        $behind = '';

        //  * @copyright (c) 2005-2024 RSGallery2 Team
        //  * @subpackage      com_rsgallery2
        $atIdx = strpos($line, '@');
        if (!empty($atIdx)) {
            $blankIdx = strpos($line, ' ', $atIdx + 1);

            $name = substr($line, $atIdx + 1, $blankIdx - $atIdx - 1);
            $name = trim($name);
            $behind = substr($line, $blankIdx + 1);
            $behind = trim($behind);
        }

        return [$name, $behind];
    }

    public function scan4CopyrightHeaderInLine(string $line)
    {
        // fall back
        $sinceCopyrightDate = "2016";
        $actCopyrightDate = "2024";

        $value = $this->yearToday;

        //   * @copyright (c)  2020-2022 Team
        $idx = strpos($line, '(c)');
        if ($idx !== false) {
            $idx += 1 + strlen('(c)');

            //$valuePart = trim(substr($line, $idx));
            // preg_match_all('/\d+/', $valuePart, $matches);
            preg_match_all('/\d+/', $line, $matches);

            $finds = $matches [0];
            if (count ($finds) > 2)
            {
                $sinceCopyrightDate = $finds[0];
                $actCopyrightDate = $finds[1];
            }
        }

        return [$sinceCopyrightDate, $actCopyrightDate];
    }

    public function scan4HeaderValueInLine(string $name, string $line): string
    {
        $value = '';

        $idx = strpos($line, '@' . $name);
        if ($idx !== false) {
            $idx += 1 + strlen($name);

            $value = trim(substr($line, $idx));
        }

        return $value;
    }

    public function text(): string
    {
        $OutTxt = "";
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- fileHeader ---" . "\r\n";

        $OutTxt .= "/**" . "\r\n";

        $OutTxt .= $this->headerFormat('package', $this->package);
        $OutTxt .= $this->headerFormat('subpackage', $this->subpackage);
        $OutTxt .= $this->headerFormat('author', $this->author);
        $OutTxt .= $this->headerFormatCopyright(
            $this->sinceCopyrightDate, $this->actCopyrightDate);
        $OutTxt .= $this->headerFormat('license', $this->license);

        $OutTxt .= " */" . "\r\n";

        return $OutTxt;
    }

    public function headerLines(): array
    {
        $outLines = [];

        try {
            $outLines[] = "/**" . "\r\n";

            $outLines[] = $this->headerFormat('package', $this->package);
            $outLines[] = $this->headerFormat('subpackage', $this->subpackage);
            $outLines[] = $this->headerFormat('author', $this->author);
            $outLines[] = $this->headerFormatCopyright(
                $this->sinceCopyrightDate, $this->actCopyrightDate);
            $outLines[] = $this->headerFormat('license', $this->license);

            $outLines[] = " */" . "\r\n";

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $outLines;
    }

    public function headerFormat($name, $value): string // , int $padCount
    {
        // copyright begins earlier
        $padCount = $this->padCount;

        $headerLine = str_pad(" * @" . $name, $padCount, " ", STR_PAD_RIGHT);
        $headerLine .= $value;

        $headerLine = rtrim($headerLine) . "\r\n";

        return $headerLine;
    }

    public function headerFormatCopyright($sinceCopyrightDate, $actCopyrightDate): string // , int $padCount
    {
        // copyright begins earlier
        $padCount = $this->padCount;

        $headerLine = str_pad(" * @" . $this->copyrightPreHeader, $padCount, " ", STR_PAD_RIGHT);
        $headerLine .= $sinceCopyrightDate . '-' . $actCopyrightDate;
        $headerLine .= $this->postCopyrightAuthor;

        $headerLine = rtrim($headerLine) . "\r\n";

        return $headerLine;
    }

    public function isDifferent(fileHeaderData $fileHeaderExtern): bool
    {
        $headerLocal = $this->headerText();
        $headerExtern = $fileHeaderExtern->headerText();

        return $headerLocal !== $headerExtern;
    }

    public function headerText()
    {
        $OutTxt = "";
        $OutTxt .= "/**" . "\r\n";

        $OutTxt .= $this->headerFormat('package', $this->package);
        $OutTxt .= $this->headerFormat('subpackage', $this->subpackage);
        $OutTxt .= $this->headerFormat('author', $this->author);
        $OutTxt .= $this->headerFormatCopyright(
            $this->sinceCopyrightDate, $this->actCopyrightDate);
        $OutTxt .= $this->headerFormat('license', $this->license);

//       $OutTxt .= $this->headerFormat('link', $this->link);

        $OutTxt .= " */" . "\r\n";

        return $OutTxt;
    }

    public function isDifferentByString(string $externHeaderAsString): bool
    {
        $headerLocal = $this->headerText();
        $headerExtern = $externHeaderAsString;

        return $headerLocal !== $headerExtern;
    }

} // fileHeader
