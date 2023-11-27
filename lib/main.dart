import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rastmobile_task/bloc/home_bloc/home_bloc.dart';
import 'package:rastmobile_task/commons/app_context.dart';
import 'package:rastmobile_task/modules/splash/splash.dart';
import 'package:rastmobile_task/repository/hive_repository.dart';

void main() async {
  await HiveRepository().initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 2400));
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(GetAllTasks()),
      child: MaterialApp(
        builder: FToastBuilder(),
        navigatorKey: AppContext.navigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
