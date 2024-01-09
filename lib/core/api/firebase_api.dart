import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_zone/core/api/constants/firebase_collections_constants.dart';
import 'package:movie_zone/core/api/local_secure_api.dart';
import 'package:movie_zone/core/api/constants/local_keys_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';

class FirebaseApi {
  final LocalSecureApi localSecureApi;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseApi({required this.localSecureApi});

    signUp(
      {required String email,
      required String password,
      required String name}) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("Credential -> $credential");
    final userId = credential.user?.uid ?? "";
    print("User id -> $userId");
    localSecureApi.save(key: LocalKeysConstants.tUserId, value: userId);
await    _addUser(
        collection: FirebaseCollectionsConstants.tUser,
        entity: UserEntity(
            id: userId,
            name: name,
            email: email,
            password: password,
            movies: const []));
  }

    signIn({required String email, required String password}) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print("Sign in $credential");
  }

    _addUser(
      {required String collection, required UserEntity entity}) async {
    await _firestore
        .collection(collection)
        .doc(entity.id)
        .set(UserModel.fromEntity(entity: entity).toJson());
  }
}
