import "package:diquoks_web/diquoks_web.dart";

class SectionContent<T> extends Model {
  const SectionContent({required this.title, required this.items});

  final String title;
  final List<T> items;
}
