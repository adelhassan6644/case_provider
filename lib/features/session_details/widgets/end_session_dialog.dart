import 'package:casaProvider/app/core/utils/images.dart';
import 'package:casaProvider/app/localization/localization/language_constant.dart';
import 'package:casaProvider/components/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../components/back_icon.dart';
import '../../../components/custom_button.dart';
import '../../../navigation/custom_navigation.dart';
import '../provider/session_details_provider.dart';

class EndSessionDialog extends StatelessWidget {
  const EndSessionDialog({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customImageIcon(imageName: Images.alert, width: 100, height: 100),

        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
          child: Text(
            getTranslated("are_you_sure_to_end_the_session", context),
            style: AppTextStyles.semiBold
                .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 18),
          ),
        ),

        ///end action
        Row(
          children: [
            Expanded(
              child: Consumer<SessionDetailsProvider>(
                  builder: (_, provider, child) {
                return CustomButton(
                  text: getTranslated("yes_end", context),
                  onTap: () {
                    if (id != null) {
                      provider.endSession(id);
                    }
                  },
                  isLoading: provider.isEnding,
                );
              }),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: CustomButton(
                text: getTranslated("no_back_off", context),
                textColor: Styles.PRIMARY_COLOR,
                backgroundColor: Styles.SCAFFOLD_BG,
                onTap: () => CustomNavigator.pop(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
