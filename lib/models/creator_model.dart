
class CreatorModel {
  final String name;
  final int artworks;
  final double rating;

  CreatorModel({
    required this.name,
    required this.artworks,
    required this.rating,
  });
}

List<CreatorModel> dummyCreators = [
  CreatorModel(name: "@maddison_c21", artworks: 9821, rating: 0.9),
  CreatorModel(name: "@karl.will02", artworks: 7032, rating: 0.7),
  CreatorModel(name: "@maddison_c21", artworks: 9821, rating: 0.85),
  CreatorModel(name: "@maddison_c21", artworks: 9821, rating: 0.6),
];
