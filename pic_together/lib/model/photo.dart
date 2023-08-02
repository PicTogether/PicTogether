import 'package:uuid/uuid.dart';

class Photo {
  late String id;
  late String uploaderId;
  late DateTime uploadTime;

  Photo(String id, String uploaderId, String uploadTime) {
    this.id = id;
    this.uploaderId = uploaderId;
    this.uploadTime = uploadTime as DateTime;
  }

  // named constructor
  Photo.newPhoto(String uploaderId) {
    var uuid = Uuid();
    this.id = uuid.v4();
    this.uploaderId = uploaderId;
    this.uploadTime = DateTime.now();
  }
}
