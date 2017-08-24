<?php

// This class for phpnaptor

class phpnaptor {

   //application requirement 
   var $appname;
   var $info;
   var $stateid;

   // buat method untuk class laptop
   function start($app) {
     $this->appname=$app;
   }

   function write($stateid, $info) {

      //Cetak ke var log
      $slog   = "logdate=".time().";";
      $slog  .= "logapp=\"".$this->appname."\";";
      $slog  .= "logstate=".$stateid.";";
      $slog  .= "loginfo=\"".$info."\";";

      $ffile = file_put_contents("/var/log/naptor/".$this->appname.".log", $slog.PHP_EOL , FILE_APPEND | LOCK_EX);
 //Write to /var/log/naptor/


   }
}
?>
