import 'package:casaProvider/main_models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:casaProvider/app/core/utils/extensions.dart';
import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../components/custom_network_image.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';

class HomeSessionsCard extends StatelessWidget {
  const HomeSessionsCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ItemModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          CustomNavigator.push(Routes.SESSION_DETAILS, arguments: product.id),
      child: Container(
        width: 210.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Styles.WHITE_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomNetworkImage.containerNewWorkImage(
              image: product.image ?? "",
              height: 100.h,
              width: context.width,
              fit: BoxFit.cover,
              radius: 12.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${product.service}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.semiBold
                          .copyWith(fontSize: 14, color: Styles.PRIMARY_COLOR)),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text("${product.service}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular.copyWith(
                          height: 1,
                          fontSize: 14,
                          color: Styles.DETAILS_COLOR)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
