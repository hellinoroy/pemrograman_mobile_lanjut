# Pertemuan 11

Praktikum 1
Soal 2 tidak bisa dilakukan karena response RATE_LIMIT_EXCEEDED.

Soal 3 
subString digunakan untuk manging potongan string dari string lagin, sedangkan catchError digunakan untuk menangkap error,
demo_pertemuan_11_praktikum_1_soal_3.

Soal 4
Langkah 1 membuat method async yang mereturn 1,2, dan 3 setelah 3 detik pada masing-masing method.
Langkah 2 membuat method async yang menggabungkan semua return method langkah 1 dan menaruhnya di variable result.

Soal 5
Langkah 2 menggunakan completer sehingga tidak perlu lagi menggunakan then, catchError, async, dan await.

Soal 6
Langkah 2 hanya memliki complete. sedangkan langkah 5-6 memiliki catch untuk mencegat error.

Soal 7
Langkah 1 penambahan method returnFG, dimana future di kelompokan dan di jalankan, setelah ditutup. fungsi yang mengubah result berdasarkan total berjalan.
Langkah 2 mengubah onPressed sehingga reurnFG berjalan

Soal 8
Langkah 1 menggunakan FutureGroup sedangkan langkah 4 menggunakan future.wait. Perbedaannya adalah futuregroup lebih flexible dibandingkan future.wait. futuregroup dapat  digunakan dalam loop dan menambah future baru.

Soal 10 
Hasil langkah 1 dan 4 sama, hanya berbeda dalam syntax. langkah 1 menggunakan .then dan .catchError. Sedangkan langkah 4 menggunakan try catch

Soal 12
Jalan di browser bisa, hanya perlu memberikan permission.
