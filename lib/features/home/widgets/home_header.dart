import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:casaProvider/app/core/utils/svg_images.dart';
import 'package:casaProvider/app/localization/localization/language_constant.dart';
import 'package:casaProvider/components/custom_images.dart';
import 'package:casaProvider/components/shimmer/custom_shimmer.dart';
import 'package:casaProvider/features/home/provider/home_provider.dart';
import 'package:casaProvider/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:casaProvider/app/core/utils/text_styles.dart';
import 'package:provider/provider.dart';
import '../../../components/marquee_widget.dart';
import '../../../components/tab_widget.dart';
import '../../../data/config/di.dart';
import '../../../navigation/routes.dart';
import '../../maps/provider/map_provider.dart';
import '../../notifications/provider/notifications_provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  getTranslated("welcome_description", context),
                  style: AppTextStyles.medium.copyWith(
                      height: 2, fontSize: 22, color: Styles.PRIMARY_COLOR),
                ),
              ),
              const Expanded(child: SizedBox()),
              customContainerSvgIcon(
                  imageName: SvgImages.notifications,
                  radius: 100,
                  height: 45,
                  width: 45,
                  onTap: () {
                    sl<NotificationsProvider>().getNotifications();
                    CustomNavigator.push(Routes.NOTIFICATIONS);
                  })
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Consumer<HomeProvider>(builder: (_, provider, child) {
            return Text(
              "${getTranslated("your_upcoming_appointments", context)} (${provider.sessions.isEmpty ? "..." : provider.sessions.length})",
              style: AppTextStyles.medium
                  .copyWith(fontSize: 18, color: Styles.PRIMARY_COLOR),
            );
          }),
        ],
      ),
    );
  }
}
