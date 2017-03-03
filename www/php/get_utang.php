<?php
require("DBConnection.php");
$id = $_GET['id'];
$sql = "SELECT * FROM utang WHERE utanger_id = '$id'";
$result = $mysql->query($sql);
$utangs = new stdClass();
while($row = $result->fetch_assoc()) {
	$utang[] = [
		"id" => $row['utang_id'],
		"date" => $row['created_on'],
		"amount" => $row['amount']
	];
}
// echo "<pre>";
$utangs->utang = $utang;
echo json_encode($utangs, JSON_PRETTY_PRINT);
// echo "</pre>";
?>