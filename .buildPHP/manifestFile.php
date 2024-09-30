<?php

namespace ManifestFile;

use Exception;
use ExecuteTasks\baseExecuteTasks;
use ExecuteTasks\executeTasksInterface;
use task\task;

class manifestFile extends baseExecuteTasks
    implements executeTasksInterface
{
    // internal
    private string $manifestPathFileName = '';
//    public string $componentName = '';
//    public string $extension = '';
//    // com, plg, mod
//    public string $type = '';
//    public string $baseComponentName = '';

    private array $headerLines;
    private array $otherLines;
    private array $outHeaderLines;

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
    private string $version = '';
    private string $description = '';
    private string $element = '';
    private string $namespace = '';


    public function __construct(
        $srcRoot = "",
        $manifestPathFileName = ''
    ) {
        try {
            parent::__construct($srcRoot, false);

            $this->manifestPathFileName = $manifestPathFileName;

            if (is_file($manifestPathFileName)) {
//                [$componentName, $extension, $type] =;
//
//                $this->componentName = $componentName;
//                $this->extension     = $extension;
//                $this->type          = $type;


            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
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
                    break;

                case 'name':
                    $this->componentName = $this->extractContent($line);
                    break;

                case 'creationDate':
                    $this->creationDate = $this->extractContent($line);
                    break;

                case 'author':
                    $this->author = $this->extractContent($line);
                    break;

                case 'authorEmail':
                    $this->authorEmail = $this->extractContent($line);
                    break;

                case 'authorUrl':
                    $this->authorUrl = $this->extractContent($line);
                    break;

                case 'copyright':
                    $this->copyright = $this->extractContent($line);
                    break;

                case 'license':
                    $this->license = $this->extractContent($line);
                    break;

                case 'version':
                    $this->version = $this->extractContent($line);
                    break;

                case 'description':
                    $this->description = $this->extractContent($line);
                    break;

                case 'element':
                    $this->element = $this->extractContent($line);
                    break;

                case 'namespace':
                    $this->namespace = $this->extractContent($line);
                    break;
                default:
                    throw new \Exception('Unexpected value');
            }
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

        $headerLines[] = $this->createHeaderLineExtension ();

//                case 'name':
        $headerLines[] = $this->createHeaderLine($this->name, $this->componentName);

//                case 'creationDate':
        $headerLines[] = $this->createHeaderLine($this->name, $this->creationDate);

//                case 'author':
        $headerLines[] = $this->createHeaderLine($this->name, $this->author);

//                case 'authorEmail':
        $headerLines[] = $this->createHeaderLine($this->name, $this->authorEmail);

//                case 'authorUrl':
        $headerLines[] = $this->createHeaderLine($this->name, $this->authorUrl);

//                case 'copyright':
        $headerLines[] = $this->createHeaderLine($this->name, $this->copyright);

//                case 'license':
        $headerLines[] = $this->createHeaderLine($this->name, $this->license);

//                case 'version':
        $headerLines[] = $this->createHeaderLine($this->name, $this->version);

//                case 'description':
        $headerLines[] = $this->createHeaderLine($this->name, $this->description);

//                case 'element':
        $headerLines[] = $this->createHeaderLine($this->name, $this->element);

//                case 'namespace':
        $headerLines[] = $this->createHeaderLine($this->name, $this->namespace);

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
        if ($this->baseComponentName == '') {
            $this->baseComponentName = substr($this->componentName, 4);
        }

        return $this->baseComponentName;
    }

    // Task name with options
    public function assignTask(task $task): int
    {
        $this->taskName = $task->name;

        $options = $task->options;

        foreach ($options->options as $option) {

            $isBaseOption = assignBaseOption($option);
            $isVersionOption = $this->versionId->assignVersionOption($option);

            if (!$isBaseOption && !$isVersionOption) {
                switch (strtolower($option->name)) {

                    // manifestFile
                    case 'manifestFile':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->manifestPathFileName = $option->value;
                        break;

                    // component name like com_rsgallery2
                    case 'componentname':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->componentName = $option->value;
                        break;

                    // extension (<element> name like RSGallery2
                    case 'extension':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->extension = $option->value;
                        break;

                    // com / mod / plg
                    case 'type':
                        print ('     option: ' . $option->name . ' ' . $option->value . "\r\n");
                        $this->componentType = $option->value;
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
        $this->baseComponentName();

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
                $this->manifestFileName = $filePathName;
            }

            $manifestFileName = $this->manifestFileName();

            $inLines = file($manifestFileName);

            $headerLines = [];
            $otherLines = [];

            $isHeaderLine = true;

            foreach ($inLines as $line) {

                if ( $isHeaderLine ) {

                    $isHeaderLine = $this->assignHeaderLine ($line);
                    if ( $isHeaderLine ) {
                        $headerLines[] = $line;
                    } else {
                        $otherLines[] = $line;
                    }
                } else {
                    $otherLines[] = $line;
                }
            }

            $this->headerLines = $headerLines;
            $this->otherLines = $otherLines;

            $isRead = True;

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
                $this->manifestFileName = $filePathName;
            }
            $manifestFileName = $this->manifestFileName();

            // build header from variables
            createHeaderLines();

            $this->outlines = array_merge ($this->headerLines, $this->otherLines);

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

    private function itemName(mixed $line) {

        $name = '';

        $idxStart = strpos($line, '<');

        if ($idxStart !== false) {
            $idxEnd = strpos($line, '>', $idxStart);
            if ($idxEnd !== false) {
                $name = substr($line, $idxStart + 1, $idxEnd - 1);
            }

            // if blank in name use first part
            $idxSpace = strpos($name, ' ');
            if ($idxSpace !== false) {
                $name = substr($name, $idxSpace - 1);
            }
        }

        return $name;
    }


        private function extractContent(mixed $line) {
            $name = '';

            $idxStart = strpos($line, '<');

            if ($idxStart !== false) {

                $idxEnd = strpos($line, '>', $idxStart);
                if ($idxEnd !== false) {

                    $name = substr($line, $idxStart+1, $idxEnd-1);
                }

                // if blank in name use first part
                $idxSpace =strpos($name, ' ');
                if ($idxSpace !== false) {

                    $name = substr($name, $idxSpace-1);

                }

                return $name;
            }
        }

    private function extractExtension(mixed $line) {
        
    }

}
