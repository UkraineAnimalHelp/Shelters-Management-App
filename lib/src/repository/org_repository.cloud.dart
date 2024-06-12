import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uah_shelters/src/models/access_group.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/shelter.dart';
import 'package:uah_shelters/src/repository/org_repository.interface.dart';
import 'package:uah_shelters/src/utils/db/firestore.dart';
import 'package:uah_shelters/src/utils/fs/firebase.dart';
import 'package:uah_shelters/src/models/employee.dart';

class OrgRepositoryCloud implements IOrgRepository {
  final FirebaseFirestore _db;
  // ignore: unused_field
  final FirebaseStorage _fs;
  final FirestoreService db;
  final FirebaseStorageService fs;

  OrgRepositoryCloud._privateConstructor(this._db, this._fs, this.db, this.fs);

  static OrgRepositoryCloud? _instance;

  static void initialize(FirebaseFirestore db, FirebaseStorage fs) {
    _instance ??= OrgRepositoryCloud._privateConstructor(
        db, fs, FirestoreService(db), FirebaseStorageService(fs));
  }

  static void reset() {
    // This method is added for testing purposes.
    _instance = null;
  }

  static bool isInited() {
    // This method is added for testing purposes.
    return _instance == null ? false : true;
  }

  static OrgRepositoryCloud get instance {
    if (_instance == null) {
      throw Exception("OrgRepository must be initialized before use");
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

    var account = Account(uuid: id, ownerUUID: id, organizationName: "local");

    await addAccount(account);

    var shelter = Shelter(uuid: id, accountUUID: id, name: "local");

    return await addShelter(shelter);
  }

  @override
  Future<Employee?> getOneEmployee(String uuid) async {
    if (uuid == "") {
      return null;
    }
    final Map<String, dynamic>? json = await db.readDoc('employees', uuid);
    if (json == null) {
      return null;
    }
    return Employee.fromJson(json);
  }

  Future<List<Employee>> getAllEmployees(int? limit, dynamic from) async {
    final batchResult = await db.readDocs("employees", from, limit);
    return batchResult.documents
        .map<Employee>((json) => Employee.fromJson(json))
        .toList();
  }

  @override
  Future<void> addEmployee(Employee employee) async {
    await db.addDoc('employees', employee.uuid, employee.toJson());
  }

  @override
  Future<void> updateEmployee(Employee employee) async {
    await db.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignEmployeeToShelter(
      Employee employee, Shelter shelter) async {
    employee.inShelters.add(shelter.uuid);
    await db.updateDoc('employees', employee.uuid, employee.toJson());
  }

  Future<void> assignEmployeeToAccessGroup(
      Employee employee, AccessGroup accessGroup) async {
    employee.inAccessGroups.add(accessGroup.uuid);
    await db.updateDoc('employees', employee.uuid, employee.toJson());
  }

  @override
  Future<String> updateEmployeePhoto(String uuid, File photo) async {
    final String path = "users/$uuid/profile.jpg";
    await uploadFile(path, photo, null);
    return path;
  }

  // Access Group -------------------------------------------------------------

  Future<void> addAccessGroup(AccessGroup accessGroup) async {
    await db.addDoc('employees', accessGroup.uuid, accessGroup.toJson());
  }

  Future<void> updateAccessGroup(AccessGroup accessGroup) async {
    await db.updateDoc('access_groups', accessGroup.uuid, accessGroup.toJson());
  }

  Future<void> removeAccessGroup(AccessGroup accessGroup) async {
    await db.deleteDocs('access_groups', [accessGroup.uuid]);
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

    final batch = _db.batch();
    var accRef = _db.collection('accounts').doc(account.uuid);
    batch.set(accRef, account.toJson());
    var empRef = _db.collection('employees').doc(userID);
    batch.set(empRef, employee.toJson());

    batch
        .commit()
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }

  @override
  Future<Account?> getOneAccount(String uuid) async {
    final Map<String, dynamic>? json = await db.readDoc('accounts', uuid);
    if (json == null) {
      return null;
    }
    return Account.fromJson(json);
  }

  @override
  Future<void> addAccount(Account account) async {
    await db.addDoc('accounts', account.uuid, account.toJson());
  }

  Future<void> updateAccount(Account account) async {
    await db.updateDoc('accounts', account.uuid, account.toJson());
  }

  Future<void> assignEmployeeToAccount(
      Employee employee, Account account) async {
    employee.accountUUID = account.uuid;
    await db.updateDoc('employees', employee.uuid, account.toJson());
  }

  Future<void> removeEmployeeFromAccount(
      Employee employee, Account account) async {
    employee.accountUUID = null;
    await db.updateDoc('employees', employee.uuid, account.toJson());
  }

  // Shelter ------------------------------------------------------------------
  Future<Shelter?> getOneShelter(String uuid) async {
    final Map<String, dynamic>? json = await db.readDoc('shelters', uuid);
    if (json == null) {
      return null;
    }
    return Shelter.fromJson(json);
  }

  @override
  Future<void> addShelter(Shelter account) async {
    await db.addDoc('shelters', account.uuid, account.toJson());
  }

  Future<void> updateShelter(Shelter account) async {
    await db.updateDoc('shelters', account.uuid, account.toJson());
  }

  // Files --------------------------------------------------------------------
  Future<String> getFileUrl(String path) async {
    return await fs.getFileURI(path);
  }

  @override
  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    return await fs.uploadFile(path, file, action);
  }
}
