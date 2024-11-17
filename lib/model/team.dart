class Player {
  final String name;

  Player({
    required this.name,
  });

  factory Player.fromJson(String json) {
    return Player(
      name: json,
    );
  }

  String toJson() {
    return name;
  }
}

class Team {
  final String teamName;
  final String teamimage;
  final List<Player> players;

  Team({
    required this.teamName,
    required this.teamimage,
    required this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamName: json['teamName'] as String,
      teamimage: json['teamimage'] as String,
      players: (json['players'] as List).map((player) => Player.fromJson(player)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'teamimage': teamimage,
      'players': players.map((player) => player.toJson()).toList(),
    };
  }
}