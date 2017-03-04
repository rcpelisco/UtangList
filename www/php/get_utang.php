<?php
require("DBConnection.php");
session_start();
$id = $_GET['id'];
$sql = "SELECT
			utangers.utanger_id,
			first_name,
			last_name,
			contact_no,
			created_on,
			amount,
			utang_id
		FROM
			utangers, utang
		WHERE
			utangers.utanger_id = $id AND
			utang.utanger_id = $id;";
$result = $mysql->query($sql);
$utangs = new stdClass();
while($row = $result->fetch_assoc()) {
	$utang[] = [
		"id" => $row['utang_id'],
		"date" => $row['created_on'],
		"amount" => $row['amount']
	];
	$utangs->name = $row['first_name'] . " " . $row['last_name'];
	$utangs->contact = $row['contact_no'];
}
$utangs->utang = $utang;
$_SESSION['utangs'] = $utangs;
?>