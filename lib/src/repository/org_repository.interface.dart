import 'dart:io';
import 'dart:async';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/models/shelter.dart';

abstract class IOrgRepository {
  String getLocalUUID();
  Future<void> createLocalEmployee();
  Future<Employee?> getOneEmployee(String uuid);
  Future<void> addEmployee(Employee employee);
  Future<void> updateEmployee(Employee employee);
  Future<String> updateEmployeePhoto(String uuid, File photo);
  Future<void> addShelter(Shelter account);
  Future<void> registerNewOrg(String userID, Account account);
  Future<Account?> getOneAccount(String uuid);
  Future<void> addAccount(Account account);
  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action);
}
