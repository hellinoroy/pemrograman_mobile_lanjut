void main() {
  // Ketik atau salin kode program berikut ke dalam fungsi main().
  // for (Index = 10; index < 27; index) {
  //   print(Index);
  // }


  // for (var index = 10; index < 27; index++) {
  //   print(index);
  // }

  // Langkah 2:

  // Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.
  // error karena Index tidak ada, dan hanya print 10 karena tidak ada increment


  // Langkah 3:

  // Tambahkan kode program berikut di dalam for-loop, lalu coba eksekusi (Run) kode Anda.

  // If (Index == 21) break;
  // Else If (index > 1 || index < 7) continue;
  // print(index);

  // Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan for dan break-continue.

  for (var index = 10; index < 27; index++) {
    print(index);

    if (index == 21) {
      break;
    } else if (index > 1 || index < 7) {
      continue;
    }
    print(index);
  }

  // print akan jalan sampai index 21 dari 10


}