void main() {
  // var record = ('first', a: 2, b: true, 'last');
  // print(record);

  // (first, last, a: 2, b: true) akan tercetak

  var record = (1, 2);
  print(tukar(record));


  // (String, int) mahasiswa = ('Ryo Marchellino', 411221221);
  // print(mahasiswa);


  // var mahasiswa2 = ('first', RyoMarchellino: 411221221, b: true, 'last');

  // print(mahasiswa2.$1); // Prints 'first'
  // print(mahasiswa2.RyoMarchellino); // Prints 2
  // print(mahasiswa2.b); // Prints true
  // print(mahasiswa2.$2); // Prints 'last'

}



(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}


// Jelaskan yang dimaksud Functions dalam bahasa Dart!
// Blok kode terstruktur untuk melakukan tugas tertentu, membantu membuat kode lebih efisien, terorganisir, dan dapat digunakan kembali.

// Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!
// Required Parameters 
// void pesan(String nama) {
//   print("Halo $nama!");
// }

// Optional Parameter
// void setProfil({String? nama, int? umur}) {
//   print("$nama berumur $umur");
// }

// Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!
// Fungsi merupakan suatu kelas yang bisa dibuat menjadi objek

// Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!
// Fungsi yang tidak punya nama.
// void main() {
  // var list = ['Apel', 'Jeruk', 'Mangga'];
  
  // // Fungsi di dalam forEach adalah Anonymous Function
  // list.forEach((item) {
  //   print('Buah: $item');
//   });
// }

// Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!
// Lexical Scope
// Scope (cakupan) variabel ditentukan oleh tata letak kode secara fisik. Variabel yang didefinisikan di luar kurung kurawal {} bisa diakses oleh kode di dalam kurung kurawal tersebut (ke arah dalam).

// Lexical Closures
// Closure adalah objek fungsi yang memiliki akses ke variabel di lingkup (scope) asalnya, bahkan ketika fungsi tersebut dipanggil di luar scope asalnya.

// void main() {
//   var pesan = "Halo"; // Lexical Scope

//   // Ini adalah Closure
//   Function tambahPesan(String tambahan) {
//     return () => print("$pesan $tambahan"); 
//     // Fungsi anonim di atas "mengingat" variabel 'pesan'
//   }

//   var aksi = tambahPesan("Dunia");
//   aksi(); // Output: Halo Dunia
// }


// Jelaskan dengan contoh cara membuat return multiple value di Functions!
// di deklarasikan seperti fungsi 'tukar' diatas