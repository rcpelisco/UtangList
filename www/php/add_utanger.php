<?php
require('DBConnection.php');
$first_name = $_POST["first_name"];
$last_name = $_POST["last_name"];
$contact_no = $_POST["contact_no"];
$sql = "INSERT INTO utangers SET
			first_name = '$first_name',
			last_name = '$last_name',
			contact_no = '$contact_no'";
echo $mysql->query($sql);

?>