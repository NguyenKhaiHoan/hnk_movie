import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/images_person_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_credits_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/person_detail.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_detail_person.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_images_person.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_movie_credits_person.dart';

final fetchDetailPersonProvider =
    FutureProvider.family<PersonDetail, PersonRequest>((ref, request) {
  var detailPersonUseCase = ref.read(getDetailPersonProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  return fetchDetailPerson(
      detailPersonUseCase, request.copyWith(language: language));
});

Future<PersonDetail> fetchDetailPerson(
    GetDetailPersonUseCase detailPerson, PersonRequest request) async {
  try {
    var dataState = await detailPerson.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!;
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchImagesPersonProvider =
    FutureProvider.family<List<Profile>, int>((ref, personId) {
  var imagesPersonUseCase = ref.read(getImagesPersonProvider);
  return fetchImagesPerson(imagesPersonUseCase, personId);
});

Future<List<Profile>> fetchImagesPerson(
    GetImagesPersonUseCase imagesPerson, int personId) async {
  try {
    var dataState = await imagesPerson.call(params: personId);
    if (dataState is DataSuccess) {
      return dataState.data!.profiles;
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchMovieCreditsPersonProvider =
    FutureProvider.family<List<CreditsCast>, PersonRequest>((ref, request) {
  var movieCreditsPersonUseCase = ref.read(getMovieCreditsPersonProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  return fetchMovieCreditsPerson(
      movieCreditsPersonUseCase, request.copyWith(language: language));
});

Future<List<CreditsCast>> fetchMovieCreditsPerson(
    GetMovieCreditsPersonUseCase movieCreditsPersonPerson,
    PersonRequest request) async {
  try {
    var dataState = await movieCreditsPersonPerson.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.cast;
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}
