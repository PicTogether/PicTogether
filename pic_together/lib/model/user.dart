class User {
  late String userId;
  late String name;
  late String phoneNum;
  late List<String> friends;

  User(String userId, String name, String phoneNum, List<String> friends) {
    this.userId = userId;
    this.name = name;
    this.phoneNum = phoneNum;
    this.friends = friends;
  }
}
