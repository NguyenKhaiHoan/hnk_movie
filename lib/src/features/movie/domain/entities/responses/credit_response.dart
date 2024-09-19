import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/cast.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/crew.dart';

part 'credit_response.freezed.dart';
part 'credit_response.g.dart';

@freezed
class CreditResponse with _$CreditResponse {
  factory CreditResponse({
    required int id,
    required List<Cast> cast,
    required List<Crew> crew,
  }) = _CreditResponse;

  factory CreditResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditResponseFromJson(json);
}
