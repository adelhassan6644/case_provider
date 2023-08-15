import 'package:casaProvider/main_models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/app/core/utils/dimensions.dart';
import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/svg_images.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../components/custom_images.dart';
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
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () =>
            CustomNavigator.push(Routes.SESSION_DETAILS, arguments: product.id),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Styles.WHITE_COLOR,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomNetworkImage.containerNewWorkImage(
                image: product.image ?? "",
                height: 80.h,
                width: 100.w,
                fit: BoxFit.cover,
                radius: 12.w,
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${product.service}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.semiBold.copyWith(
                            fontSize: 14, color: Styles.PRIMARY_COLOR)),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text("${product.subService}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.medium
                            .copyWith(fontSize: 14, color: Styles.SUBTITLE)),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customImageIconSVG(
                            imageName: SvgImages.location,
                            height: 20,
                            width: 20,
                            color: Styles.DETAILS_COLOR),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Text(
                            product.address ?? "",
                            maxLines: 1,
                            style: AppTextStyles.medium.copyWith(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
