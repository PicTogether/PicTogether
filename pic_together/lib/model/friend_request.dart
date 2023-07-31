class FriendRequest {
  late String requesterId;
  late String responderId;
  bool ok = false;

  FriendRequest(String requesterId, String responderId) {
    this.requesterId = requesterId;
    this.responderId = responderId;
  }
}
