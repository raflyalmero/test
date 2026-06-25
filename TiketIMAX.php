<?php

require_once 'Tiket.php';

class TiketIMAX extends Tiket {
    // Properti tambahan sesuai spesifikasi
    private $kacamata3dId;
    private $efekGerakFitur;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket, $kacamata3dId, $efekGerakFitur) {
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket);
        $this->kacamata3dId = $kacamata3dId;
        $this->efekGerakFitur = $efekGerakFitur;
    }

    // Implementasi method abstrak hitungTotalHarga
    public function hitungTotalHarga() {
        // IMAX: harga dasar + 50% karena teknologi canggih
        $total = ($this->hargaDasarTiket * 1.5) * $this->jumlah_kursi;
        return $total;
    }

    // Implementasi method abstrak tampilkanInfoFasilitas
    public function tampilkanInfoFasilitas() {
        return "🎞️ Tiket IMAX<br>
                ✅ Layar Raksasa (IMAX)<br>
                ✅ Kacamata 3D ID: {$this->kacamata3dId}<br>
                ✅ Efek Gerak Fitur: {$this->efekGerakFitur}<br>
                ✅ Audio Surround 12.1 Channel<br>
                ✅ Pengalaman Sinematik Maksimal<br>";
    }

    // Getter untuk properti tambahan
    public function getKacamata3dId() {
        return $this->kacamata3dId;
    }

    public function getEfekGerakFitur() {
        return $this->efekGerakFitur;
    }

    // Setter untuk properti tambahan
    public function setKacamata3dId($kacamata3dId) {
        $this->kacamata3dId = $kacamata3dId;
    }

    public function setEfekGerakFitur($efekGerakFitur) {
        $this->efekGerakFitur = $efekGerakFitur;
    }
}

?>