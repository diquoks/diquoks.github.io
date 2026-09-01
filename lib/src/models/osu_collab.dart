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
      members.map((OsuCollabMember member) => member.toString()).join("\n");

  String get _membersTags =>
      members.map((OsuCollabMember member) => member._profileTag).join(" | ");

  @override
  String toString() =>
      """
[centre][size=150][b]$title[/b][/size][/centre]
[imagemap]
${image.src}
$_membersMapping
[/imagemap]
[centre][b]$_membersTags[/b][/centre]
""";
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

  String get _profileTag => "[profile=$id]$username[/profile]";

  @override
  String toString() => "$x $y $width $height $link $username";
}
