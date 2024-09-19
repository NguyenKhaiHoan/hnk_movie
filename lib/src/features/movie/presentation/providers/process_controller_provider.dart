import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/genre_with_image.dart';

final processControllerProvider =
    StateNotifierProvider<ProcessController, ProcessState>((ref) {
  return ProcessController();
});

class ProcessState {
  final List<GenreWithImage> genres;
  ProcessState({
    required this.genres,
  });

  ProcessState copyWith({
    List<GenreWithImage>? genres,
  }) {
    return ProcessState(genres: genres ?? this.genres);
  }
}

class ProcessController extends StateNotifier<ProcessState> {
  ProcessController() : super(ProcessState(genres: []));

  void addGenre(GenreWithImage genre) {
    state.genres.add(genre);
    state = state.copyWith(genres: state.genres);
  }

  void removeGenre(GenreWithImage genre) {
    state.genres.remove(genre);
    state = state.copyWith(genres: state.genres);
  }
}
