import 'package:equatable/equatable.dart';

class RecommendedMovie extends Equatable {
  final int? id;
  final String? backdropPath;

  const RecommendedMovie({this.id, this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}
