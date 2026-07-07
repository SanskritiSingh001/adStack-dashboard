class PersonModel {
  final String name;
  final String imagePath;

  PersonModel({required this.name, required this.imagePath});
}

List<PersonModel> dummyBirthdays = [
  PersonModel(name: "Riya", imagePath: "assets/person1.png"),
  PersonModel(name: "Aman", imagePath: "assets/person2.png"),
];

List<PersonModel> dummyAnniversaries = [
  PersonModel(name: "Pooja", imagePath: "assets/person3.png"),
  PersonModel(name: "Karan", imagePath: "assets/person4.png"),
  PersonModel(name: "Simran", imagePath: "assets/person5.png"),
];
