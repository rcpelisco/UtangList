<?php
date_default_timezone_set("Asia/Manila");
$mysql = mysqli_connect("localhost", "id978681_rcpelisco", "09991537566", "id978681_utang_list");
$mysql->query("SET SESSION time_zone = '+8:00'");
if($mysql->error)
	die("Database error: " . $mysql->error);

?>