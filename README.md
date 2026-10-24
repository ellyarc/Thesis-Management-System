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
3. Buat database `tugasakhir` di phpMyAdmin. Tabel yang dipakai: `admin`, `mahasiswa`, `dosen`, `penasihat`, `kategori`, `skripsi`, `pesertaskripsi`, `bimbinganskripsi`, `ujianskripsi`, dan `jurnal`. File SQL belum disertakan di repo ini.
4. Sesuaikan koneksi di `admin/includes/config.php` dan `frontend/includes/config.php` (bawaan: `localhost`, user `root`, tanpa password).
5. Buka `http://localhost/<nama-folder>/admin/login.php` untuk admin, atau `http://localhost/<nama-folder>/frontend/index.php` untuk halaman publik.

## Catatan

- Dokumen bimbingan yang diunggah disimpan di `admin/docs/` dan sengaja tidak masuk ke Git karena bisa berisi data pribadi.
- Konfigurasi database bawaan hanya untuk pengembangan lokal.
