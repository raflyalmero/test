<?php

require_once 'config.php';

class Database {
    private $host = DB_HOST;
    private $username = DB_USER;
    private $password = DB_PASS;
    private $database = DB_NAME;
    public $conn;

    public function __construct() {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database);

        if ($this->conn->connect_error) {
            die("Koneksi gagal: " . $this->conn->connect_error);
        }
    }

    public function getConnection() {
        return $this->conn;
    }

    // Method untuk mengambil data tiket dari database
    public function getDataTiketFromDB($booking_id = null) {
        $sql = "SELECT 
                    b.id AS id_tiket,
                    f.title AS nama_film,
                    CONCAT(s.show_date, ' ', s.show_time) AS jadwal_tayang,
                    b.total_price AS hargaDasarTiket,
                    1 AS jumlah_kursi,
                    s.studio_number,
                    c.name AS cinema_name
                FROM bookings b
                JOIN showtimes s ON b.showtime_id = s.id
                JOIN films f ON s.film_id = f.id
                JOIN cinemas c ON s.cinema_id = c.id";

        if ($booking_id) {
            $sql .= " WHERE b.id = $booking_id";
        }

        $result = $this->conn->query($sql);
        $data = [];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }

        return $data;
    }

    // Method untuk mendapatkan data studio berdasarkan cinema_id
    public function getStudioData($cinema_id, $studio_number) {
        $sql = "SELECT * FROM seats WHERE cinema_id = $cinema_id AND studio_number = $studio_number LIMIT 1";
        $result = $this->conn->query($sql);
        return $result->fetch_assoc();
    }

    public function closeConnection() {
        $this->conn->close();
    }
}

?>