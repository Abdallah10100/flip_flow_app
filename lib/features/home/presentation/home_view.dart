import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        if (cubit.isError) {
          state = state as HomeErrorState;
          return CustomGradiantContainer(
            child: CustomErrorWidget(
              text: state.message,
              onButtonPressed: () async {
                await cubit.initHomeData();
              },
            ),
          );
        }
        if (cubit.isLoading) {
          return const CustomGradiantContainer(child: CustomLoadingWidget());
        }
        return const CustomGradiantContainer(
            child: SafeArea(child: HomeViewBody()));
      },
    );
  }
}
