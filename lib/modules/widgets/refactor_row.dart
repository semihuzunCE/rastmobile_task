import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/asset_constants.dart';

class RefactorRow extends StatelessWidget {
  const RefactorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: AppColors.refactorLogoBackground,
          ),
          width: 114.w,
          height: 108.h,
          child: Image.asset(
            AssetConstants.refactorLogo,
            width: 91.h,
            height: 61.h,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Refactoring for Word Ninja",
              style: AppConstants.defaultTextStyle.copyWith(
                  fontSize: 39.r, fontWeight: FontWeight.bold),
            ),
            Text(
              "New project for refactoring our app Word ninja",
              style: AppConstants.defaultTextStyle
                  .copyWith(fontSize: 27.r),
            ),
          ],
        )
      ],
    );
  }
}