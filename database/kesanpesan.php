<?php
header('Content-Type: application/json');

// Cek koneksi database
$conn = new mysqli("localhost", "root", "", "flutter_teori");

if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Koneksi gagal"]);
    exit();
}

// Ambil data dari body
$data = json_decode(file_get_contents("php://input"));

// Kalau gak ada data
if (!$data) {
    echo json_encode(["success" => false, "message" => "Tidak ada data yang dikirim"]);
    exit();
}

// Cek data
$nama = $data->nama ?? null;
$alamat = $data->alamat ?? null;
$kesanpesan = $data->kesanpesan ?? null;

// Validasi
if (!$nama || !$alamat || !$kesanpesan) {
    echo json_encode(["success" => false, "message" => "Data kurang lengkap"]);
    exit();
}

// Gunakan prepared statement untuk mencegah SQL Injection
$stmt = $conn->prepare("INSERT INTO kesanpesan (nama, alamat, kesanpesan) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $nama, $alamat, $kesanpesan);

// Eksekusi query dan cek hasilnya
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Berhasil tambah data"]);
} else {
    echo json_encode(["success" => false, "message" => "Gagal tambah data: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
