<?php
require("DBConnection.php");
$id = $_POST['id'];
$sql = "UPDATE utang SET paid = 1 WHERE utang_id = $id";
echo $mysql->query($sql);
?>