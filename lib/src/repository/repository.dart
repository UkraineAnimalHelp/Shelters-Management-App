import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uah_shelters/src/repository/org_repository.cloud.dart';
import 'package:uah_shelters/src/repository/org_repository.interface.dart';
import 'package:uah_shelters/src/repository/org_repository.local.dart';
import 'package:uah_shelters/src/utils/db/hive.dart';
import 'package:uah_shelters/src/utils/fs/local.dart';

// TODO(avdonin): revisit, potentialy for future use
class Repository {
  late final FirebaseFirestore cdb;
  late final FirebaseStorage cfs;
  late final HiveService ldb;
  late final LocalStorageService lfs;
  static bool isCloud = false;
  static Repository? _instance;

  Repository._privateConstructor(this.cdb, this.cfs, this.ldb, this.lfs);

  static void initialize(
      {required bool cloud,
      FirebaseFirestore? db,
      FirebaseStorage? fs,
      HiveService? hs,
      LocalStorageService? lss}) {
    isCloud = cloud;
    _instance ??= Repository._privateConstructor(
        db ?? FirebaseFirestore.instance,
        fs ?? FirebaseStorage.instance,
        hs ?? HiveService(),
        lss ?? LocalStorageService());
  }

  static void reset() {
    // This method is added for testing purposes.
    if (_instance == null) {
      throw Exception("Repository must be initialized before use");
    }

    if (isCloud) {
      OrgRepositoryCloud.reset();
    } else {
      OrgRepositoryLocal.reset();
    }

    _instance = null;
  }

  static bool isInited() {
    // This method is added for testing purposes.
    return _instance == null ? false : true;
  }

  void initCloud(
    FirebaseFirestore? db,
    FirebaseStorage? fs,
  ) {
    _instance!.cdb = db ?? FirebaseFirestore.instance;
    _instance!.cfs = fs ?? FirebaseStorage.instance;
  }

  static IOrgRepository org() {
    if (_instance == null) {
      throw Exception("Repository must be initialized before use");
    }

    if (isCloud) {
      OrgRepositoryCloud.initialize(_instance!.cdb, _instance!.cfs);
      return OrgRepositoryCloud.instance;
    } else {
      OrgRepositoryLocal.initialize(_instance!.ldb, _instance!.lfs);
      return OrgRepositoryLocal.instance;
    }
  }
}
