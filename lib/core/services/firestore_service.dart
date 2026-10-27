import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService([this._db]);

  final FirebaseFirestore? _db;

  CollectionReference<Map<String, dynamic>>? collection(String path) =>
      _db?.collection(path);

  Future<DocumentSnapshot<Map<String, dynamic>>?> getDoc(String path) async =>
      _db?.doc(path).get();

  Future<void> setDoc(
    String path,
    Map<String, dynamic> data, {
    bool merge = true,
  }) async =>
      _db?.doc(path).set(data, SetOptions(merge: merge));

  Future<void> updateDoc(String path, Map<String, dynamic> data) async =>
      _db?.doc(path).update(data);

  Future<void> deleteDoc(String path) async => _db?.doc(path).delete();

  Stream<DocumentSnapshot<Map<String, dynamic>>> docStream(String path) =>
      _db?.doc(path).snapshots() ?? const Stream.empty();
}
