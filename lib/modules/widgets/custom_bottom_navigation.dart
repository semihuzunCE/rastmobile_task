 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/modules/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_constants.dart';
import '../../constants/asset_constants.dart';



  class CustomBottomNavigationBar extends StatelessWidget {
    const CustomBottomNavigationBar({super.key});
  
    @override
    Widget build(BuildContext context) {
      return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                return const Home();
              },));
            },
            icon: Image.asset(
              AssetConstants.homeIcon,
              height: 68.w,
              width: 68.w,
            ),
          ),
        ),
        BottomNavigationBarItem(
            label: "",
            icon: TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse(AppConstants.wordNinjaUrl));
              },
              child: Text(
                "Go To Word Ninja",
                style: AppConstants.defaultTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    color: Colors.black),
              ),
            )),
      ],
    );
    }
  }