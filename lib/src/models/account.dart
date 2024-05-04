class Account {
  String uuid;
  String ownerUUID;
  String organizationName;

  Account({
    required this.uuid,
    required this.ownerUUID,
    required this.organizationName,
  });

  factory Account.fromJson(dynamic json) {
    return Account(
        uuid: json['uuid'], 
        ownerUUID: json['owner_uuid'],
        organizationName: json['organizationName'],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'owner_uuid': ownerUUID,
      'organizationName': organizationName,
    };
  }
}
