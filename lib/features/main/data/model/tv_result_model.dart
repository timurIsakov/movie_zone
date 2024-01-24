import 'package:movie_zone/features/main/data/model/tv_model.dart';
import 'package:movie_zone/features/main/domain/entities/tv_result_entity.dart';

class TvResultModel extends TvResultEntity {
  TvResultModel({required super.series});

  factory TvResultModel.fromJson({required Map<String, dynamic> json}) {
    return TvResultModel(
        series: List.from(json['results'])
            .map((e) => TvModel.fromJson(json: e))
            .toList());
  }
}
