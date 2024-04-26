import 'dart:developer';

import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';
import 'package:flipflow_app/features/workouts/domain/usecases/update_user_workout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
part 'exercise_details_state.dart';

class ExerciseDetailsCubit extends Cubit<ExerciseDetailsState> {
  CachedVideoPlayerPlusController? _controller;

  ExerciseDetailsCubit(this._updateUserWorkoutUseCase,
      this._exerciseEntityIndex, this._exercises)
      : super(ExerciseDetailsInitial());

  final UpdateUserWorkoutUseCase _updateUserWorkoutUseCase;

  int _exerciseEntityIndex;
  final List<ExerciseEntity>? _exercises;
  Future<void> loadVideo(String url) async {
    emit(LoadVideoLoadingState());
    _controller = CachedVideoPlayerPlusController.networkUrl(Uri.parse(url));
    log(_controller?.dataSource.toString() ?? '');
    try {
      await _controller?.initialize();
      _controller?.setLooping(true);
      _controller?.play();
      emit(LoadVideoSuccessState());
    } catch (error) {
      emit(LoadVideoErrorState(error.toString()));
    }
  }

  List<ExerciseEntity>? get exercises => _exercises;

  void pausePlayVideo() async {
    if (isVideoPlaying) {
      _controller?.pause();
    } else {
      _controller?.play();
    }
    emit(ChangeVideoStatusState());
  }

  void goNext(String workoutId) async {
    if (_exerciseEntityIndex < exercises!.length - 1) {
      _exerciseEntityIndex++;
      _controller = null;
      await loadVideo(exercises![_exerciseEntityIndex].videoUrl);
    }
    await setUserDoneExercise(workoutId);
  }

  Future<void> setUserDoneExercise(String workoutId) async {
    final user = ServiceLocator.get<UserEntity>();
    final model = UpdateUserWorkoutInput(
        userId: user.uid!,
        workoutId: workoutId,
        exerciseId: exercises![_exerciseEntityIndex].uid,
        isWorkoutDone: _exerciseEntityIndex == exercises!.length - 1);
    final result = await _updateUserWorkoutUseCase.execute(model);
    if (result.isLeft()) {
      emit(ExerciseDoneErrorState(result.failure.message));
    }
  }

  void goPrevious() {
    if (_exerciseEntityIndex > 0) {
      _exerciseEntityIndex--;
      _controller = null;
      loadVideo(exercises![_exerciseEntityIndex].videoUrl);
    }
  }

  CachedVideoPlayerPlusController? get controller => _controller;

  bool get isVideoPlaying => _controller?.value.isPlaying ?? false;

  int get exerciseEntityIndex => _exerciseEntityIndex;

  void setExerciseEntityIndex(int index) {
    _exerciseEntityIndex = index;
    emit(ExerciseChangedState());
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
