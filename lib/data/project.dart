import "package:diquoks_web/diquoks_web.dart";

class Project extends Model {
  const Project({
    required this.title,
    required this.description,
    required this.link,
    required this.image,
    required this.backgroundImage,
    required this.skillsIcons,
  });

  final String title;
  final String description;
  final String link;
  final Image image;
  final BackgroundImage backgroundImage;
  final List<SkillsIcon> skillsIcons;
}
