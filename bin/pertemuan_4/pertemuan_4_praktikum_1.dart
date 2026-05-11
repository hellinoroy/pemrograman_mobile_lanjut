void main() {

  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  // akan tercetak 3, 2, 1.
  // ini terjadi karena list.length mempunyai panjang 3
  // index ke-1 bernilai 2
  // list[1] di assign kembali menjadi 1

  // Ubah kode pada langkah 1 menjadi variabel final yang mempunyai index = 5 dengan default value = null. Isilah nama dan NIM Anda pada elemen index ke-1 dan ke-2. Lalu print dan capture hasilnya.

  // Apa yang terjadi ? Jika terjadi error, silakan perbaiki.


  // menggunakan dynamic karena tipe data tidak hanya satu, bisa null atau string.
  final list = List<dynamic>.filled(5, null); 
  
  list[1] = "Ryo Marchellino";
  list[2] = "411221221";

  print(list[1]);
  print(list[2]);
  print(list.length);

}