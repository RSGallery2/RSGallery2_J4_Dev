@ECHO Off
REM testOriginal.bat
CLS

REM PHP .\original.php -p "..\..\RSGallery2_J4"
REM .\original.php -p "..\..\RSGallery2_J4"
REM php.exe -f ".\original.php" -- -p "..\..\RSGallery2_J4"
REM php.exe -f "./original.php" -- -p "../../RSGallery2_J4"
php.exe -f "./original.php" -- -s "./original.php" -d "./original.php"

