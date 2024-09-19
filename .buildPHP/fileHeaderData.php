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
        $date_format = 'Y';
        $copyrightDate = date($date_format);

        $this->package = "RSGallery2";
        $this->subpackage = "com_rsgallery2";
        $this->copyright = "2016-2024 RSGallery2 Team";
        $this->copyrightToday = $copyrightDate . "-" . $copyrightDate . " RSGallery2 Team";
        $this->license = "GNU General Public License version 2 or later";
        //$this->license = "http://www.gnu.org/copyleft/gpl.html GNU/GPL";
        $this->author = "RSGallery2 Team <team2@rsgallery2.org>";
        $this->link = "https://www.rsgallery2.org";

        // $this->addition = "RSGallery is Free Software";
        // $this->since = ""; see constManifest.php
        // $this->$version = ""; see constManifest.php

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
                        $value = $this->scan4CopyrightHeaderInLine($line);
                    } else {
                        $value = $this->scan4HeaderValueInLine($name, $line);
                    }

                    switch ($name) {
                        case 'package':
                            $this->package = $value;
                            break;
                        case 'subpackage':
                            $this->subpackage = $value;
                            break;
                        case 'copyright':
                            $this->copyright = $value;
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

    private function extractNameFromHeaderLine(string $line)
    {
        $name = '';
        $behind = '';

        //  * @copyright (c) 2005-2024 RSGallery2 Team
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
        $value = $this->copyrightToday;

        //   * @copyright (c)  2020-2022 Team
        $idx = strpos($line, '(c)');
        if ($idx !== false) {
            $idx += 1 + strlen('(c)');

            $value = trim(substr($line, $idx));
        }

        return $value;
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

        $OutTxt .= "copyright: " . $this->copyright . "\r\n";
        $OutTxt .= "creationDateToday: " . $this->copyrightToday . "\r\n";
        $OutTxt .= "author: " . $this->author . "\r\n";
        $OutTxt .= "license: " . $this->license . "\r\n";
        $OutTxt .= "package: " . $this->package . "\r\n";

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
            $outLines[] = $this->headerFormat('copyright  (c)', $this->copyright);
            $outLines[] = $this->headerFormat('license', $this->license);

            $outLines[] = " */" . "\r\n";

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $outLines;
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
        $OutTxt .= $this->headerFormat('copyright  (c)', $this->copyright);
        $OutTxt .= $this->headerFormat('license', $this->license);

//       $OutTxt .= $this->headerFormat('link', $this->link);

//        $OutTxt .= $this->headerFormat('', $this->license);
//        $OutTxt .= $this->headerFormat('license', $this->license);
//        $OutTxt .= $this->headerFormat('license', $this->license);
//        $OutTxt .= $this->headerFormat('license', $this->license);


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
