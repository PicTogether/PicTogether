class Appointment {
  late String id;
  late String title;
  late DateTime date;
  late List<String> people;
  late String galleryId;

  Appointment(String id, DateTime date, List<String> people, String galleryId) {
    this.id = id;
    this.title = title;
    this.date = date;
    this.people = people;
    this.galleryId = galleryId;
  }
}
