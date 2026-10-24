# Tugas Akhir

Sistem informasi berbasis web untuk mengelola proses tugas akhir (skripsi): data mahasiswa, dosen, bimbingan, ujian, sampai jurnal. Terdiri dari panel admin dan halaman publik.

## Fitur

**Panel admin** (`admin/`)

- Login dan logout admin
- Dashboard ringkasan
- CRUD data mahasiswa, dosen, dosen penasihat, kategori skripsi, skripsi, peserta skripsi, ujian skripsi, dan jurnal
- Pencatatan bimbingan skripsi beserta unggah dokumen

**Halaman publik** (`frontend/`)

- Menampilkan data mahasiswa, ujian skripsi, kategori, dan jurnal dari database

## Teknologi

- PHP (MySQLi)
- MySQL / MariaDB
- HTML, CSS, JavaScript, Bootstrap

## Struktur

```
admin/      # panel admin (input, edit, hapus per tabel)
  docs/     # tempat dokumen bimbingan yang diunggah (tidak di-commit)
  includes/ # koneksi database dan komponen halaman
frontend/   # halaman publik
```

## Cara menjalankan

1. Pasang XAMPP (atau PHP + MySQL lain) dan jalankan Apache dan MySQL.
2. Salin folder proyek ini ke `htdocs`.
3. Impor database: buka phpMyAdmin, pilih tab **Import**, lalu pilih file `database/tugasakhir.sql`. File ini membuat database `tugasakhir` beserta 10 tabelnya (`admin`, `mahasiswa`, `dosen`, `penasihat`, `kategori`, `skripsi`, `pesertaskripsi`, `bimbinganskripsi`, `ujianskripsi`, `jurnal`) dan mengisinya dengan data contoh fiktif.
4. Sesuaikan koneksi di `admin/includes/config.php` dan `frontend/includes/config.php` (bawaan: `localhost`, user `root`, tanpa password).
5. Buka `http://localhost/<nama-folder>/admin/login.php` untuk admin, atau `http://localhost/<nama-folder>/frontend/index.php` untuk halaman publik.

Akun admin contoh: `admin@example.com` dengan password `admin123`.

## Catatan

- Data di `database/tugasakhir.sql` seluruhnya fiktif. Gambar dan dokumen contoh yang dirujuk data tersebut belum ada di folder `admin/images/` dan `admin/docs/`, jadi unggah sendiri lewat panel admin.
- Dokumen bimbingan yang diunggah disimpan di `admin/docs/` dan sengaja tidak masuk ke Git karena bisa berisi data pribadi.
- Konfigurasi database bawaan hanya untuk pengembangan lokal. Login admin sudah memakai prepared statement dan password ter-hash (bcrypt). Password lama yang masih teks biasa otomatis diubah menjadi hash saat login berikutnya. Namun halaman admin lainnya masih menyusun query langsung dari input pengguna (rentan SQL injection), jadi aplikasi ini belum layak dipakai di server publik.
