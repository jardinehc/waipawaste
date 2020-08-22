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

  UserData({ this.uid, this.name, this.address, this.wasteBin, this.recBin, this.userPin});
}
