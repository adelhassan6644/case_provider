import 'package:casaProvider/app/core/utils/svg_images.dart';
import 'package:casaProvider/components/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../provider/map_provider.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key, this.valueChanged}) : super(key: key);
  final Function(dynamic)? valueChanged;
  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(builder: (c, locationController, _) {
      return Container(
          height: 280.h,
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Styles.WHITE_COLOR,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 5.0,
                  spreadRadius: -1,
                  offset: const Offset(0, 6))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Center(
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                    color: Styles.BORDER_COLOR,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                child: Row(
                  children: [
                    customImageIconSVG(
                        imageName: SvgImages.location,
                        color: Styles.PRIMARY_COLOR,
                        height: 20,
                        width: 20),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      getTranslated("address", context),
                      style: AppTextStyles.medium
                          .copyWith(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Text(
                locationController.pickAddress,
                maxLines: 2,
                style: AppTextStyles.regular.copyWith(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13),
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ));
    });
  }
}

