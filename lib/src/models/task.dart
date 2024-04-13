enum TaskType {
  treatment,
  task;

  String toJson() => name;
  static TaskType fromJson(String json) => values.byName(json);
}

class Task {
  String uuid;
  TaskType type;
  Map<String, dynamic>? data;
  String accountUUID;
  String? animalUUID;
  String? treatmentUUID;
  String? employeeUUID;
  String title;
  String body;
  bool isDone;
  DateTime timestamp;
  DateTime ttl;

  Task({
    required this.uuid,
    required this.type,
    required this.accountUUID,
    required this.title,
    required this.body,
    required this.isDone,
    required this.timestamp,
    required this.ttl,
    this.animalUUID,
    this.treatmentUUID,
    this.employeeUUID,
    this.data,
  });

  factory Task.fromJson(dynamic json) {
    return Task(
      uuid: json['uuid'],
      type: TaskType.fromJson(json['type']),
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']): null,
      accountUUID: json['accountUUID'],
      animalUUID: json['animalUUID'],
      treatmentUUID: json['treatmentUUID'],
      employeeUUID: json['employeeUUID'],
      title: json['title'],
      body: json['body'],
      isDone: json['isDone'],
      timestamp: DateTime.parse(json['timestamp']),
      ttl: DateTime.parse(json['ttl']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'type': type.toJson(),
      'data': data,
      'accountUUID': accountUUID,
      'animalUUID': animalUUID,
      'treatmentUUID': treatmentUUID,
      'employeeUUID': employeeUUID,
      'title': title,
      'body': body,
      'isDone': isDone,
      'timestamp': timestamp.toIso8601String(),
      'ttl': ttl.toIso8601String(),
    };
  }
}
