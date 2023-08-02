import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:casaProvider/app/core/utils/images.dart';
import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/app/core/utils/text_styles.dart';
import 'package:casaProvider/app/localization/localization/language_constant.dart';
import 'package:casaProvider/components/custom_button.dart';
import 'package:casaProvider/features/reservations/provider/reservations_provider.dart';
import 'package:casaProvider/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'dart:ui' as ui;

import '../../../app/core/utils/svg_images.dart';
import '../../../components/custom_images.dart';

class CancellationDialog extends StatelessWidget {
  const CancellationDialog({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTranslated("are_you_want_to_cancel_your_appointment", context),
          style: AppTextStyles.semiBold
              .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 18),
        ),

        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL.h),
          child: SubstringHighlight(
            textAlign: TextAlign.center,
            text: getTranslated("confirm_cancel", context),
            term: getTranslated("cancellation_terms", context),
            textStyle: AppTextStyles.regular
                .copyWith(color: Styles.DISABLED, fontSize: 16),
            textStyleHighlight: AppTextStyles.semiBold
                .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 16),
          ),
        ),

        ///cancellation action
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
          child: Consumer<ReservationsProvider>(builder: (_, provider, child) {
            return CustomButton(
              text: getTranslated("yes_accept", context),
              onTap: () {
                if (id != null) {
                  provider.cancelReservation(id);
                }
              },
              isLoading: provider.isCancelling,
            );
          }),
        ),
        CustomButton(
          text: getTranslated("no_back_off", context),
          fIconWidget: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(100),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100)),
                child: customImageIconSVG(
                    imageName: SvgImages.arrowRight, color: Styles.WHITE_COLOR),
              ),
            ),
          ),
          iconSize: 12,
          iconColor: Styles.PRIMARY_COLOR,
          textColor: Styles.PRIMARY_COLOR,
          backgroundColor: Styles.SCAFFOLD_BG,
          onTap: () => CustomNavigator.pop(),
        ),
      ],
    );
  }
}

class CancelledDialog extends StatelessWidget {
  const CancelledDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customImageIcon(imageName: Images.sad, height: 110, width: 110),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          child: Text(
            getTranslated("session_cancelled", context),
            style: AppTextStyles.semiBold
                .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 18),
          ),
        ),
        CustomButton(
          text: getTranslated("back", context),
          fIconWidget: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(100),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100)),
                child: customImageIconSVG(
                    imageName: SvgImages.arrowRight, color: Styles.WHITE_COLOR),
              ),
            ),
          ),
          iconSize: 12,
          iconColor: Styles.PRIMARY_COLOR,
          textColor: Styles.PRIMARY_COLOR,
          backgroundColor: Styles.SCAFFOLD_BG,
          onTap: () => CustomNavigator.pop(),
        ),
      ],
    );
  }
}
