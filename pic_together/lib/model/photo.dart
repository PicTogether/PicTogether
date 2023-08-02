class Photo {
  late String id;
  late String uploaderId;
  late DateTime uploadTime;

  Photo(String id, String uploaderId, String uploadTime) {
    this.id = id;
    this.uploaderId = uploaderId;
    this.uploadTime = uploadTime
  }
}
