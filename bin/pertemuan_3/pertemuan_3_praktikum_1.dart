

void main() {

  // Langkah 1:
  // Ketik atau salin kode program berikut ke dalam fungsi main().

  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  // Langkah 2:
  // Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!
  // Test2 tercetak karena memenuhi pengecekan variable test == "test2"

  // Langkah 3:
  // Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.
  // Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan if/else.

  // String test = "true";
  // if (test) {
  //    print("Kebenaran");
  // }

  bool test2 = true;

  if (test2) {
    print("Kebenaran");
  }

  // Yang terjadi adalah error karena test sudah dideklarasi sebagai string, lalu error yang terjadi adalah if hanya menerima hasil yang berupa boolean (true/false), tipe data pada snippet yang diberikan menggunakan string. 


}