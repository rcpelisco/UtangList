<?php
$mysql = mysqli_connect("localhost", "root", "", "utang_list");
if($mysql->error)
	die("Database error: " . $mysql->error);

?>