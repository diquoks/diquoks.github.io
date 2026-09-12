import "package:diquoks_web/diquoks_web.dart";

class const OsuCollab({
  required final String title,
  required final Image image,
  required final List<OsuCollabMember> members,
}) extends Model {
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

class const OsuCollabMember({
  required final int id,
  required final String username,
  required final int x,
  required final int y,
  required final int width,
  required final int height,
}) extends Model {
  String get link => "https://osu.ppy.sh/u/$id";

  String get _bbcode => "[profile=$id]$username[/profile]";

  String get _mapping => "$x $y $width $height $link $username";
}
