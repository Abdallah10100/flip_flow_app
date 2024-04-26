import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerStatsWidget extends StatelessWidget {
  const PlayerStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16, vertical: AppPadding.p8),
                    decoration: const BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s12))),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsManager.trophyIcon,
                          height: AppSize.s30,
                          width: AppSize.s30,
                        ),
                        const SizedBox(
                          width: AppSize.s22,
                        ),
                        Text(
                          '${cubit.userEntity!.score}',
                          style: StylesManager.semiBold24,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p16, vertical: AppPadding.p8),
                      decoration: const BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius:
                              BorderRadius.all(Radius.circular(AppSize.s12))),
                      child: Row(children: [
                        SvgPicture.asset(
                          AssetsManager.ageIcon,
                          height: AppSize.s30,
                          width: AppSize.s30,
                        ),
                        const SizedBox(
                          width: AppSize.s22,
                        ),
                        Text(
                          cubit.userEntity!.age.toString(),
                          style: StylesManager.semiBold24,
                        )
                      ])),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
