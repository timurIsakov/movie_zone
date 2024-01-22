import 'package:movie_zone/core/api/api_client.dart';
import 'package:movie_zone/core/api/constants/api_constants.dart';
import 'package:movie_zone/features/auth/data/models/user_model.dart';

import '../../../../core/api/firebase_api.dart';
import '../model/movie_result_model.dart';

abstract class MainRemoteDataSource {
  Future<MovieResultsModel> getMovie();
  Future<UserModel> getCurrentUser();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;
  final FirebaseApi firebaseApi;

  MainRemoteDataSourceImpl(this.client, this.firebaseApi);
  @override
  Future<MovieResultsModel> getMovie() async {
    final response = await client.get(ApiConstants.movies, {});
    final model = MovieResultsModel.fromJson(response);

    return model;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await firebaseApi.getCurrentUser();

    return response;
  }
}
