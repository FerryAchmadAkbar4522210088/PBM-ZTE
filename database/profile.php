<?php
header('Content-Type: application/json');
include 'db.php'; // Meng-include file koneksi db.php

// Mendapatkan parameter nama_panggilan dari request (misalnya lewat query string)
$nama_panggilan = isset($_GET['nama_panggilan']) ? $_GET['nama_panggilan'] : '';

// Jika nama_panggilan tidak kosong, query berdasarkan nama_panggilan
if (!empty($nama_panggilan)) {
    $sql = "SELECT nama_lengkap, nama_panggilan, npm, jenis_kelamin, nomor_telepon, foto FROM profile WHERE nama_panggilan = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $nama_panggilan); // Bind parameter nama_panggilan
} else {
    // Jika nama_panggilan kosong, ambil semua data (seperti sebelumnya)
    $sql = "SELECT nama_lengkap, nama_panggilan, npm, jenis_kelamin, nomor_telepon, foto FROM profile";
    $stmt = $conn->prepare($sql);
}

// Eksekusi query
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $data = [];

    while ($row = $result->fetch_assoc()) {
        // Cek jika ada foto, tambahkan URL base
        if (!empty($row['foto'])) {
            $row['foto'] = "http://192.168.242.1/Belajar_Flutter/PBM-ZTE_github/database/" . $row['foto'];
        } else {
            $row['foto'] = ""; // Tidak ada foto
        }

        $data[] = $row; // Masukkan setiap data ke dalam array
    }

    echo json_encode([
        "success" => true,
        "data" => $data // Mengirim data sebagai JSON
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Data tidak ditemukan"
    ]);
}

$stmt->close();
$conn->close();
?>
