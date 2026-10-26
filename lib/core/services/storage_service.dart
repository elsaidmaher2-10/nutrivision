import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService(this._storage);

  final FirebaseStorage _storage;

  Reference ref(String path) => _storage.ref(path);

  Future<String> uploadFile({
    required String path,
    required File file,
  }) async {
    final ref = _storage.ref(path);
    final task = await ref.putFile(file);
    return task.ref.getDownloadURL();
  }

  Future<void> deleteFile(String path) => _storage.ref(path).delete();

  Future<String> getDownloadUrl(String path) =>
      _storage.ref(path).getDownloadURL();
}
