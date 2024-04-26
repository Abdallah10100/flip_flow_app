import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/payment_done/payment_congrats_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/payment_done/payment_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentDoneViewBody extends StatelessWidget {
  const PaymentDoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PaymentCongratsWidget(),
              const SizedBox(
                height: AppSize.s30,
              ),
              const PaymentDetailsWidget(),
              const SizedBox(
                height: AppSize.s40,
              ),
              CustomButtonWidget(
                buttonText: AppStrings.done,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
