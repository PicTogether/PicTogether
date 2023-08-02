import 'package:uuid/uuid.dart';

class Appointment {
  late String id;
  late String title;
  late DateTime date;
  late List<String> people;
  late String galleryId;

  Appointment(this.id, this.title, this.date, this.people, this.galleryId);

  // named constructor
  Appointment.newAppointment(String title, DateTime date) {
    var uuid = Uuid();
    this.id = uuid.v4();
    this.title = title;
    this.date = date;
    this.people = [];
    this.galleryId = uuid.v4();
  }
}
