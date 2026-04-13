void main() {
  var gifts = {
    // Key:    Value
    'nama': 'Ryo Marchellino',
    'nim': '411221221',
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    'nama': 'Ryo Marchellino',
    'nim': '411221221',
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);
 
  //  pembuatan tipe data map, yang memiliki key-value

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  mhs1['nama'] = 'Ryo Marchellino';
  mhs1['nim'] = '411221221';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  mhs2[0] = 'Ryo Marchellino';
  mhs2[1] = '411221221';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);

}