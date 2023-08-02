class FriendRequest {
  late String id;
  late String requesterId;
  late String responderId;
  bool ok = false

  FriendRequest(String id, String requesterId, String responderId, bool ok) {
    this.id = id;
    this.requesterId = requesterId;
    this.responderId = responderId;
    this.ok = ok;
  }
}
