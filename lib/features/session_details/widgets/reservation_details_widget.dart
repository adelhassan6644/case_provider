import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:casaProvider/app/localization/localization/language_constant.dart';
import 'package:casaProvider/features/session_details/widgets/payment_status.dart';
import 'package:casaProvider/main_models/item_model.dart';
import 'package:flutter/material.dart';
import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/svg_images.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../components/custom_images.dart';
import '../../../components/custom_network_image.dart';

class SessionDetailsWidget extends StatelessWidget {
  final ItemModel model;
  const SessionDetailsWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage.containerNewWorkImage(
                image: model.image ?? "",
                width: context.width,
                fit: BoxFit.fitWidth,
                height: 250.h,
                radius: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Session Name
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${getTranslated("session", context)} ${model.service}",
                          style: AppTextStyles.bold.copyWith(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                              color: Styles.PRIMARY_COLOR),
                          maxLines: 1,
                        ),
                      ),
                      PaymentStatus(
                        paid: model.paymentStatus == true,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),

                  ///Location
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(getTranslated("address", context),
                        style: AppTextStyles.semiBold.copyWith(
                            height: 1, fontSize: 18, color: Styles.TITLE)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Row(
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
                              model.address ?? "sdfw",
                              style: AppTextStyles.medium
                                  .copyWith(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///Date
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text("الموعد",
                        style: AppTextStyles.semiBold.copyWith(
                            height: 1, fontSize: 18, color: Styles.TITLE)),
                  ),
                  Row(
                    children: [
                      Text("اليوم  ",
                          style: AppTextStyles.regular.copyWith(
                              height: 1,
                              fontSize: 14,
                              color: Styles.DETAILS_COLOR)),
                      Expanded(
                        child: Text(model.date!.dateFormat(format: "EEEE dd/MM"),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium.copyWith(
                                height: 1, fontSize: 16, color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text("الساعة  ",
                          style: AppTextStyles.regular.copyWith(
                              height: 1,
                              fontSize: 14,
                              color: Styles.DETAILS_COLOR)),
                      Expanded(
                        child: Text(model.date!.dateFormat(format: "hh:mm aa"),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium.copyWith(
                                height: 1, fontSize: 16, color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
