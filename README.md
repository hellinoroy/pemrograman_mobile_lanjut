# pertemuan 10


Praktikum 1

Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
buat di export semua file dan digunakan di plan_screen.dart

Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
buat dibuat sebuah plan object dari class plan

Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Preview ada di demo_pertemuan_10_praktikum_1.mp4

Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
initState() adalah tempat terbaik untuk melakukan persiapan awal sebelum layar ditampilkan ke pengguna. (alokasi memori)
dispose() adalah ketika widget dihapus secara permanen dari widget tree. (pembersihan memori)


Praktikum 2

Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?
InheritedWidget dan InheritedNotifier sama-sama berfungsi untuk membagikan data dari atas ke bawah dalam widget tree tanpa perlu melakukan prop drilling. Perbedaan utamanya terletak pada sifat datanya: InheritedWidget dirancang untuk membagikan data yang bersifat statis atau jarang berubah (seperti tema warna atau konfigurasi), di mana pembaruan data membutuhkan bantuan StatefulWidget di atasnya. Sebaliknya, InheritedNotifier dirancang khusus untuk data dinamis karena ia otomatis mendengarkan (listen) objek seperti ValueNotifier atau ChangeNotifier; begitu nilai di dalam notifier tersebut berubah, InheritedNotifier akan langsung memerintahkan widget anak yang mengonsumsinya untuk menggambar ulang (rebuild) secara otomatis tanpa perlu memicu setState manual di tingkat parent.

Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
method tersebut dibuat untuk menghitung jumlah task yang selesai, dan mengembalikan string yang berisi jumlah task yang selesai dan total task.

Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Preview ada di demo_pertemuan_10_praktikum_2.mp4

Praktikum 3
Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
Struktur halaman plan_creator_screen dan plan_screen
 
