import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/features/centers/presentation/views/centers_view.dart';
import 'package:flipflow_app/features/home/presentation/home_view.dart';
import 'package:flipflow_app/features/profile/presentation/views/profile_view.dart';
import 'package:flipflow_app/features/workouts/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';

class LayoutController extends ChangeNotifier {
  int _currnetIndex = 0;

  Widget getScreen() {
    switch (_currnetIndex) {
      case 0:
        return const HomeView();
      case 1:
        ServiceLocator.setupWorkoutsModule();
        return const WorkoutView();
      case 2:
        ServiceLocator.setupCentersModule();
        return const CentersView();
      default:
        ServiceLocator.setupProfileModule();
        return const ProfileView();
    }
  }

  void setIndex(index) {
    _currnetIndex = index;
    notifyListeners();
  }

  void clear() {
    _currnetIndex = 0;
    notifyListeners();
  }

  int get index => _currnetIndex;
}
