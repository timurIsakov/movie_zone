import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_zone/core/api/constants/local_keys_constants.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';
import '../services/secure_storage_service.dart';
import 'constants/firebase_collections_constants.dart';

class FirebaseApi {
  final SecureStorageService localDb = SecureStorageService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> signIn({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }

  Future<bool> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final userId = credential.user?.uid ?? '';

    await db.collection(FirebaseCollectionsConstants.tUser).doc(userId).set(
        UserModel.fromEntity(
            entity: UserEntity(
                id: userId,
                name: name,
                email: email,
                password: password,
                movies: const [])).toJson());
    localDb.save(key: LocalKeysConstants.tUserId, value: userId);
    return true;
  }

  Future<UserModel> getCurrentUser() async {
    final userId = await localDb.get(key: LocalKeysConstants.tUserId);

    final json = await db
        .collection(FirebaseCollectionsConstants.tUser)
        .doc(userId)
        .get();

    final model = UserModel.fromJson(json: json.data() as Map<String, dynamic>);

    return model;
  }
}
