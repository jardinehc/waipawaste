class User {

  final String uid;

  User({ this.uid });
}

class UserData {

  final String uid;
  final String name;
  final String address;
  final String wasteBin;
  final String recBin;
  final int userPin;

  final int waste1;
  final int waste2;
  final int waste3;

  UserData({ this.uid, this.name, this.address, this.wasteBin, this.recBin, this.userPin, this.waste1, this.waste2, this.waste3});
}

//for waipa data

class Waipa {
  final int weight;
  final int date;

  Waipa({ this.weight, this.date});
}

class WaipaData {

  final String uid;

  final int weight;

  final int date;


  WaipaData({ this.uid, this.weight, this.date});
}