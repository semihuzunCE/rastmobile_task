import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/constants/app_colors.dart';
import 'package:rastmobile_task/constants/app_constants.dart';
import 'package:rastmobile_task/constants/asset_constants.dart';
import 'package:rastmobile_task/modules/home/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: AppConstants.splashTimeout)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 280.h,
                        height: 250.h,
                        decoration: BoxDecoration(
                            color: AppColors.appPurple,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(24))),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 280.h,
                        height: 554.h,
                        decoration: BoxDecoration(
                            color: AppColors.appPurple,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(24),
                              topRight: Radius.circular(24),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      height: 250.h,
                      decoration: BoxDecoration(
                          color: AppColors.appPurple,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    AssetConstants.splashLogo,
                    height: 133.h,
                    width: 450.w,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Image.asset(
                    AssetConstants.buildFuture,
                    height: 87.h,
                    width: 619.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      height: 250.h,
                      decoration: BoxDecoration(
                          color: AppColors.appPurple,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 280.h,
                        height: 554.h,
                        decoration: BoxDecoration(
                            color: AppColors.appPurple,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              topLeft: Radius.circular(24),
                            )),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: 280.h,
                        height: 250.h,
                        decoration: BoxDecoration(
                            color: AppColors.appPurple,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24))),
                      ),
                    ],
                  )
                ],
              )
            ],
          ));
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Home()),
            );
          });
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
