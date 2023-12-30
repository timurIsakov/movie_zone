import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String title;
  final String categoryId;

  const CategoryEntity({required this.title, required this.categoryId});
  @override
  List<Object?> get props => [
        title,
        categoryId,
      ];
}
