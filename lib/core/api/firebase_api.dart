import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';
import '../services/secure_storage_service.dart';
import '../services/storage_keys.dart';
import 'api_constants.dart';

class FirebaseApi {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final SecureStorageService secureStorageService;

  FirebaseApi(this.secureStorageService);

  Future<bool> signIn({required String email, required String password}) async {
    final credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final userId = credential.user?.uid ?? '';

    await secureStorageService.save(key: StorageKeys.kSession, value: userId);
    return true;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final userId = credential.user?.uid ?? '';

    await db.collection(ApiConstants.tUser).doc(userId).set(
        UserModel.fromEntity(
            entity: UserEntity(
                id: userId,
                name: name,
                email: email,
                password: password,
                movies: const [])).toJson());
    await secureStorageService.save(key: ApiConstants.tUser, value: userId);
    return true;
  }

  Future<UserModel> getCurrentUser() async {
    final userId = await secureStorageService.get(key: StorageKeys.kSession);

    final json = await db.collection(ApiConstants.tUser).doc(userId).get();

    final model = UserModel.fromJson(json: json.data() as Map<String, dynamic>);

    return model;
  }

  Future<void> updateCurrentUser(UserEntity userEntity) async {
    await db
        .collection(ApiConstants.tUser)
        .doc(userEntity.id)
        .update(UserModel.fromEntity(entity: userEntity).toJson());
  }
}
