import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uah_shelters/src/models/access_group.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/shelter.dart';
import 'package:uah_shelters/src/services/db/interface.dart';
import 'package:uah_shelters/src/models/employee.dart';

class ShelterRepository {
  final IDBStorage dbStorage;

  ShelterRepository._privateConstructor(this.dbStorage);

  static ShelterRepository? _instance;

  static void initialize(IDBStorage dbStorage) {
    _instance ??= ShelterRepository._privateConstructor(dbStorage);
  }

  static ShelterRepository get instance {
    if (_instance == null) {
      throw Exception("ShelterRepository must be initialized before use");
    }
    return _instance!;
  }

  // Employee -----------------------------------------------------------------

  Future<Employee?> getOneEmployee(String uuid) async {
    final Map<String, dynamic>? json =
        await dbStorage.readDoc('employees', uuid);
    if (json == null) {
      return null;
    }
    return Employee.fromJson(json);
  }

  Future<List<Employee>> getAllEmployees(int? limit, dynamic from) async {
    final batchResult = await dbStorage.readDocs("employees", from, limit);
    return batchResult.documents
        .map<Employee>((json) => Employee.fromJson(json))
        .toList();
  }

  Future<void> addEmployee(Employee employee) async {
    await dbStorage.addDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> updateEmployee(Employee employee) async {
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignEmployeeToShelter(
      Employee employee, Shelter shelter) async {
    employee.inShelters.add(shelter.uuid);
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignEmployeeToAccessGroup(
      Employee employee, AccessGroup accessGroup) async {
    employee.inAccessGroups.add(accessGroup.uuid);
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> setEmployeePhoto(Employee employee, File photo) async {
    final String path = "users/${employee.uuid}/profile.jpg";
    await uploadFile(path, photo, null);
    employee.photoPath = path;
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  // Access Group -------------------------------------------------------------

  Future<void> addAccessGroup(AccessGroup accessGroup) async {
    await dbStorage.addDoc('employees', accessGroup.uuid, accessGroup.toJson());
  }

  Future<void> updateAccessGroup(AccessGroup accessGroup) async {
    await dbStorage.updateDoc(
        'access_groups', accessGroup.uuid, accessGroup.toJson());
  }

  Future<void> removeAccessGroup(AccessGroup accessGroup) async {
    await dbStorage.deleteDocs('access_groups', [accessGroup.uuid]);
  }

  // Account ------------------------------------------------------------------
  Future<void> addAccount(Account account) async {
    await dbStorage.addDoc('employees', account.uuid, account.toJson());
  }

  Future<void> updateAccount(Account account) async {
    await dbStorage.updateDoc('accounts', account.uuid, account.toJson());
  }

  Future<void> assignEmployeeToAccount(
      Employee employee, Account account) async {
    employee.accountUUID = account.uuid;
    await dbStorage.updateDoc('employees', employee.uuid, account.toJson());
  }

  Future<void> removeEmployeeFromAccount(
      Employee employee, Account account) async {
    employee.accountUUID = null;
    await dbStorage.updateDoc('employees', employee.uuid, account.toJson());
  }

  // Files --------------------------------------------------------------------

  Future<String> getFileUrl(String path) async {
    return await FirebaseStorage.instance.ref(path).getDownloadURL();
  }

  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    action ??= () => {};
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(action);
    return await ref.getDownloadURL();
  }
}
