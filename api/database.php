<?php
$hostname = 'localhost';
$username = 'brendan';
$password = 'me32316';
$database = 'hiverecords';
$connection = mysqli_connect($hostname, $username, $password, $database);
if (mysqli_connect_errno()) {
   echo "Connection Failed - " . mysqli_connect_error();
   exit;
}
