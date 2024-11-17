class AudiencePrediction {
  String id;
  String name;
  String email;
  //String phoneNumber;
  String predictedTeam;

  AudiencePrediction({
    required this.id,
    required this.name,
    required this.email,
    //required this.phoneNumber,
    required this.predictedTeam,
  });

  factory AudiencePrediction.fromJson(Map<String, dynamic> json) {
    return AudiencePrediction(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      //phoneNumber: json['phoneNumber'],
      predictedTeam: json['predictedTeam'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      //'phoneNumber': phoneNumber,
      'predictedTeam': predictedTeam,
    };
  }
}
