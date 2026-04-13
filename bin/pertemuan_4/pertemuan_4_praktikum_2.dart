void main() {

  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);
  // variable halogens akan tercetak dengan tipe data set.
  

  // Langkah 3:
  // Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.

  print(names1);
  print(names2);

  // Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan ketiga variabel tersebut. Tambahkan elemen nama dan NIM Anda pada kedua variabel Set tersebut dengan dua fungsi berbeda yaitu .add() dan .addAll(). Untuk variabel Map dihapus, nanti kita coba di praktikum selanjutnya.

  names1.add('Ryo Machellino');
  names1.add('411221221');
  names2.addAll(['Ryo Marchellino', '411221221']);

  print(names1);
  print(names2);

  // .add() menerima satu input, sedangkan .addAll() menerima iterable seperti list

}