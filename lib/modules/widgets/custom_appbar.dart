  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/constants/asset_constants.dart';

import '../../constants/app_colors.dart';

AppBar customAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appPurple,
      title: Image.asset(
        AssetConstants.appbarLogo,
        height: 67.h,
        width: 226.w,
      ),
      actions: [
        Image.asset(AssetConstants.searchIcon, width: 50.w),
        const SizedBox(width: 32.0),
        Image.asset(AssetConstants.settingIcon, width: 50.w),
        const SizedBox(width: 32),
      ],
    );
  }
