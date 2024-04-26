import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:themed/themed.dart';

class NewWorkoutImageWidget extends StatelessWidget {
  const NewWorkoutImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s12)),
      child: ChangeColors(
        brightness: -0.12,
        child: CustomNetworkImage(imageUrl: imageUrl),
      ),
    );
  }
}
