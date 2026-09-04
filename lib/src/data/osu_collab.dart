import "package:diquoks_web/diquoks_web.dart";

class OsuCollab {
  const OsuCollab({
    required this.title,
    required this.image,
    required this.members,
  });

  final String title;
  final Image image;
  final List<OsuCollabMember> members;

  String get _membersMapping =>
      members.map(((OsuCollabMember member) => member._mapping)).join("\n");

  String get _membersBbcode =>
      members.map(((OsuCollabMember member) => member._bbcode)).join(" | ");

  String bbcode(WebsiteContent content) =>
      """
[centre][b][size=150]$title[/size][/b][/centre]
[imagemap]
${content.absolutePath(image.src)}
$_membersMapping
[/imagemap]
[centre][b]$_membersBbcode[/b][/centre]""";
}

class OsuCollabMember {
  const OsuCollabMember({
    required this.id,
    required this.username,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  final int id;
  final String username;
  final int x;
  final int y;
  final int width;
  final int height;

  String get link => "https://osu.ppy.sh/u/$id";

  String get _bbcode => "[profile=$id]$username[/profile]";

  String get _mapping => "$x $y $width $height $link $username";
}
