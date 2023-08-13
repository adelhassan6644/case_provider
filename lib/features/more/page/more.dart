import 'package:casaProvider/components/animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:casaProvider/features/more/widgets/logout_button.dart';
import 'package:casaProvider/navigation/custom_navigation.dart';
import 'package:casaProvider/navigation/routes.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/svg_images.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../main_page/provider/main_page_provider.dart';
import '../widgets/more_button.dart';
import '../widgets/profile_card.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(builder: (_, provider, child) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            Dimensions.PADDING_SIZE_DEFAULT,
            (Dimensions.PADDING_SIZE_DEFAULT + context.toPadding),
            Dimensions.PADDING_SIZE_DEFAULT,
            Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            Expanded(
              child: ListAnimator(
                data: [
                  const ProfileCard(),
                  MoreButton(
                    title: getTranslated("notifications", context),
                    icon: SvgImages.notifications,
                    onTap: () => CustomNavigator.push(Routes.NOTIFICATIONS),
                  ),
                  MoreButton(
                    title: getTranslated("change_password", context),
                    icon: SvgImages.outlineLockIcon,
                    onTap: () => CustomNavigator.push(Routes.CHANGE_PASSWORD),
                  ),
                  MoreButton(
                    title: getTranslated("contact_with_us", context),
                    icon: SvgImages.outlineMailIcon,
                    onTap: () => CustomNavigator.push(Routes.ABOUT_US),
                  ),
                  MoreButton(
                    title: getTranslated("terms_conditions", context),
                    icon: SvgImages.file,
                    onTap: () => CustomNavigator.push(Routes.TERMS),
                  ),
                  const LogoutButton(),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
