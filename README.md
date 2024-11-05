# Tugas 7

## A. Stateless Widget vs Stateful Widget
### Stateless
Stateless Widget adalah widget yang tidak memiliki status internal atau state. Widget bersifat immutable sehingga setelah dibuat dan didefinisikan atribut - atributnya, maka tidak dapat diubah sejalannya program.\
Contoh : Konten statis seperti teks dan logo yang tidak akan berubah.
### Statefull
Stateful Widget dapat mengelola status internalnya atau state sehingga dapat berubah selama siklus hidupnya. Stateful Widget terdiri dari dua bagian: kelas widget utama dan kelas state yang menyimpan data dinamis. \
Contoh: Widget interaktif seperti formulir atau tombol di Tugas ini yang menerima input pengguna dan menampilkan hal yang menyesuaikan

## B. Widget yang digunakan dan FungsinyaSebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya dalam satu kalimat concise


- **Scaffold**: Memberikan struktur dasar layout aplikasi dengan area untuk AppBar, body, dan elemen lain.
- **AppBar**: Menyediakan bagian atas aplikasi untuk widget seperti judul.
- **Text**: Menampilkan teks ke user.
- **Padding**: Memberikan jarak di sekitar widget agar tampil lebih rapi.
- **Column**: Mengatur widget secara vertikal dalam layout.
- **Center**: Menempatkan widget di tengah area yang tersedia.
- **Material**: Membungkus widget dengan tampilan material design.
- **InkWell**: Mengaktifkan interaksi sentuhan dengan efek ripple saat widget di-tap.
- **Container**: Menyediakan margin, padding, ukuran, dan dekorasi untuk widget anak.
- **Icon**: Menampilkan ikon yang menggambarkan aksi atau konten.
- **SnackBar**: Menunjukkan pesan sementara di bagian bawah layar sebagai umpan balik.
- **MaterialApp**: Mengelola tema, routing, dan konfigurasi dasar aplikasi Flutter.

## C. Penggunaan `setState()`
setState() adalah metode yang digunakan dalam sebuah StatefulWidget untuk memberitahu framework bahwa status internal widget telah berubah dan perlu melakukan rebuild tampilan. Waktu setState() dipanggil, Flutter akan menjalankan kembali metode build() widget tersebut sehingga UI dapat menampilkan perubahan terbaru yang terjadi pada state.\
Karena di projek ini belum ada widget yang Stateful, maka belum ada variabel yang akan mengguakan `setState()`

## D. Perbedaan `const` dan `final`
- **const**: Nilai variabel tetap dan sudah diketahui saat compile time. Nilai yang menggunakan const tidak bisa diubah.

```dart
const hargaSate = 18000; // Gabisa berubah di runtime
```

- **final**: Variabel hanya diinisialisasi satu kali dan nilainya konstan setelah inisialisasi itu. Final dapat diubah saat runtime
```dart
final username = getUsername(); //  Berubah di runtime
```
## E. Implementasi Checklist
- **Membuat project flutter** : Menggunakan `flutter create` untuk membuat projek flutter baru
- **Membuat File Untuk Widget Homepage**
- **Ubah Widget Homepage menjadi Stateless** : Mengubah MyHomePage meng-extend Stateless
- **Membuat Widget ItemCard dan ItemHomepage** : ItemCard menjadi widget container untuk child widget ItemHomepage yang berisi button menambah, melihat daftar produk dan logout.
- **Memberi Fungsionalitas Tap di Button ItemCard** : Menambahkan onTap pada button ItemCard yang akan menampilkan Snackbar, dan menampilkan pesan yang berbeda tergantung pada button yang ditekan.

