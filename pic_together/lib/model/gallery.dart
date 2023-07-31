class Gallery {
  late String id;
  late String appointmentId;
  late List<String> photoIds;

  Gallery(String id, String appointmentId, List<String> photoIds) {
    this.id = id;
    this.appointmentId = appointmentId;
    this.photoIds = photoIds;
  }
}
