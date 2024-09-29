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

    private array $inLines;
    private array $outLines;

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


    public function __construct($srcRoot = "",
        $manifestPathFileName = '',
        $componentName = '',
        $extension = '',
        $type = ''
    )
    {
        try {
//            print('*********************************************************' . "\r\n");
//            print ("Construct increaseVersionId: " . "\r\n");
////            print ("srcFile: " . $srcFile . "\r\n");
////            print ("dstFile: " . $dstFile . "\r\n");
//            print('---------------------------------------------------------' . "\r\n");

            parent::__construct ($srcRoot, false);

            $this->manifestPathFileName = $manifestPathFileName;
            $this->componentName = $componentName;
            $this->extension = $extension;
            $this->type = $type;

        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
        }
    }

    public function __construct2($srcRoot = "",
        $manifestPathFileName = ''
    )
    {
        try {
            parent::__construct($srcRoot, false);

            $this->manifestPathFileName = $manifestPathFileName;

            if (is_file($manifestPathFileName)) {

                [$componentName, $extension, $type] =;

                $this->componentName = $componentName;
                $this->extension     = $extension;
                $this->type          = $type;
            }
        } catch (Exception $e) {
            echo 'Message: ' . $e->getMessage() . "\r\n";
            $hasError = -101;
        }
        // print('exit __construct: ' . $hasError . "\r\n");
    }

    private function manifestDataInLines() : void
    {
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

        foreach ($this->inLines as $line) {

            $itemName = $this->itemName($line);

            // first section read -> (actually) exit
            if ($itemName == '') {
                break;
            }

            switch ($itemName) {

                case 'extension':
                    [$this->type, $this->method] = $this->extractExtension ($line);
                    break;

                case 'name':
                    $this->componentName = $this->extractContent ($line);
                    break;

                case 'creationDate':
                    $this->componentName = $this->extractContent ($line);
                    break;

                case 'author':
                    $this->extractE ($line);
                    break;

                case 'authorEmail':
                    $this->extractE ($line);
                    break;

                case 'authorUrl':
                    $this->extractE ($line);
                    break;

                case 'copyright':
                    $this->extractE ($line);
                    break;

                case 'license':
                    $this->extractE ($line);
                    break;

                case 'version':
                    $this->extractE ($line);
                    break;

                case 'description':
                    $this->extractE ($line);
                    break;

                case 'element':
                    $this->extractE ($line);
                    break;

                case '':
                    $this->extractE ($line);
                    break;

                case 'namespace':
                    $this->extractE ($line);
                    break;
                default:
                    throw new \Exception('Unexpected value');
            }

        }

        // ToDo: read file for version


        return;
    }

    private function manifestPathFileName(): string
    {
        if ($this->manifestPathFileName == '') {

            $baseComponentName = $this->baseComponentName();
            $this->manifestPathFileName = $this->srcRoot . '/' . $baseComponentName . '.xml';
        }

        return $this->manifestPathFileName;
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

            $this->inLines = file($manifestFileName);

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
