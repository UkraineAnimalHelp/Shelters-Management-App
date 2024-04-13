class Account {
  String uuid;
  String organizationName;

  Account({
    required this.uuid,
    required this.organizationName,
  });

  factory Account.fromJson(dynamic json) {
    return Account(
        uuid: json['uuid'], organizationName: json['organizationName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'organizationName': organizationName,
    };
  }
}
