<?php

require_once 'Tiket.php';

class TiketVelvet extends Tiket {
    // Properti tambahan sesuai spesifikasi
    private $bantalSelimutPack;
    private $layananButler;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket, $bantalSelimutPack, $layananButler) {
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket);
        $this->bantalSelimutPack = $bantalSelimutPack;
        $this->layananButler = $layananButler;
    }

    // Implementasi method abstrak hitungTotalHarga
    public function hitungTotalHarga() {
        // Velvet: harga dasar + 100% (2x lipat) karena fasilitas mewah
        $total = ($this->hargaDasarTiket * 2) * $this->jumlah_kursi;
        return $total;
    }

    // Implementasi method abstrak tampilkanInfoFasilitas
    public function tampilkanInfoFasilitas() {
        return "🛋️ Tiket Velvet<br>
                ✅ Kursi Premium Velvet<br>
                ✅ Bantal & Selimut Pack: {$this->bantalSelimutPack}<br>
                ✅ Layanan Butler: {$this->layananButler}<br>
                ✅ Ruang Tunggu Eksklusif<br>
                ✅ Makanan & Minuman Premium<br>
                ✅ Pengalaman Bioskop Kelas Atas<br>";
    }

    // Getter untuk properti tambahan
    public function getBantalSelimutPack() {
        return $this->bantalSelimutPack;
    }

    public function getLayananButler() {
        return $this->layananButler;
    }

    // Setter untuk properti tambahan
    public function setBantalSelimutPack($bantalSelimutPack) {
        $this->bantalSelimutPack = $bantalSelimutPack;
    }

    public function setLayananButler($layananButler) {
        $this->layananButler = $layananButler;
    }
}

?>