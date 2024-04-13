import 'package:uah_shelters/src/models/access_group.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/shelter.dart';
import 'package:uah_shelters/src/services/db/interface.dart';
import 'package:uah_shelters/src/models/employee.dart';

class ShelterRepository {
  final IDBStorage dbStorage;

  ShelterRepository(this.dbStorage);

  // Employee -----------------------------------------------------------------

  Future<Employee> getOneEmployee(String uuid) async {
    final json = await dbStorage.readDoc('employees', uuid);
    return Employee.fromJson(json);
  }

  Future<List<Employee>> getAllEmployees(int? limit, dynamic from) async {
    final batchResult = await dbStorage.readDocs("employees", from, limit);
    return batchResult.documents.map<Employee>((json) => Employee.fromJson(json)).toList();
  }

  Future<void> updateEmployee(Employee employee) async {
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignEmployeeToShelter(Employee employee, Shelter shelter) async { 
    employee.inShelters.add(shelter.uuid);
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignEmployeeToAccessGroup(Employee employee, AccessGroup accessGroup) async {
    employee.inAccessGroups.add(accessGroup.uuid);
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  // TODO: add photo saving to the storage and saving path in the end to DB
  Future<void> setEmployeePhoto(Employee employee, dynamic photo) async {
    const photoPath = "TODO";

    employee.photoPath = photoPath;
    await dbStorage.updateDoc('employees', employee.uuid, employee.toJson());
  }

  // Access Group -------------------------------------------------------------

  Future<void> updateAccessGroup(AccessGroup accessGroup) async {
    await dbStorage.updateDoc('access_groups', accessGroup.uuid, accessGroup.toJson());
  }

  Future<void> removeAccessGroup(AccessGroup accessGroup) async {
    await dbStorage.deleteDocs('access_groups', [accessGroup.uuid]);
  }

  // Account -------------------------------------------------------------

  Future<void> updateAccount(Account account) async {
    await dbStorage.updateDoc('accounts', account.uuid, account.toJson());
  }

  Future<void> assignEmployeeToAccount(Employee employee, Account account) async {
    employee.accountUUID = account.uuid;
    await dbStorage.updateDoc('employees', employee.uuid, account.toJson());
  }

  Future<void> removeEmployeeFromAccount(Employee employee, Account account) async {
    employee.accountUUID = null;
    await dbStorage.updateDoc('employees', employee.uuid, account.toJson());
  }
}
