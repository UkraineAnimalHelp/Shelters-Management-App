import 'dart:async';
import 'dart:io';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/shelter.dart';
import 'package:uah_shelters/src/repository/org_repository.interface.dart';
import 'package:uah_shelters/src/utils/db/hive.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/utils/fs/local.dart';

class OrgRepositoryLocal implements IOrgRepository {

  final HiveService hs;
  final LocalStorageService lss;

  OrgRepositoryLocal._privateConstructor(this.hs, this.lss);

  static OrgRepositoryLocal? _instance;

  static void initialize(HiveService hs, LocalStorageService lss) {
    _instance ??= OrgRepositoryLocal._privateConstructor(hs, lss);
  }

  static void reset() {
    // This method is added for testing purposes.
    _instance = null;
  }

  static bool isInited() {
    // This method is added for testing purposes.
    return _instance == null ? false: true;
  }

  static OrgRepositoryLocal get instance {
    if (_instance == null) {
      throw Exception("OrgRepositoryLocal must be initialized before use");
    }
    return _instance!;
  }

  // Employee -----------------------------------------------------------------
  @override
  String getLocalUUID() {
    return "local";
  }

  @override
  Future<void> createLocalEmployee() async {
    var id = getLocalUUID();
    var employee = Employee(
      uuid: id,
      accountUUID: id,
      firstName: "",
      lastName: "",
      photoPath: "",
      phones: [],
      links: [],
      inShelters: [],
      inAccessGroups: [],
      email: "",
      isOwner: true);

    await addEmployee(employee);

    var account = Account(
      uuid: id,
      ownerUUID: id,
      organizationName: "local");

    await addAccount(account);

    var shelter = Shelter(
      uuid: id,
      accountUUID: id,
      name: "local");

    return await addShelter(shelter);
  }

  @override
  Future<Employee?> getOneEmployee(String uuid) async {
    final Map<String, dynamic>? json =
        await hs.readDoc('employees', uuid);
    if (json == null) {
      return null;
    }
    return Employee.fromJson(json);
  }
  
  @override
  Future<void> addEmployee(Employee employee) async {
    await hs.addDoc('employees', employee.uuid, employee.toJson());
  }

  @override
  Future<void> updateEmployee(Employee employee) async {
    await hs.updateDoc('employees', employee.uuid, employee.toJson());
  }

  @override
  Future<String> updateEmployeePhoto(String uuid, File photo) async {
    final String path = "users/$uuid/profile.jpg";
    await uploadFile(path, photo, null);
    return path;
  }

  // Shelter ------------------------------------------------------------------
  @override
  Future<void> addShelter(Shelter account) async {
    await hs.addDoc('shelters', account.uuid, account.toJson());
  }

  // Account ------------------------------------------------------------------
  @override
  Future<void> registerNewOrg(String userID, Account account) async {
    Employee? employee = await getOneEmployee(userID);
    if (employee == null) {
      throw Exception('Employee not found');
    }
    Account? exist = await getOneAccount(account.uuid);
    if (exist != null) {
      throw Exception('Such organization already exists. Choose another one');
    }

    employee.accountUUID = account.uuid;
    employee.isOwner = true;

    addAccount(account);
    updateEmployee(employee);
  }

  @override
  Future<Account?> getOneAccount(String uuid) async {
    final Map<String, dynamic>? json =
        await hs.readDoc('accounts', uuid);
    if (json == null) {
      return null;
    }
    return Account.fromJson(json);
  }
  
  @override
  Future<void> addAccount(Account account) async {
    await hs.addDoc('accounts', account.uuid, account.toJson());
  }

  // Files --------------------------------------------------------------------
  @override
  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    return await lss.uploadFile(path, file, action);
  }
}
