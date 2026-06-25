<?php

require_once 'Tiket.php';

class TiketRegular extends Tiket {
    // Properti tambahan sesuai spesifikasi
    private $tipeAudio;
    private $lokasiBaris;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket, $tipeAudio, $lokasiBaris) {
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket);
        $this->tipeAudio = $tipeAudio;
        $this->lokasiBaris = $lokasiBaris;
    }

    // Implementasi method abstrak hitungTotalHarga
    public function hitungTotalHarga() {
        // Harga Regular = harga dasar × jumlah kursi
        $total = $this->hargaDasarTiket * $this->jumlah_kursi;
        return $total;
    }

    // Implementasi method abstrak tampilkanInfoFasilitas
    public function tampilkanInfoFasilitas() {
        return "🎬 Tiket Regular<br>
                ✅ Kursi Standar<br>
                ✅ Audio: {$this->tipeAudio}<br>
                ✅ Lokasi Baris: {$this->lokasiBaris}<br>
                ✅ Tanpa Fasilitas Tambahan<br>
                ✅ Harga Ekonomis<br>";
    }

    // Getter untuk properti tambahan
    public function getTipeAudio() {
        return $this->tipeAudio;
    }

    public function getLokasiBaris() {
        return $this->lokasiBaris;
    }

    // Setter untuk properti tambahan
    public function setTipeAudio($tipeAudio) {
        $this->tipeAudio = $tipeAudio;
    }

    public function setLokasiBaris($lokasiBaris) {
        $this->lokasiBaris = $lokasiBaris;
    }
}

?>