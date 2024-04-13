class Employee {
  String uuid;
  String? accountUUID;
  String firstName;
  String lastName;
  String photoPath;
  bool isOwner;
  List<String> phones;
  List<String> links;
  List<String> inShelters;
  List<String> inAccessGroups;

  Employee({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.photoPath,
    required this.isOwner,
    this.accountUUID,
    List<String>? phones,
    List<String>? links,
    List<String>? inShelters,
    List<String>? inAccessGroups,
  })  : phones = phones ?? [],
        links = links ?? [],
        inShelters = inShelters ?? [],
        inAccessGroups = inAccessGroups ?? [];

  factory Employee.fromJson(dynamic json) {
    return Employee(
      uuid: json['uuid'],
      accountUUID: json['accountUUID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      photoPath: json['photoPath'],
      phones: List<String>.from(json['phones'] ?? []),
      isOwner: json['isOwner'],
      links: json['links'] != null ? List<String>.from(json['links']) : [],
      inShelters: json['inShelters'] != null
          ? List<String>.from(json['inShelters'])
          : [],
      inAccessGroups: json['inAccessGroups'] != null
          ? List<String>.from(json['inAccessGroups'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'accountUUID': accountUUID,
      'firstName': firstName,
      'lastName': lastName,
      'photoPath': photoPath,
      'phones': phones,
      'isOwner': isOwner,
      'links': links,
      'inShelters': inShelters,
      'inAccessGroups': inAccessGroups,
    };
  }
}
