import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/constants/app_colors.dart';
import 'package:rastmobile_task/constants/app_constants.dart';
import 'package:rastmobile_task/constants/asset_constants.dart';
import 'package:rastmobile_task/models/task.dart';
import 'package:rastmobile_task/modules/widgets/custom_appbar.dart';
import 'package:rastmobile_task/modules/widgets/custom_bottom_navigation.dart';
import 'package:rastmobile_task/modules/widgets/refactor_row.dart';

class Detail extends StatelessWidget {
  final Task task;
  const Detail({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            const RefactorRow(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24.0),
                    Text(
                      task.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppConstants.defaultTextStyle.copyWith(
                          fontSize: 75.r, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AssetConstants.profileLogo,
                          height: 120.h,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Reported by ",
                              style: AppConstants.defaultTextStyle.copyWith(
                                color: const Color(0xFFA5A5A5),
                                fontSize: 38.r,
                              ),
                            ),
                            Text(
                              "Project Manager",
                              style: AppConstants.defaultTextStyle.copyWith(
                                  color: const Color(0xFF0D0D0D),
                                  fontSize: 38.r,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: 200.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        color: AppColors.appPurple,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(86)),
                      ),
                      child: Center(
                        child: Text(
                          task.status,
                          style: AppConstants.defaultTextStyle.copyWith(
                              fontSize: 40.r,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "Description",
                      style: AppConstants.defaultTextStyle
                          .copyWith(color: const Color(0xFFA5A5A5)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 8.0,
                        ),
                        child: Text(
                          task.description,
                          style: AppConstants.defaultTextStyle.copyWith(
                              fontSize: 45.r, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
