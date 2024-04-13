class Shelter {
  String uuid;
  String accountUUID;
  String name;
  List<String> phones;

  Shelter({
    required this.uuid,
    required this.accountUUID,
    required this.name,
    List<String>? phones,
  }) : phones = phones ?? [];

  factory Shelter.fromJson(dynamic json) {
    return Shelter(
      uuid: json['uuid'],
      accountUUID: json['accountUUID'],
      name: json['name'],
      phones: List<String>.from(json['phones'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'phones': phones,
      'accountUUID': accountUUID,
    };
  }
}
