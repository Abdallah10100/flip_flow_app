import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/workout_details_widget.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/workout_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewWorkoutItemWidget extends StatelessWidget {
  const NewWorkoutItemWidget({super.key, required this.entity});

  final WorkoutEntity entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.workoutDetails, extra: entity);
      },
      child: Card(
        elevation: 3,
        shadowColor: ColorManager.lightGrey,
        child: Stack(
          children: [
            NewWorkoutImageWidget(
              imageUrl: entity.imageUrl,
            ),
            NewWorkoutDetailsWidget(
                exerciseName: entity.name.toUpperCase(),
                exerciseTime: entity.minutes.toString(),
                exercisesNumber: entity.numberOfExercises.toString()),
          ],
        ),
      ),
    );
  }
}
