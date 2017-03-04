<?php
require("DBConnection.php");
session_start();
$id = $_GET['id'];
echo $id;
$sql = "SELECT
			utangers.utanger_id as utanger_id,
			first_name,
			last_name,
			contact_no,
			DATE_FORMAT(created_on , '%M %d, %Y - %r' ) as created_on,
			amount,
			utang_id,
			paid
		FROM
			utangers, utang
		WHERE
			utangers.utanger_id = $id AND
			utang.utanger_id = $id
		ORDER BY paid ASC, created_on DESC;";
$result = $mysql->query($sql);
$utangs = new stdClass();
while($row = $result->fetch_assoc()) {
	$status = "Paid";
	$hidden = "hidden";
	if($row['paid'] == 0) {
		$status = "Not Paid";
		$hidden = "";
	}
	$utang[] = [
		"id" => $row['utang_id'],
		"date" => $row['created_on'],
		"amount" => $row['amount'],
		"paid" => $status,
		"hidden" => $hidden
	];
	$utangs->utanger_id = $row['utanger_id'];
	$utangs->name = $row['first_name'] . " " . $row['last_name'];
	$utangs->contact = $row['contact_no'];
}
$utangs->utang = $utang;
echo "<pre>";
echo json_encode($utangs, JSON_PRETTY_PRINT);
echo "</pre>";
$_SESSION['utangs'] = $utangs;
?>