<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once __DIR__ . '/database.php';
require_once __DIR__ . '/jwtHandler.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') :
   $headers = getallheaders();
   if (array_key_exists('Authorization', $headers)
                       && preg_match('/Bearer\s(\S+)/', $headers['Authorization'], $matches)) :
      $data = decodeToken($matches[1]);
      $userId = (int) $data;
      if (!is_numeric($data)) sendJson(401, 'Invalid User!');

      $params = json_decode(file_get_contents('php://input'));

      if (!isset($params->hiveid) || empty(trim($params->hiveid))) sendJson(422, 'Missing hive ID');

      $hiveid = (int) trim($params->hiveid);
      if (!is_numeric($hiveid)) sendJson(401, 'Invalid Hive!');

      $sql = "SELECT `id`,`name`,`description`,`mother`,`colour`,`marked`,`clipped`,`origin` FROM `queen` where `hiveid` ='$hiveid';";
      $query = mysqli_query($connection, $sql);
      $count = mysqli_num_rows($query);
      if ($count === 0) sendJson(404, "Queen not found!");
      $rows = array();
      while ($row = mysqli_fetch_assoc($query)) {
         $rows[] = $row;
      }
      sendJson(200, '', $rows);
   endif;
   sendJson(403, "Authorization Token is Missing!");
elseif ($_SERVER['REQUEST_METHOD'] == 'POST') :
   $headers = getallheaders();
   if (array_key_exists('Authorization', $headers)
                       && preg_match('/Bearer\s(\S+)/', $headers['Authorization'], $matches)) :
      $data = decodeToken($matches[1]);
      $userId = (int) $data;
      if (!is_numeric($data)) sendJson(401, 'Invalid User!');

      $params = json_decode(file_get_contents('php://input'));
      $id = (int) trim($params->id);
      $hiveid = (int) trim($params->hiveid);
      $name = trim($params->name);
      $description = trim($params->description);
      $mother = (int) trim($params->mother);
      $colour = trim($params->colour);
      $marked = trim($params->marked);
      $clipped = trim($params->clipped);
      $origin = trim($params->origin);
      if (!isset($params->id) || empty(trim($params->id)))  // Empty queen ID => New hive
      {
         $sql = "INSERT INTO `queen` (`name`, `hiveid`, `description`, `mother`, `colour`, `marked`, `clipped`, `origin`) VALUES ('$name', '$hiveid', '$description', '$mother', '$colour', '$marked', '$clipped', '$origin');";
      } else { // Existing hive - update
         $sql = "UPDATE `hive` SET `name` = '$name', `hiveid` = '$hiveid', `description` = '$description', `mother`='$mother', `colour`='$colour', `marked`='$marked', `clipped`='$clipped', `origin`='$origin' WHERE `id` = '$id';";
      }
     
      $query = mysqli_query($connection, $sql);
      $count = mysqli_num_rows($query);
      if ($count === 0) sendJson(404, "Queen '$id' not found!");
      $rows = array();
      while ($row = mysqli_fetch_assoc($query)) {
         $rows[] = $row;
      }
      sendJson(200, '', $rows);
   endif;
   sendJson(403, "Authorization Token is Missing!");
endif;

sendJson(405, 'Invalid Request Method. HTTP method should be GET');
