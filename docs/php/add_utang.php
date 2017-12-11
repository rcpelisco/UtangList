<?php
require('DBConnection.php');
$amount = $_POST['amount'];
$utanger_id = $_POST['utanger_id'];
$sql = "INSERT INTO utang
		SET
			amount = '$amount',
			utanger_id = '$utanger_id'";
echo $mysql->query($sql);
?>