void main() {
  // var list = [1, 2, 3];
  // var list2 = [0, ...list];
  // print(list2);
  // print(list2.length);

  // varibable list dimasukan kedalam variable list2 dengan menggunakan spread operator saat di deklarasi

  // var list1 = [1, 2, null];
  // print(list1);
  // var list3 = [0, ...list1];
  // print(list3.length);

  // [1, 2, null] tercetak, dan 4 tercetak.
  // var list = ['411221221'];
  // var list4 = [...list3, ...list];
  // print(list4);

  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  // 'Outlet' akan tercetak jika promoActive true, jika false tidak akan tercetak


  // String login = 'Manager';
  // var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  // print(nav2);

   // 'Inventory' akan tercetak jika login true, jika false tidak akan tercetak


  // var listOfInts = [1, 2, 3];
  // var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  // assert(listOfStrings[1] == '#1');
  // print(listOfStrings);

  // [#0, #1, #2, #3] akan tercetak. menurut saya manfaatnya adalah for ini bisa digunakan untuk memformat sebuah iterable (dalam contoh ini listOfInts).

}