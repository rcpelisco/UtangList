<?php
require('DBConnection.php');
$id = $_POST['id'];
$sql = "DELETE FROM utang WHERE utang_id = $id";
echo $mysql->query($sql);
?>