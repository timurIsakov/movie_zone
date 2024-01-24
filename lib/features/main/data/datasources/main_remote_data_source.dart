import 'package:movie_zone/core/api/api_client.dart';
import 'package:movie_zone/core/api/api_constants.dart';
import 'package:movie_zone/features/auth/data/models/user_model.dart';
import 'package:movie_zone/features/main/data/model/tv_result_model.dart';

import '../../../../core/api/firebase_api.dart';
import '../model/movie_result_model.dart';

abstract class MainRemoteDataSource {
  Future<MovieResultsModel> getMovie();
  Future<UserModel> getCurrentUser();
  Future<MovieResultsModel> getPopularMovies();
  Future<TvResultModel> getTvSeries();
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

  @override
  Future<MovieResultsModel> getPopularMovies() async {
    final response = await client.get(ApiConstants.popularMovies, {});
    final model = MovieResultsModel.fromJson(response);

    return model;
  }

  @override
  Future<TvResultModel> getTvSeries() async {
    final response = await client.get(ApiConstants.tv, {});

    final model = TvResultModel.fromJson(json: response);
    return model;
  }
}
