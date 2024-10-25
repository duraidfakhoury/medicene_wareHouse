class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Top Pharma',
    image: 'imagesone/undraw_Doctors_p6aq.png',
    discription: "Booking and ordering medicines "
    "from the warehouse quickly and easily"
   
  ),
  UnbordingContent(
    title: 'Browse by genre',
    image: 'imagesone/undraw_medicine_b1ol.png',
    discription: "In the application you can search for the "
    "selected drug with its details "
  ),
  UnbordingContent(
    title: 'Online 24/24',
    image: 'imagesone/undraw_doctor_kw5l.png',
    discription: "You don't have to worry "
    "about waiting too long in warehouse jams "
  ),
];
