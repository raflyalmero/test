<?php

abstract class Tiket {
    // Properti Terenkapsulasi (protected)
    protected $id_tiket;
    protected $nama_film;
    protected $jadwal_tayang;
    protected $jumlah_kursi;
    protected $hargaDasarTiket;
    protected $koneksi;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket) {
        $this->id_tiket = $id_tiket;
        $this->nama_film = $nama_film;
        $this->jadwal_tayang = $jadwal_tayang;
        $this->jumlah_kursi = $jumlah_kursi;
        $this->hargaDasarTiket = $hargaDasarTiket;
    }

    // Getter Methods
    public function getIdTiket() {
        return $this->id_tiket;
    }

    public function getNamaFilm() {
        return $this->nama_film;
    }

    public function getJadwalTayang() {
        return $this->jadwal_tayang;
    }

    public function getJumlahKursi() {
        return $this->jumlah_kursi;
    }

    public function getHargaDasar() {
        return $this->hargaDasarTiket;
    }

    // Setter Methods
    public function setJumlahKursi($jumlah) {
        if ($jumlah > 0) {
            $this->jumlah_kursi = $jumlah;
        } else {
            throw new Exception("Jumlah kursi harus lebih dari 0");
        }
    }

    // Method Concrete (sudah ada implementasi)
    public function tampilkanInfoDasar() {
        return "ID Tiket: {$this->id_tiket}<br>
                Film: {$this->nama_film}<br>
                Jadwal: {$this->jadwal_tayang}<br>
                Jumlah Kursi: {$this->jumlah_kursi}<br>
                Harga Dasar: Rp " . number_format($this->hargaDasarTiket, 0, ',', '.') . "<br>";
    }

    // Abstract Methods (harus diimplementasikan oleh child class)
    abstract public function hitungTotalHarga();
    abstract public function tampilkanInfoFasilitas();
}

?>