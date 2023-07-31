class Appointment {
  late String id;
  late DateTime date;
  late List<String> people;
  late String galleryId;

  Appointment(String id, DateTime date, List<String> people, String galleryId) {
    this.id = id;
    this.date = date;
    this.people = people;
    this.galleryId = galleryId;
  }
}
