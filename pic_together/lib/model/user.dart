import 'package:uuid/uuid.dart';

class User {
  late String id;
  late String name;
  late String phoneNum;
  late List<String> friends;
  late String appointmentId;

  User(String id, String name, String phoneNum, List<String> friends,
      String appointmentId) {
    this.id = id;
    this.name = name;
    this.phoneNum = phoneNum;
    this.friends = friends;
    this.appointmentId = appointmentId;
  }

  // named constructor
  User.newUser(String name, String phoneNum) {
    var uuid = Uuid();
    this.id = uuid.v4();
    this.name = name;
    this.phoneNum = phoneNum;
    this.friends = [];
    this.appointmentId = "";
  }
}
