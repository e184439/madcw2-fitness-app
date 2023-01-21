import 'package:hive/hive.dart';

part 'bmi_history_result.g.dart';

@HiveType(typeId: 1)
class BMIHistoryResult {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int memberId;
  @HiveField(2)
  late String progressDate;
  @HiveField(3)
  late int weight;
  @HiveField(4)
  late int height;
  @HiveField(5)
  late int bmi;

  BMIHistoryResult({
    required this.id,
    required this.memberId,
    required this.progressDate,
    required this.weight,
    required this.height,
    required this.bmi,
  });

  BMIHistoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['memberId'];
    progressDate = json['progressDate'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['memberId'] = memberId;
    data['progressDate'] = progressDate;
    data['weight'] = weight;
    data['height'] = height;
    data['bmi'] = bmi;
    return data;
  }
}
