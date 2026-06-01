# pertemuan 9

Preview ada di demo_pertemuan_9.mp4

Jelaskan maksud void async? 
void async digunakan pada fungsi yang berjalan secara asinkronus (di latar belakang), tetapi tidak mengembalikan nilai apa pun setelah tugasnya selesai. Kata async memungkinkan Anda menggunakan fungsi await di dalamnya (misal: menunggu data dari internet), sedangkan void menegaskan bahwa fungsi ini hanya menjalankan tugas/perintah tanpa mengirimkan data balik ke pemanggilnya.


Jelaskan fungsi dari anotasi @immutable dan @override ? 
Anotasi @immutable menandakan bahwa sebuah Widget bersifat tidak dapat diubah (konstan) setelah dibuat. Artinya, semua variabel atau properti yang ada di dalam kelas tersebut harus bersifat final. Jika ada perubahan data, Flutter tidak mengubah widget tersebut, melainkan membuat instansiasi widget yang baru untuk memperbarui tampilan.    

Anotasi @override digunakan untuk memberi tahu compiler bahwa fungsi atau method tersebut menggantikan (mengambil alih) fungsi bawaan dari kelas induk (parent class). Contoh paling umum adalah Widget build(BuildContext context), di mana Anda menulis ulang cara widget Anda ditampilkan, menggantikan fungsi build standar yang dimiliki oleh StatefulWidget atau StatelessWidget.