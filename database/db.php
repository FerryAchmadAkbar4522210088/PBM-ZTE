<?php
// database/db.php

$host = "localhost";
$user = "root"; // Default XAMPP
$pass = "";
$db   = "flutter_teori";

// Membuat koneksi
$conn = new mysqli($host, $user, $pass, $db);

// Cek koneksi
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}
?>
