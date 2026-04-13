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
