<?php
require("DBConnection.php");
$sql = "SELECT 
			DISTINCT
			utangers.utanger_id, 
			utangers.first_name, 
			utangers.last_name
		FROM utangers, utang 
		WHERE utangers.utanger_id = utang.utanger_id";
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