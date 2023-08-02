import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/svg_images.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../components/custom_images.dart';
import '../model/address_model.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {required this.addressItem, this.isSelect = false, Key? key, this.onTap})
      : super(key: key);
  final bool isSelect;
  final AddressItem addressItem;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
        ),
        child: Container(
          width: context.width,
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_SMALL.h,
              horizontal: Dimensions.PADDING_SIZE_SMALL.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.WHITE_COLOR,
              boxShadow: isSelect
                  ? [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(1, 1),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]
                  : null,
              border: Border.all(
                  color: isSelect ? Styles.PRIMARY_COLOR : Colors.transparent,
                  width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customImageIconSVG(
                    imageName: addressItem.type == 0
                        ? SvgImages.house
                        : SvgImages.buildings,
                    color: Styles.TITLE,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Text(
                        addressItem.type == 0 ? "عنوان البيت" : "عنوان اخر",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.medium
                            .copyWith(fontSize: 16, color: Styles.SUBTITLE)),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(addressItem.address ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular
                      .copyWith(fontSize: 14, color: Styles.TITLE)),
            ],
          ),
        ),
      ),
    );
  }
}
