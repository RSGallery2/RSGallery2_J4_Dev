<?php
$short_options = "f:gc::b::";
$long_options = ["filename:", "grayscale", "contrast::", "brightness::"];
$options = getopt($short_options, $long_options);
if(isset($options["f"]) || isset($options["filename"])) {
    $filename = isset($options["f"]) ? $options["f"] : $options["filename"];
}
$new_name = str_replace('.jpg', '-edited.jpg', $filename);
$filter_list = '';
$im = imagecreatefromjpeg($filename);
if(isset($options["g"]) || isset($options["grayscale"])) {
    $filter_list .= 'Grayscale ';
    imagefilter($im, IMG_FILTER_GRAYSCALE);
}
if(isset($options["b"]) || isset($options["brightness"])) {
    $brightness = isset($options["b"]) ? $options["b"] : $options["brightness"];
    $filter_list .= 'Brightness:'.$brightness.' ';
    imagefilter($im, IMG_FILTER_BRIGHTNESS, $brightness);
}
if(isset($options["c"]) || isset($options["contrast"])) {
    $contrast = isset($options["c"]) ? $options["c"] : $options["contrast"];
    $filter_list .= 'Contrast:'.$contrast.' ';
    imagefilter($im, IMG_FILTER_CONTRAST, $contrast);
}
echo 'Edited Image: '.$filename.' '.$filter_list;
imagejpeg($im, $new_name, 80);
imagedestroy($im);

?>
