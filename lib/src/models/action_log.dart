class ActionLog {
  String uuid;
  String accountUUID;
  String action;
  String? animalUUID;
  String shelterName;
  String employeeName;
  DateTime datetime;
  DateTime ttl;

  ActionLog({
    required this.uuid,
    required this.accountUUID,
    required this.action,
    this.animalUUID,
    required this.shelterName,
    required this.employeeName,
    required this.datetime,
    required this.ttl,
  });

  factory ActionLog.fromJson(dynamic json) {
    return ActionLog(
      uuid: json['uuid'],
      accountUUID: json['accountUUID'],
      action: json['action'],
      animalUUID: json['animalUUID'],
      shelterName: json['shelterName'],
      employeeName: json['employeeName'],
      datetime: DateTime.parse(json['datetime']),
      ttl: DateTime.parse(json['ttl']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'accountUUID': accountUUID,
      'action': action,
      'animalUUID': animalUUID, // Handles null automatically
      'shelterName': shelterName,
      'employeeName': employeeName,
      'datetime': datetime.toIso8601String(),
      'ttl': ttl.toIso8601String(),
    };
  }
}
