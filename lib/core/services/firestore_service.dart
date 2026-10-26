import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService(this._db);

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> collection(String path) =>
      _db.collection(path);

  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String path) =>
      _db.doc(path).get();

  Future<void> setDoc(
    String path,
    Map<String, dynamic> data, {
    bool merge = true,
  }) =>
      _db.doc(path).set(data, SetOptions(merge: merge));

  Future<void> updateDoc(String path, Map<String, dynamic> data) =>
      _db.doc(path).update(data);

  Future<void> deleteDoc(String path) => _db.doc(path).delete();

  Stream<DocumentSnapshot<Map<String, dynamic>>> docStream(String path) =>
      _db.doc(path).snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream(String path) =>
      _db.collection(path).snapshots();
}
