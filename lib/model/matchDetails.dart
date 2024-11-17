class GroupDetails {
  final String group_name;
  final List<Group> teams;

  GroupDetails({
    required this.group_name,
    required this.teams,
  });

  factory GroupDetails.fromJson(Map<String, dynamic> json) {
    return GroupDetails(
      group_name: json['group_name'],
      teams: List<Group>.from(json['teams'].map((e) => Group.fromJson(e))),
    );
  }
}

class Group {
  final int draw;
  final String group;
  final int loss;
  final int match;
  final int point;
  final int win;
  final int runrate;
  final String team;

  Group({
    required this.draw,
    required this.group,
    required this.loss,
    required this.match,
    required this.point,
    required this.win,
    required this.runrate,
    required this.team,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      draw: json['draw'],
      group: json['group'],
      loss: json['loss'],
      match: json['match'],
      point: json['point'],
      win: json['win'],
      runrate: json['runrate'],
      team: json['team'],
    );
  }
}