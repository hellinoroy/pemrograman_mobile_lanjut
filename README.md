Soal 3

async* menandakan asynchronous generator, sehingga dapat menggunakan yield dan yield*
yield* menandakan stream berterus, Stream.periodic membuat stream dalam interval 1 detik

Soal 5
listen non blocking, sedangkan await for tidak

Soal 6 
Langkah 8 membuat stream baru dengan StreamController dan mengambil data strea dengan properti .stream. dengan .listen setiap perubahan akan mengubah lastNumber sesuai stream.
langkah 9 menutup stream jika sudah tidak terpakai
langkah 10 memasukan data kedalam stream menggunakan method addNumberToSink pada file stream.dart

Soal 7
Langkah 13 membuat method error manual.
Langkah 14 menambah "catch" jika terjadi error.
Langkah 15 trigger method error manual.

Soal 8
penggunaan transformer, dengan transformer data dapat diolah sebelum masuk kestream.

Soal 9 
Langkah 2 mengisi variabel subscription dengan stream listener.
Langkah 6 mematikan subscription jika tidak dipakai
Langkah 8 membuat if statement jika tidak closed masih boleh berjalan.

Soal 10
Karena stream sudah di listen pada subscription

Soal 11
Listen subscriptionnya 2 biji jadi setiap ada perubahan atau sink yang masuk dia concatinate string pake += jadi nambah pake setState. karena dari stream yang sama atau broadcast kedua angka yang keluar sama.

Soal 12
Langkah 3 membuat stream data yang mengirimkan randomint terus menerus kedalam stream dengan jeda 1 detik
Langkah 7 pake streambuilder, setiap ada perbuahan atau stream masuk, builder akan berjalan.

Soal 13
Konsep bloc terdapat pada file random_bloc.dart