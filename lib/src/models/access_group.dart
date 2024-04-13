class CRUD {
  bool create;
  bool read;
  bool update;
  bool delete;

  CRUD(
      {this.create = false,
      this.read = false,
      this.update = false,
      this.delete = false});

  // Factory constructor to create a CRUD instance from an integer
  factory CRUD.fromInt(int? val) {
    if (val == null) {
      return CRUD(read: true);
    }

    return CRUD(
      create: (val & 8) != 0, // Checks the 4th bit
      read: (val & 4) != 0, // Checks the 3rd bit
      update: (val & 2) != 0, // Checks the 2nd bit
      delete: (val & 1) != 0, // Checks the 1st bit
    );
  }

  // Method to convert the CRUD instance to an integer
  int toInt() {
    int val = 0;
    if (create) val += 8;
    if (read) val += 4;
    if (update) val += 2;
    if (delete) val += 1;
    return val;
  }
}

class AccessGroup {
  String uuid;
  String accountUUID;
  String name;
  CRUD user;
  CRUD group;
  CRUD shelter;
  CRUD animal;
  CRUD animalTreatment;
  CRUD animalMedicalDocs;

  AccessGroup({
    required this.uuid,
    required this.accountUUID,
    required this.name,
    CRUD? user,
    CRUD? group,
    CRUD? shelter,
    CRUD? animal,
    CRUD? animalTreatment,
    CRUD? animalMedicalDocs,
  })  : user = user ?? CRUD(read: true),
        group = group ?? CRUD(read: true),
        shelter = shelter ?? CRUD(read: true),
        animal = animal ?? CRUD(read: true),
        animalTreatment = animalTreatment ?? CRUD(read: true),
        animalMedicalDocs = animalMedicalDocs ?? CRUD(read: true);

  factory AccessGroup.fromJson(Map<String, dynamic> json) {
    return AccessGroup(
      uuid: json['uuid'],
      accountUUID: json['accountUUID'],
      name: json['name'],
      user: CRUD.fromInt(json['user']),
      group: CRUD.fromInt(json['group']),
      shelter: CRUD.fromInt(json['shelter']),
      animal: CRUD.fromInt(json['animal']),
      animalTreatment: CRUD.fromInt(json['animalTreatment']),
      animalMedicalDocs: CRUD.fromInt(json['animalMedicalDocs']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'accountUUID': accountUUID,
      'name': name,
      'user': user.toInt(),
      'group': group.toInt(),
      'shelter': shelter.toInt(),
      'animal': animal.toInt(),
      'animalTreatment': animalTreatment.toInt(),
      'animalMedicalDocs': animalMedicalDocs.toInt(),
    };
  }
}
