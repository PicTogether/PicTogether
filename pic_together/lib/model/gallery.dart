import 'package:uuid/uuid.dart';

class Gallery {
  late String id;
  late String appointmentId;
  late List<String> photoIds;

  Gallery(String id, String appointmentId, List<String> photoIds) {
    this.id = id;
    this.appointmentId = appointmentId;
    this.photoIds = photoIds;
  }

  // named constructor
  Gallery.newGallery(String appointmentId) {
    var uuid = Uuid();
    this.id = uuid.v4();
    this.appointmentId = appointmentId;
    this.photoIds = [];
  }
}
