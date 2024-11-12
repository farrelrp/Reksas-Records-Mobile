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

# Tugas 8

## A. Kegunaan dan Keuntungan Menggunakan const

`const` digunakan untuk mendefinisikan objek atau widget yang tetap (immutable) sejak awal kompilasi (compile time). Ini membuatnya lebih hemat memori karena Flutter tidak harus membuat ulang objek tersebut. Keuntungan utama const adalah efisiensi memori dan performa yang lebih baik karena tidak harus reload tiap awal siklus. Bagusnya const digunakan pada widget atau value variabel yang tidak akan berubah saat runtime, contohnya teks statis dan ikon. Sebaliknya, tidak disarankan menggunakan const pada variabel atau widget yang bergantung pada input dinamis atau kondisi runtime.

## B. Kegunaan dan Keuntungan Menggunakan final

### Column

Column adalah layout widget untuk menampilkan child widgets secara vertikal. Cocok digunakan untuk menampilkan konten dalam urutan vertikal, contohnya di project ini saat menampilkan button di drawer.

```dart
child: const Column(
              children: [
                Text(
                  "Reksa's Records",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Add your favorite music here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  ),
                ),
              ]
            )
```

### Row

Row adalah layout widget untuk menampilkan child widgets secara horizontal. Cocok digunakan untuk menampilkan konten dalam urutan horizontal. Contohnya saat menampilkan button di main page.

```dart
child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Add your favorite music here!'),
                      ),
                    );
                  },
                  child: const Text('Add Music'),
                ),
                Padding(padding: EdgeInsets.all(8)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListMusic()),
                    );
                  },
                  child: const Text('List Music'),
                ),
                Padding(padding: EdgeInsets.all(8)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
```

## C. Elemen Input Yang Digunakan dan Tidak Digunakan

Di input form yang saya buat, hanya menggunakan beberapa input yaitu:

### Digunakan

**TextFormField**: Untuk input teks seperti nama album, nama artis, harga, deskripsi, dan link cover album.\
**DropdownButtonFormField**: Untuk memilih genre dari pilihan yang sudah tersedia.\
**ElevatedButton**: Tombol untuk menyimpan data yang diinput.

### Tidak Digunakan

**Checkbox**: Untuk memilih opsi biner.\
**Radio**: Untuk memilih satu opsi dari beberapa pilihan eksklusif.\
**Slider**: Digunakan untuk memilih nilai dalam rentang tertentu, misalnya memilih harga atau volume.\
**Switch**: Mirip dengan checkbox, digunakan untuk mengaktifkan atau menonaktifkan fitur atau pengaturan tertentu.

## D. Implementasi Theme

Untuk mengatur tema aplikasi agar konsisten, saya menggunakan ThemeData pada MaterialApp di bagian root aplikasi (main.dart).

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appBarTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

    return MaterialApp(
      title: 'Reksa Records',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.lightBlueAccent[400]),
        appBarTheme: const AppBarTheme(
          titleTextStyle: appBarTextStyle,
          centerTitle: true,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
```

Disini dapat mengatur warna, font, dan style yang akan digunakan pada aplikasi. Lalu di file lain, kita bisa menggunakan ThemeData yang sudah diatur di MaterialApp.

```dart
Text(
  "Reksa's Records",
  textAlign: TextAlign.center,
  style: Theme.of(context).appBarTheme.titleTextStyle,
),
```

## E. Cara melakukan Navigasi Antar Halaman

Navigator adalah sebuah widget yang membantu manage stack untuk melakukan navigasi antar halaman. Metode yang digunakan adalah:

**Navigator.push**: Berpindah ke halaman baru dengan menambahkan halaman baru ke atas stack. Halaman sebelumnya tetap ada di dalam stack sehingga bisa diakses lagi saat halaman baru di-pop. Contohnya:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HalamanBaru()),
);
```

**Navigator.pop**: Kembali ke halaman sebelumnya, ngepop halaman paling atas dari stack. Biasanya dipanggil saat user menekan tombol "Back". Contohnya:

```dart
Navigator.pop(context);
```

**Navigator.pushReplacement**: Digunakan untuk berpindah ke halaman baru sekaligus menghapus halaman sebelumnya dari stack.Contohnya:

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HalamanBaru()),
);
```

**Navigator.pushAndRemoveUntil**: Untuk mengganti seluruh stack dengan halaman baru, dipakai agar semua halaman sebelumnya dikeluarkan dari stack. Contohnya:

```dart
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => HalamanBaru()),
  (Route<dynamic> route) => false,
);
```

**Navigator.popUntil**: Untuk kembali ke halaman tertentu dalam stack tanpa harus menutup setiap halaman satu per satu, metode ini dapat digunakan dengan kondisi tertentu.

```dart
Navigator.popUntil(context, ModalRoute.withName('/'));
```
