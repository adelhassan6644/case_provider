import 'package:flutter/cupertino.dart';
import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/features/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../app/core/utils/text_styles.dart';
import '../../profile/widgets/profile_image_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (_, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              ProfileImageWidget(
                withEdit: false,
                withPadding: false,
                radius: 35,
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            provider.isLogin ? provider.nameTEC.text.trim() : "Guest",
            style: AppTextStyles.medium
                .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 16, height: 1),
          ),
          Text(
            provider.isLogin
                ? provider.emailTEC.text.trim()
                : "elhemdanih@casaProvider.com",
            style: AppTextStyles.regular
                .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 14),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      );
    });
  }
}
