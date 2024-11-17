class Cricket_Match {
  String? id;
  String matchName;
  String venue;
  String date;
  String status;
  String? result;
  // List<Members>? members = [];
  String? createdAt;
  String day_night_type;
  String details;
  String flag0;
  String flag1;
  String group;
  String no;
  String team0;
  String team1;
  String time_GMT;

  Cricket_Match({
    this.id,
    required this.matchName,
    required this.venue,
    required this.date,
    required this.status,
    this.result,
    this.createdAt,
    required this.day_night_type,
    required this.details,
    required this.flag0,
    required this.flag1,
    required this.group,
    required this.no,
    required this.team0,
    required this.team1,
    required this.time_GMT,
  });

  factory Cricket_Match.fromJson(Map<String, dynamic> json) {
    return Cricket_Match(
      matchName: json['matchName'],
      venue: json['venue'],
      date: json['date'],
      status: json['status'],
      result: json['result'] ?? "Not yet published",
      // members: json['members'] != null
      //     ? (json['members'] as List).map((teamJson) => Members.fromJson(teamJson)).toList()
      //     : null,
      createdAt: json['createdAt'],
      day_night_type: json['day_night_type'],
      details: json['details'],
      flag0: json['flag0'],
      flag1: json['flag1'],
      group: json['group'],
      no: json['no'],
      team0: json['team0'],
      team1: json['team1'],
      time_GMT: json['time_GMT'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchName': matchName,
      'venue': venue,
      'date': date,
      'status': status,
      'result': result,
      // 'members': members?.map((team) => team.toJson()).toList(),
      'createdAt': createdAt,
      'day_night_type': day_night_type,
      'details': details,
      'flag0': flag0,
      'flag1': flag1,
      'group': group,
      'no': no,
      'team0': team0,
      'team1': team1,
      'time_GMT': time_GMT,
    };
  }
}