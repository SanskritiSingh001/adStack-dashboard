
class ProjectModel {
  final String title;
  final String subtitle;
  final String imagePath;

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}


List<ProjectModel> dummyProjects = [
  ProjectModel(
    title: "Technology behind the Blockchain",
    subtitle: "Project #1",
    imagePath: "assets/images/project1.png",
  ),
  ProjectModel(
    title: "Technology behind the Blockchain",
    subtitle: "Project #2",
    imagePath: "assets/images/poject2.png",
  ),
  ProjectModel(
    title: "Technology behind the Blockchain",
    subtitle: "Project #3",
    imagePath: "assets/images/project3.png",
  ),
];
