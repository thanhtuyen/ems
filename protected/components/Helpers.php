<?php
/**
 * This is the shortcut to DIRECTORY_SEPARATOR
 */
defined('DS') or define('DS',DIRECTORY_SEPARATOR);


/**
 * It will return our WebApp.
 * to remove the code at our WebApp Yii::app()
 * Returns the application singleton, null if the singleton has not been created yet.
 * @return CApplication the application singleton, null if the singleton has not been created yet.
 */
function app()
{
  return Yii::app();
}

/*
 * convert string to lower case
 */
function textlower ($text){
  return strtolower($text);
}

/**
 * @param $value
 * @return string
 */
function encrypt($value) {
  return md5($value);
}

// Find the position of the first occurrence of a substring in a string
function startsWith($haystack, $needle)
{
  return strpos($haystack, $needle);
}

/*
 * return unix timestamp of current date
 */
function gettime(){
  return time();
}

/*
 *
 */
function get_date($date, $format){
  if(!$format) {
    $date = date('M-d-Y',$date);
  } else {
    $date = date($format,$date);
  }
  return $date;
}

/*
 * This function tries to return a string with all NUL bytes, HTML and PHP tags stripped from a given string
 */
function Clean($arr){
  foreach($arr as $key=>$value){
    $arr[$key] = strip_tags($value);
  }
  return $arr;
}

/*
 *
 */
function TimetoUnit($time, $format='MM-dd-yyyy'){

  $result = CDateTimeParser::parse ($time,$format);
  return $result;
}
?>