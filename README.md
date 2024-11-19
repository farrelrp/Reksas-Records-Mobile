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

# Tugas 9

## A. Mengapa Harus Menggunakan Model untuk Pengolahan Data JSON

Dengan menggunakan model, kita dapat memastikan beberapa hal berikut:
**Konsistensi Data**: Menjamin JSON yang diterima atau dikirim sesuai dengan atribut dan tipe yang diharapkan.

**Kemudahan Konversi**: Mempermudah transformasi JSON menjadi objek Dart supaya dapat diolah lebih lanjut.

**Validasi Data**: Memastikan data yang diterima valid dan sesuai dengan model yang diharapkan, sehingga mengurangi kemungkinan error atau kegagalan dalam pengolahan data.

Jika tidak menggunakan model, tidak akan langsung error, tetapi dapat terjadi error karena kita tidak bisa memastikan data yang diterima sesuai dengan yang diharapkan.

## B. Fungsi library http

Secara umum, library http dapat berguna untuk komunikasi antara aplikasi dan server melalui protokol HTTP.
Pada tugas ini digunakan dalam:

- Autentikasi login dan logout

```dart
final response = await request.login("http://127.0.0.1:8000/auth/login/", {
  'username': username,
  'password': password,
});
```

- Pengambilan data dari server

```dart
final response = await request.get("http://127.0.0.1:8000/json/");
```

- Pengiriman data ke server

```dart
final response = await request.post("http://127.0.0.1:8000/json/", {
  'name': 'Album Name',
  'artist': 'Artist Name',
  'genre': 'Genre',
  'price': 100000,
  'description': 'Description',
  'image_url': 'Image URL',
});
```

## C. Fungsi dari CookieRequest dan Keperluannya

CookieRequest digunakan untuk mengirim cookie dari aplikasi ke server dan menerima cookie dari server. Ini merupakan salah satu bagian dari package pbp_django_auth yang sudah diinstall sebelumnya.
Fungsi CookieRequest:

- **Sistem Autentikasi**: Memastikan bahwa request yang dikirim dan response yang diterima sesuai dengan cookie yang dikirim sebelumnya.
- **Mendukung Stateful Request**: Dapat mendapatkan konteks berupa apakah user sudah login atau belum dan menampilkan screen sesuai dengan status login.

## D. Mekanisme Pengiriman Data

1. **Melakukan Input Data**: User melakukan input data pada halaman form yang ada di records_entry.dart.
2. **Mengirim Data**: Pengiriman data dari aplikasi ke server menggunakan metode POST. Data yang dikirim berupa JSON yang diubah menjadi string menggunakan method jsonEncode dari package dart:convert.

```dart
final response = await request.post("http://127.0.0.1:8000/create_vinyl_flutter/", {
  'name': 'Album Name',
  'artist': 'Artist Name',
  'genre': 'Genre',
  'price': 100000,
  'description': 'Description',
  'image_url': 'Image URL',
});
```

3. **Pengolahan Data**: Setelah data diterima dari server, akan diproses di server Django di views.py yang sudah didefinisikan sebelumnya. Django lalu mengirim response berupa JSON ke aplikasi.
4. **Menampilkan Data**: Response yang diterima akan di decode menjadi objek Dart menggunakan model yang sudah didefinisikan sebelumnya dan ditampilkan di halaman list_vinyl.dart

## E. Mekanisme Autentikasi

**Autentikasi Login**

1. **Input**: User melakukan login di halaman `login.dart`. Dengan menginput username dan password, lalu menekan tombol login.

2. **Mengirim Request**: Setelah mengeklik tombol login, aplikasi akan mengirim permintaan ke server menggunakan metode POST.

   ```dart:lib/screens/login.dart: _LoginPageState
   onPressed: () async {
     String username = _usernameController.text;
     String password = _passwordController.text;

     // Mengirim permintaan login ke server
     final response = await request
         .login("http://127.0.0.1:8000/auth/login/", {
       'username': username,
       'password': password,
     });
   }
   ```

3. **Menangani Respons**: Setelah menerima respons dari server, aplikasi akan memeriksa apakah login berhasil. Jika berhasil, pengguna diarahkan ke halaman utama.
   ```dart:lib/screens/login.dart: _LoginPageState
   if (request.loggedIn) {
     String message = response['message'];
     String uname = response['username'];
     if (context.mounted) {
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => MyHomePage()),
       );
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(
           SnackBar(
             content: Text("$message Selamat datang, $uname."),
           ),
         );
     }
   } else {
     if (context.mounted) {
       showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: const Text('Login Gagal'),
           content: Text(response['message']),
           actions: [
             TextButton(
               child: const Text('OK'),
               onPressed: () {
                 Navigator.pop(context);
               },
             ),
           ],
         ),
       );
     }
   }
   ```

**Autentikasi Register**

1. **Input**: User melakukan registrasi di halaman `register.dart` dengan mengisi username, password, dan konfirmasi password.

2. **Mengirim Request**: Setelah mengisi form, aplikasi mengirim permintaan registrasi ke server menggunakan metode POST.

   ```dart:lib/screens/register.dart: _RegisterPageState
   onPressed: () async {
     String username = _usernameController.text;
     String password1 = _passwordController.text;
     String password2 = _confirmPasswordController.text;

     // Mengirim permintaan registrasi ke server
     final response = await request.postJson(
         "http://127.0.0.1:8000/auth/register/",
         jsonEncode({
           "username": username,
           "password1": password1,
           "password2": password2,
         }));
   }
   ```

3. **Menangani Respons**: Setelah menerima respons, aplikasi akan memeriksa status registrasi. Jika berhasil, pengguna diarahkan ke halaman login.
   ```dart:lib/screens/register.dart: _RegisterPageState
   if (response['status'] == 'success') {
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text('Successfully registered!'),
       ),
     );
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const LoginPage()),
     );
   } else {
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text('Failed to register!'),
       ),
     );
   }
   ```
   _Jika registrasi berhasil, pengguna akan diarahkan kembali ke halaman login dengan pesan sukses. Jika gagal, snackbar akan menampilkan pesan gagal._

---

**Autentikasi Logout**

1. **Input**: User memilih opsi logout dari menu yang tersedia, misalnya dari `left_drawer.dart` atau `item_card.dart`.

2. **Mengirim Request**: Aplikasi mengirim permintaan logout ke server menggunakan metode POST.

   ```dart:lib/widgets/item_card.dart: ItemCard
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     content: Text("$message Sampai jumpa, $uname."),
   ));
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(builder: (context) => const LoginPage()),
   );
   ```

3. **Menangani Respons**: Setelah logout berhasil, sesi pengguna dihapus dan pengguna diarahkan ke halaman login.
   ```dart:lib/widgets/item_card.dart: ItemCard
   if (request.loggedIn) {
     // Logout berhasil
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Text("$message Sampai jumpa, $uname."),
     ));
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const LoginPage()),
     );
   } else {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(message),
       ),
     );
   }
   ```

## F. Penerapan Checklist

- **1. Mengatur Projek Django** : Melakukan konfigurasi projek Django agar dapat diintegrasikan dengan aplikasi Flutter dengan menambah corsheaders dan memasukkan domain aplikasi Flutter kedalam CORS_ALLOWED_ORIGINS, membuat aplikasi baru untuk autentikasi dan membuat view untuk login, register, dan logout pada aplikasi tersebut, membuat view baru di main untuk handle mengirim data ke server.

- **2. Install library yang dibutuhkan di Flutter** : Menginstall library pbp_django_auth, provider dan http untuk dapat melakukan pengiriman dan penerimaan data dari server.

- **3. Membuat Screens** : Membuat halaman login, register, dan logout di Flutter (Dijelaskan pada Poin E), serta halaman untuk menampilkan data dan form untuk input data di Flutter (Dijelaskan pada Poin D). Pada screen baru ini juga memanggil view yang sudah dibuat di projek Django sebelumnya melalui link yang didefinisikan di urls.py pada projek Django.

- **4. Membuat Model** : Membuat model `Vinyl` pada Django dan menambahkan field yang diperlukan, membuat model tersebut menjadi JSON di views.py, lalu menampilkan data tersebut di Flutter. Membuat model menggunakan website Quicktype.

- **5. Membuat Routing** : Mengatur routing di Flutter agar dapat berpindah-pindah antar halaman dengan benar dengan menggunakan Navigator.push, Navigator.pop, Navigator.pushReplacement, dan Navigator.pushAndRemoveUntil.
