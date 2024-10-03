<?php

namespace CopyrightText;

use option\option;

/**
 * Sem-Version with additional build number
 *
 */
class copyrightText {

    //
    public string $inCopyrightText='';
    public string $outCopyrightText='';

    //--- tasks ---------------------------------

    public bool $isIncreaseMajor = false;
    public bool $isIncreaseMinor = false;
    public bool $isIncreasePatch = false; // release
    public bool $isIncreaseBuild = false;

    public string $actCopyright = '';
    public string $sinceCopyright = '';

    // to actual year
    public bool $isUpdateAct = false;

    public bool $isAssignAct = false;
    public string $forceAct = '';

    public bool $isAssignSince = false;
    public string $forceSince = '';

    // fix will increase revision and reset build counter
    public bool $isBuildFix = false;

    // ToDo: Semantic $isRc  $isAlpha, $isBeta : pre release number for RC, Alpa ...
    //  1.0.0-alpha.1 1.0.0-beta.11 1.0.0-rc.1

    /*--------------------------------------------------------------------
    construction
    --------------------------------------------------------------------*/

    // ToDo: a lot of parameters ....
    public function __construct($copyrightText = "") {

        $this->inCopyrightText = $copyrightText;
        $this->outCopyrightText = $copyrightText;

    }


    public function setFlags(bool $isIncreaseMajor = false,
        bool $isIncreaseMinor = false,
        bool $isIncreasePatch = false, // release
        bool $isIncreaseBuild = false) : void
    {
        $this->isIncreaseMajor = $isIncreaseMajor;
        $this->isIncreaseMinor = $isIncreaseMinor;
        $this->isIncreasePatch = $isIncreasePatch; // release
        $this->isIncreaseBuild = $isIncreaseBuild;
    }

    public static function id_2_numbers ($copyrightText = ' . . . ') //: [number,number, number, number]
    {
        $major = 0;
        $minor = 0;
        $patch = 0;
        $build = 0;

        $parts = explode('.', $copyrightText);

        $count = count($parts);

        if ($count > 0) { $major = intval($parts[0]); }
        if ($count > 1) { $minor = intval($parts[1]); }
        if ($count > 2) { $patch = intval($parts[2]); }
        if ($count > 3) { $build = intval($parts[3]); }

        return [$major, $minor, $patch, $build];
    }

    public static function numbers_2_id ($major=0, $minor=0, $patch=0, $build=0) : string
    {
        $copyrightText = strval($major) . '.' . strval($minor) . '.' . strval($patch) . '.' . strval($build);

        return $copyrightText;
    }

    // leave out build
    public static function numbers_2_id_release ($major=0, $minor=0, $patch=0, $build=0) : string
    {
        $copyrightText = strval($major) . '.' . strval($minor) . '.' . strval($patch);

        return $copyrightText;
    }


    public function update() : string {

        // force
        if ($this->isForceVersion) {

            $this->outCopyrightText = $this->forceCopyrightText;

        } else {

            [$major, $minor, $patch, $build] = self::id_2_numbers($this->inCopyrightText);

            // pre flags

            // increase revision and reset build counter
            if ($this->isBuildFix) {
                $patch++;
                $build = 0;
                $this->outCopyrightText = self::numbers_2_id($major, $minor, $patch, $build);
            }
            else
            {
                // increase minor and reset revision and build counter
                if ($this->isBuildRelease) {
                    $minor++;
                    $patch = 0;
                    $build = 0;
                    $this->outCopyrightText = self::numbers_2_id_release($major, $minor, $patch, $build);
                }
                else {

                    // increase by flags (lower counter will be reset to '0'

                    if ($this->isIncreaseBuild) {
                        $build ++;
                    }

                    if ($this->isIncreasePatch) {
                        $patch ++;
                        $build = 0;
                    }
                    if ($this->isIncreaseMinor) {
                        $minor ++;
                        $patch = 0;
                        $build = 0;
                    }

                    if ($this->isIncreaseMajor) {
                        $major ++ ;
                        $minor = 0;
                        $patch = 0;
                        $build = 0;
                    }

                    $this->outCopyrightText = self::numbers_2_id($major, $minor, $patch, $build);
                }
            }

        }

        return $this->outCopyrightText;
    }

    // Task name with options
    public function assignVersionOption(option $option): bool
    {
        $isVersionOption = false;

        switch (strtolower($option->name)) {
            //--- Version flags -------------------------------------------------------------

            case 'forceversion':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->forceCopyrightText = $option->value;
                $this->isForceVersion = true;
                $isVersionOption  = true;
                break;

            case 'isincreasemajor':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isIncreaseMajor = true;
                $isVersionOption  = true;
                break;

            case 'isincreaseminor':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isIncreaseMinor = true;
                $isVersionOption  = true;
                break;

            case 'isincreasepatch':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isIncreasePatch = true;
                $isVersionOption  = true;
                break;

            case 'isincreasebuild':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isIncreaseBuild = true;
                $isVersionOption  = true;
                break;

            case '$isbuildelease':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isBuildRelease = $option->value;
                $isVersionOption  = true;
                break;

            case '$isBuildFix':
                print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                $this->isBuildFix = $option->value;
                $isVersionOption  = true;
                break;

//				case 'X':
//					print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
//					break;

        } // switch

        return $isVersionOption;
    }


    public function text(): string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- copyrightText ---" . "\r\n";


        $OutTxt .= "Not defined yet " . "\r\n";

        /**
         * $OutTxt .= "fileName: " . $this->fileName . "\r\n";
         * $OutTxt .= "fileExtension: " . $this->fileExtension . "\r\n";
         * $OutTxt .= "fileBaseName: " . $this->fileBaseName . "\r\n";
         * $OutTxt .= "filePath: " . $this->filePath . "\r\n";
         * $OutTxt .= "srcPathFileName: " . $this->srcPathFileName . "\r\n";
         * /**/

        return $OutTxt;
    }


}