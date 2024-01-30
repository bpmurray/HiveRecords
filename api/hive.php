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

      if (!isset($params->apiaryid) || empty(trim($params->apiaryid))) sendJson(422, 'Missing apiary ID');

      $apiaryid = (int) trim($params->apiaryid);
      if (!is_numeric($apiaryid)) sendJson(401, 'Invalid Apiary!');

      $sql = "SELECT `id`,`name`,`description` FROM `hive` where `apiaryid` ='$apiaryid';";
      $query = mysqli_query($connection, $sql);
      $count = mysqli_num_rows($query);
      if ($count === 0) sendJson(404, "Hives not found! '$apiaryid'");
      $rows = array();
      while ($row = mysqli_fetch_assoc($query)) {
         $rows[] = $row;
      }
      sendJson(200, '', $rows);
   endif;
   sendJson(403, "Authorization Token is Missing!");
endif;

sendJson(405, 'Invalid Request Method. HTTP method should be GET');
