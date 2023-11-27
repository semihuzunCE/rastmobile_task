import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/bloc/home_bloc/home_bloc.dart';
import 'package:rastmobile_task/constants/app_colors.dart';
import 'package:rastmobile_task/constants/app_constants.dart';
import 'package:rastmobile_task/enums/app_state.dart';
import 'package:rastmobile_task/enums/card_list_type.dart';
import 'package:rastmobile_task/modules/widgets/pop_up.dart';
import 'package:rastmobile_task/modules/widgets/card_list.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/refactor_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          HomeBloc homeBloc = context.read<HomeBloc>();
          return Visibility(
            visible: context.read<HomeBloc>().state.floatingButtonIsVisible,
            child: FloatingActionButton(
              backgroundColor: AppColors.appPurple,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                homeBloc.add(ChangeButtonVisibility(visibility: false));
                showPopup(context);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0),
          child: BlocBuilder<HomeBloc, HomeState>(
           
            builder: (context, state) {
              HomeBloc homeBloc = context.read<HomeBloc>();
             

              if (context.watch<HomeBloc>().state.appState == AppState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(children: [
                  const RefactorRow(),
                  listHeadlineRow(
                      text: "Backlog", count: homeBloc.state.backlog.length),
                  const CardList(listType: ListType.backlog),
                  listHeadlineRow(
                      text: "To Do", count: homeBloc.state.toDO.length),
                  const CardList(listType: ListType.todo),
                  listHeadlineRow(
                      text: "In Progress",
                      count: homeBloc.state.inProgress.length),
                  const CardList(listType: ListType.inprogress),
                  listHeadlineRow(
                      text: "Last Tasks",
                      count: homeBloc.state.lastTasks.length),
                  const CardList(listType: ListType.lasttasks),
                ]);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget listHeadlineRow({required String text, required int count}) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
      child: Row(
        children: [
          Text(
            text,
            style: AppConstants.defaultTextStyle
                .copyWith(fontSize: 39.r, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Text(
            count.toString(),
            style: AppConstants.defaultTextStyle
                .copyWith(fontSize: 45.r, color: AppColors.countTextColor),
          )
        ],
      ),
    );
  }
}
