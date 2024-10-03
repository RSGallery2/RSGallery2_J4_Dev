<?php

namespace ManifestFile;

require_once "./baseExecuteTasks.php";
require_once "./iExecTask.php";
require_once "./versionId.php";

use Exception;
use ExecuteTasks\baseExecuteTasks;
use ExecuteTasks\executeTasksInterface;
use task\task;
use VersionId\versionId;

class manifestFile extends baseExecuteTasks
    implements executeTasksInterface
{
    // internal
    public string $manifestPathFileName = '';
//    public string $componentName = '';
//    public string $extension = '';
//    // com, plg, mod
//    public string $type = '';
//    public string $baseComponentName = '';

    private array $headerLines;
    private array $otherLines;
    private array $outLines;

    private string $xmlLine;

    //--- line data -------------------------

    private string $type = '';
    private string $method = '';
    private string $componentName = '';
    private string $creationDate = '';
    private string $author = '';
    private string $authorEmail = '';
    private string $authorUrl = '';
    private string $copyright = '';
    private string $license = '';
    //private string $version = '';
    private versionId $versionId;
    private string $description = '';
    // Name of extension for user like RSGallery2
    private string $element = '';
    private string $namespace = '';

    //--- manifest flags ---------------------------------------

    // copyright-, version- classes have their own

    private bool $isUseActualDate;
//    private bool $isUseActualYear;

    public function __construct(
        $srcRoot = "",
        $manifestPathFileName = ''
    ) {
        try {
            parent::__construct($srcRoot, false);

            $this->manifestPathFileName = $manifestPathFileName;

            if (is_file($manifestPathFileName)) {
                $this->readFile();
            }

            $this->versionId = new versionId();
            // Standard: may be overwritten later
            $this->versionId->isIncreaseBuild = true;

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }

//    public function __construct2($srcRoot = "",
//        $manifestPathFileName = '',
//        $componentName = '',
//        $extension = '',
//        $type = ''
//    )
//    {
//        try {
////            print('*********************************************************' . "\r\n");
////            print ("Construct increaseVersionId: " . "\r\n");
//////            print ("srcFile: " . $srcFile . "\r\n");
//////            print ("dstFile: " . $dstFile . "\r\n");
////            print('---------------------------------------------------------' . "\r\n");
//
//            parent::__construct ($srcRoot, false);
//
//            $this->manifestPathFileName = $manifestPathFileName;
//            $this->componentName = $componentName;
//            $this->extension = $extension;
//            $this->type = $type;
//
//        } catch (Exception $e) {
//            echo 'Message: ' . $e->getMessage() . "\r\n";
//        }
//    }

    private function assignHeaderLine($line): bool
    {
        $isHeaderLine = false;

        try {
            /**
             * <extension type="component" method="upgrade">
             * <name>com_rsgallery2</name>
             * <creationDate>2024.09.13</creationDate>
             * <author>RSGallery2 Team</author>
             * <authorEmail>team2@rsgallery2.org</authorEmail>
             * <authorUrl>https://www.rsgallery2.org</authorUrl>
             * <copyright>(c) 2005-2024 RSGallery2 Team</copyright>
             * <license>GNU General Public License version 2 or later;</license>
             * <version>5.0.12.5</version>
             * <description>COM_RSGALLERY2_XML_DESCRIPTION</description>
             * <element>RSGallery2</element>
             * <namespace path="src">Rsgallery2\Component\Rsgallery2</namespace>
             */

            $itemName = $this->itemName($line);

            // first section read -> (actually) exit
            if ($itemName != '') {
                switch ($itemName) {
                    case 'extension':
                        [$this->type, $this->method] = $this->extractExtension($line);
                        $isHeaderLine = true;
                        break;

                    case 'name':
                        $this->componentName = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'creationDate':
                        $this->creationDate = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'author':
                        $this->author = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'authorEmail':
                        $this->authorEmail = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'authorUrl':
                        $this->authorUrl = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'copyright':
                        $this->copyright = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'license':
                        $this->license = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'version':
                        $this->versionId->inVersionId = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'description':
                        $this->description = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'element':
                        $this->element = $this->extractContent($line);
                        $isHeaderLine = true;
                        break;

                    case 'namespace':
                        // $this->namespace = $this->extractContent($line);
                        $this->namespace = trim($line);
                        $isHeaderLine = true;
                        break;

                    case '?xml':
                        $this->xmlLine = trim($line);
                        $isHeaderLine = true;
                        break;

                    default:
                        throw new \Exception('Unexpected value: "' . $itemName . '"');
                }
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isHeaderLine;
    }

    private function createHeaderLines(): void
    {
        $headerLines = [];

        /**
         * <extension type="component" method="upgrade">
         * <name>com_rsgallery2</name>
         * <creationDate>2024.09.13</creationDate>
         * <author>RSGallery2 Team</author>
         * <authorEmail>team2@rsgallery2.org</authorEmail>
         * <authorUrl>https://www.rsgallery2.org</authorUrl>
         * <copyright>(c) 2005-2024 RSGallery2 Team</copyright>
         * <license>GNU General Public License version 2 or later;</license>
         * <version>5.0.12.5</version>
         * <description>COM_RSGALLERY2_XML_DESCRIPTION</description>
         * <element>RSGallery2</element>
         * <namespace path="src">Rsgallery2\Component\Rsgallery2</namespace>
         */

        // <?xml version="1.0" encoding="utf-8" ? >
        $headerLines[] = $this->xmlLine . "\r\n";

        // <extension type="component" method="upgrade">
        $headerLines[] = $this->createHeaderLineExtension () . "\r\n";

//                case 'name':
        $headerLines[] = $this->createHeaderLine('name', $this->componentName) . "\r\n";

//                case 'creationDate':
        $headerLines[] = $this->createHeaderLine('creationDate', $this->creationDate) . "\r\n";

//                case 'author':
        $headerLines[] = $this->createHeaderLine('author', $this->author) . "\r\n";

//                case 'authorEmail':
        $headerLines[] = $this->createHeaderLine('authorEmail', $this->authorEmail) . "\r\n";

//                case 'authorUrl':
        $headerLines[] = $this->createHeaderLine('authorUrl', $this->authorUrl) . "\r\n";

//                case 'copyright':
        $headerLines[] = $this->createHeaderLine('copyright', $this->copyright) . "\r\n";

//                case 'license':
        $headerLines[] = $this->createHeaderLine('license', $this->license) . "\r\n";

//                case 'version':
        if ($this->versionId->outVersionId == '') {
            $this->versionId->outVersionId = $this->versionId->inVersionId;
        }
        $headerLines[] = $this->createHeaderLine('version', $this->versionId->outVersionId) . "\r\n";

//                case 'description':
        $headerLines[] = $this->createHeaderLine('description', $this->description) . "\r\n";

//                case 'element':
        $headerLines[] = $this->createHeaderLine('element', $this->element) . "\r\n";

//                case 'namespace':
        // $headerLines[] = $this->createHeaderLine('namespace', $this->namespace) . "\r\n";
        $headerLines[] = '    ' . $this->namespace . "\r\n";

        $this->headerLines = $headerLines;

        return;
    }

    private function createHeaderLine(string $name, string $value): string {

        // "    <name>com_rsgallery2</name>"
        $line = '    <' . $name . '>' . $value . '</' . $name . '>';

        return $line;
    }

    private static function manifestPathFileName($srcRoot, $baseComponentName): string
    {
        // $manifestPathFileName = '';

        $manifestPathFileName = $srcRoot . '/' . $baseComponentName . '.xml';

        return $manifestPathFileName;
    }

    private function baseComponentName(): string
    {
//        if ($this->baseComponentName == '') {
//            $this->baseComponentName = substr($this->componentName, 4);
//        }
//
//        return $this->baseComponentName;

        $baseComponentName = substr($this->componentName, 4);

        return $baseComponentName;
    }

    // Task name with options
    public function assignTask(task $task): int
    {
        $this->taskName = $task->name;

        $options = $task->options;

        foreach ($options->options as $option) {

            $isBaseOption = $this->assignBaseOption($option);
            $isVersionOption = $this->versionId->assignVersionOption($option);

            if (!$isBaseOption && !$isVersionOption) {
                switch (strtolower($option->name)) {

                    // manifestFile
                    case 'manifestfile':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->manifestPathFileName = $option->value;
                        break;

                    // component name like com_rsgallery2
                    case 'componentname':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->componentName = $option->value;
                        break;

                    // element: name like RSGallery2
                    case 'element':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->element = $option->value;
                        break;

                    // component / module / plugin
                    case 'type':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->type = $option->value;
                        break;

                    // ToDo: if needed
                    //  method="upgrade">
                    case 'method':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->method = $option->value;
                        break;

                    default:
                        print ('!!! error: required option is not supported: ' . $task->name . '.' . $option->name . ' !!!' . "\r\n");
                } // switch

                // $OutTxt .= $task->text() . "\r\n";
            }
        }

        return 0;
    }


    public function execute(): int // $hasError
    {
        print('*********************************************************' . "\r\n");
        print ("Execute manifestFile: " . "\r\n");
        print('---------------------------------------------------------' . "\r\n");

        $hasError = 0;
        // $hasError = $this->exchangeVersionId();

        // update manifest file name
        // $this->baseComponentName();

        // ToDo: Check versionId changes from outside
        $this->versionId->update();


        return $hasError;
    }

    public function executeFile(string $filePathName): int
    {
        // TODO: Implement executeFile() method.
        return 0;
    }


    public function readFile(string $filePathName=''): bool
    {
        $isRead = false;

        try {

            if ($filePathName != '') {
                // save in class
                $this->manifestPathFileName = $filePathName;
            }

            $manifestFileName = $this->manifestPathFileName;

            if (is_file($manifestFileName)) {
                $inLines = file($manifestFileName);

                $headerLines = [];
                $otherLines  = [];

                $isHeaderLine = true;

                foreach ($inLines as $line) {
                    if ($isHeaderLine) {
                        $isHeaderLine = $this->assignHeaderLine($line);
                        if ($isHeaderLine) {
                            $headerLines[] = $line;
                        } else {
                            $otherLines[] = $line;
                        }
                    } else {
                        $otherLines[] = $line;
                    }
                }

                $this->headerLines = $headerLines;
                $this->otherLines  = $otherLines;

                $isRead = true;
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isRead;
    }

    public function writeFile(string $filePathName): int
    {
        $isSaved = false;

        try {

            if ($filePathName != '') {
                // save in class
                $this->manifestPathFileName = $filePathName;
            }
            $manifestFileName = $this->manifestPathFileName;

            // build header from variables
            $this->createHeaderLines();

            $this->outLines = array_merge ($this->headerLines, $this->otherLines);

            file_put_contents($manifestFileName, $this->outLines);
            $isSaved = True;

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }

        return $isSaved;
    }

    public function extractVersionId (){


    }

    public function exchangeVersionId (){


    }

    public function updateCreationDate (){


    }



    public function text(): string
    {
        $OutTxt = "------------------------------------------" . "\r\n";
        $OutTxt .= "--- versionId ---" . "\r\n";


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

    private function itemName(string $line) {

        $name = '';

        // is xml element
        $idxStart = strpos($line, '<');

        if ($idxStart !== false) {
            // xml flag
            // <?xml version="1.0" encoding="utf-8" ? >
            if (str_contains($line, '<?xml')) {
                $name = '?xml';
            } else {

                // standard form <element>value</element> contains '</'
                // <name>com_rsgallery2</name>
                $idxStandard = strpos($line, '</');
                if ($idxStandard !== false) {

                    $idxEnd = strpos($line, '>', $idxStart+1);
                    if ($idxEnd !== false) {
                        $name = substr($line, $idxStart + 1, $idxEnd - $idxStart-1);
                    }

                    // <namespace path="src">Rsgallery2\Component\Rsgallery2</namespace>
                    // if blank in name use first part
                    $idxSpace = strpos($name, ' ');
                    if ($idxSpace !== false) {
                        $name = substr($name, 0,$idxSpace);
                    }

                } else {
                    // <extension type="component" method="upgrade">
                    // if blank in name use first part
                    $idxSpace = strpos($line, ' ',$idxStart+1);
                    if ($idxSpace !== false) {
                        // $name = substr($name, 0,$idxSpace - 1);
                        $name = substr($line, $idxStart + 1, $idxSpace - 1);
                    }
                }
            }
        }

        return $name;
    }


        private function extractContent(string $line) : string
        {
            $name = '';

            // <element>value</element> contains -> standard form

            $idxStart = strpos($line, '>');

            if ($idxStart !== false) {

                $idxEnd = strpos($line, '<', $idxStart + 1);
                if ($idxEnd !== false) {

                    $name = substr($line, $idxStart +1, $idxEnd - $idxStart -1);
                }

//                // if blank in name use first part
//                $idxSpace =strpos($name, ' ');
//                if ($idxSpace !== false) {
//
//                    $name = substr($name, $idxSpace-1);
//
//                }
            }

            return $name;
        }

    private function extractExtension(string $inLine) {

        $type = '???';
        $method = '???';

        // <extension type="component" method="upgrade">
        $line = trim($inLine);

        if (str_starts_with($line, '<extension')) {

            // ToDo: on multiple lines ???
            // In one line ?
            if (str_contains($line, '>')) {

                //--- type ----------------------------------

                $idxType= strpos($line, 'type=');
                if ($idxType !== false) {
                    $idxStart = strpos($line, '"', $idxType + 4);

                    if ($idxStart !== false) {
                        $idxEnd = strpos($line, '"', $idxStart+1);
                        if ($idxEnd !== false) {
                            $type = substr($line, $idxStart + 1, $idxEnd - $idxStart - 1);
                        }
                    }
                }

                //--- method ----------------------------------

                $idxMethod= strpos($line, 'method=');
                if ($idxMethod !== false) {

                    $idxStart = strpos($line, '"', $idxMethod +7);

                    if ($idxStart !== false) {
                        $idxEnd = strpos($line, '"', $idxStart + 1);
                        if ($idxEnd !== false) {
                            $method = substr($line, $idxStart + 1, $idxEnd - $idxStart - 1);
                        }
                    }
                }

            } else {
                // read part if exists or in next lines ...
                // section starts
            }
        }

        return [$type, $method];
    }

    private function createHeaderLineExtension(): string {

        // <extension type="component" method="upgrade">
        // "    <name>com_rsgallery2</name>"
        $line = '<extension type="' . $this->type . '" method="' . $this->method . '">';

        return $line;
    }

}