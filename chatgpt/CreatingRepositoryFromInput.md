## Query

I have such interface 

```dart
class BatchResult {
  final List<dynamic> documents;
  final dynamic last;

  BatchResult({required this.documents, this.last});
}

abstract class IDBStorage {
  Future<dynamic> readDoc(String collection, String key);
  Future<BatchResult> readDocs(String collection, dynamic from, int? limit);
  Future<void> updateDoc(String collection, String key, dynamic data);
  Future<void> deleteDocs(String collection, List<String> keys);

  Future<dynamic> readSubDoc(
      String collection, String subcollection, String key, String subKey);
  Future<BatchResult> readSubDocs(String collection, String subcollection,
      String key, dynamic from, int? limit);
  Future<void> updateSubDoc(String collection, String subcollection, String key,
      String subKey, dynamic data);
  Future<void> deleteSubDocs(
      String collection, String subcollection, String key, List<String> keys);
}
```

and such models 

```dart
class Employee {
  String uuid;
  String accountUUID;
  String firstName;
  String lastName;
  String photoPath;
  bool isOwner;
  List<String> phones;
  List<String>? links;
  List<String>? inShelters;
  List<String>? inAccessGroups;

  Employee({
    required this.uuid,
    required this.accountUUID,
    required this.firstName,
    required this.lastName,
    required this.photoPath,
    required this.isOwner,
    List<String>? phones,
    this.links,
    this.inShelters,
    this.inAccessGroups,
  }) : phones = phones ?? [];

  factory Employee.fromJson(dynamic json) {
    return Employee(
      uuid: json['uuid'],
      accountUUID: json['accountUUID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      photoPath: json['photoPath'],
      phones: List<String>.from(json['phones'] ?? []),
      isOwner: json['isOwner'],
      links: json['links'] != null ? List<String>.from(json['links']) : null,
      inShelters: json['inShelters'] != null
          ? List<String>.from(json['inShelters'])
          : null,
      inAccessGroups: json['inAccessGroups'] != null
          ? List<String>.from(json['inAccessGroups'])
          : null,
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


```

and i need you to create shelter repository class that will use service with interface IDBStorage and have such methods:

Employees: getOne, getAll(paginated), update, remove, assignToShelter, assignToAccessGroup

## Result

To create a `ShelterRepository` class that interacts with a service implementing the `IDBStorage` interface and provides methods for managing `Employee` data, you can follow this design. This repository will encapsulate the logic needed to interact with the underlying database via the `IDBStorage` interface and will provide a clear API for employee-related operations.

### Designing the ShelterRepository Class

The `ShelterRepository` will need methods to:
- Retrieve a single employee or all employees (with pagination support).
- Update, and remove employees.
- Assign employees to shelters and access groups.

Here's a Dart class that demonstrates how this could be implemented:

```dart
import 'path_to_your_idb_storage.dart';
import 'path_to_your_employee_class.dart';

class ShelterRepository {
  final IDBStorage dbStorage;

  ShelterRepository(this.dbStorage);

  Future<Employee> getOne(String uuid) async {
    final json = await dbStorage.readDoc('employees', uuid);
    return Employee.fromJson(json);
  }

  Future<List<Employee>> getAll(String collection, int? limit, dynamic from) async {
    final batchResult = await dbStorage.readDocs(collection, from, limit);
    return batchResult.documents.map<Employee>((json) => Employee.fromJson(json)).toList();
  }

  Future<void> update(Employee employee) async {
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> remove(List<String> uuids) async {
    await dbStorage.deleteDocs('employees', uuids);
  }

  Future<void> assignToShelter(Employee employee, Shelter shelter) async { 
    employee.inShelters.add(shelter.uuid);
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignToAccessGroup(Employee employee, AccessGroup accessGroup) async {
    employee.inAccessGroups.add(accessGroup.uuid);
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }
}

```

### Explanation:
1. **Constructor**: The `ShelterRepository` takes an instance of `IDBStorage` to facilitate database operations.
2. **getOne**: Fetches a single employee based on UUID.
3. **getAll**: Retrieves a list of employees, potentially with pagination. The `readDocs` method would need to handle pagination details (like which document to start from and the number of documents to fetch).
6. **update**: Updates specific fields of an existing employee.
7. **remove**: Removes one or more employees from the database based on their UUIDs.
8. **assignToShelter** and **assignToAccessGroup**: Assign an employee to a shelter or an access group. These methods assume that such assignments are stored directly in the employee's document.

### Usage:
This repository can be used by services or controllers in your application to abstract the complexity of database operations and provide a clean interface for employee management within shelters.

### Considerations:
- **Error Handling**: You should add error handling within the repository methods to manage exceptions thrown by database operations.
- **Validation**: Before adding or updating documents, ensure that data validation is performed either in the repository or before calling its methods.
- **Concurrency**: Consider concurrency or transactional integrity if your database operations involve multiple steps that must be completed as a single unit of work.

This setup will help maintain clean architecture by segregating database access from business logic and presentation layers, making your code more maintainable and testable.
