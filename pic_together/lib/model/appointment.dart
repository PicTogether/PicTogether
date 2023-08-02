import 'package:uuid/uuid.dart';

class Appointment {
  late String id;
  late String title;
  late DateTime date;
  late List<String> people;
  late String galleryId;

  Appointment(String id, String title, DateTime date, List<String> people,
      String galleryId) {
    this.id = id;
    this.title = title;
    this.date = date;
    this.people = people;
    this.galleryId = galleryId;
  }

  // named constructor
  Appointment.newAppointment(
      String title, DateTime date, List<String> people, String galleryId) {
    var uuid = Uuid();
    this.id = uuid.v4();
    this.title = title;
    this.date = date;
    this.people = people;
    this.galleryId = galleryId;
  }
}
