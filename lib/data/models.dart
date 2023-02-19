class SolarFlame {
  String? startTime;
  String? pickTime;
  String? endTime;
  String? classSolarFlame;
  SolarFlame(
      {required this.startTime,
      required this.pickTime,
      required this.endTime,
      required this.classSolarFlame});
  factory SolarFlame.fromJson(Map<String, dynamic> json) {
    return SolarFlame(
        startTime: json['beginTime'],
        pickTime: json['peakTime'],
        endTime: json['endTime'],
        classSolarFlame: json['classType']);
  }
}

class Test {
  String? pickTime;
  Test({required this.pickTime});
}
