<?php
require("DBConnection.php");
$sql = "SELECT * FROM utangers ORDER BY utanger_id DESC";
$result = $mysql->query($sql);
$utangers = new stdClass();
while($row = $result->fetch_assoc()) {
	$utanger[] = [
		"id" => $row['utanger_id'],
		"name" => $row['first_name'] . " " . $row['last_name']
	];
}
// echo "<pre>";
$utangers->utanger = $utanger;
echo json_encode($utangers, JSON_PRETTY_PRINT);
// echo "</pre>";
?>