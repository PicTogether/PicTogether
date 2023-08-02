class User {
  late String userId;
  late String name;
  late String phoneNum;
  late List<String> friends;
  late String appointmentId;

  User(String userId, String name, String phoneNum, List<String> friends, String appointmentId) {
    this.userId = userId;
    this.name = name;
    this.phoneNum = phoneNum;
    this.friends = friends;
    this.appointmentId = appointmentId;
  }
}
