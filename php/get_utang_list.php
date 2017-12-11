<?php
session_start();
$utangs = $_SESSION['utangs'];
// echo "<pre>";
echo json_encode($utangs, JSON_PRETTY_PRINT);
// echo "</pre>";
?>