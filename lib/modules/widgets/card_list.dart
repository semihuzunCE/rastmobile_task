import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/bloc/home_bloc/home_bloc.dart';
import 'package:rastmobile_task/enums/card_list_type.dart';
import 'package:rastmobile_task/models/task.dart';
import 'package:rastmobile_task/modules/detail/detail.dart';
import '../../constants/app_constants.dart';
import '../../constants/asset_constants.dart';

class CardList extends StatelessWidget {
  final ListType listType;
  const CardList({super.key, required this.listType});

  @override
  Widget build(BuildContext context) {
    List<Task> currentTaskList;
    return SizedBox(
      height: 650.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (listType) {
            case ListType.backlog:
              currentTaskList = context.read<HomeBloc>().state.backlog;
              break;
            case ListType.todo:
              currentTaskList = context.read<HomeBloc>().state.toDO;
              break;
            case ListType.inprogress:
              currentTaskList = context.watch<HomeBloc>().state.inProgress;
            case ListType.lasttasks:
              currentTaskList = context.watch<HomeBloc>().state.lastTasks;
              break;
          }

          return ListView.builder(
            itemCount: currentTaskList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    bottom: 16.0,
                  ),
                  child: SizedBox(
                    height: 460.h,
                    width: 905.w,
                    child: GestureDetector(
                      onTap: () {
                        
                          if(listType!=ListType.lasttasks){
                            context.read<HomeBloc>().add(AddLastTask(task: currentTaskList[index]));
                          }


                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Detail(
                              task: currentTaskList[index],
                            );
                          },
                        ));
                      },
                      child: customCard(currentTaskList[index]),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }

  Card customCard(Task task) {
    return Card(
        color: Colors.white,
        elevation: 2,
        child: Stack(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  task.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.defaultTextStyle
                      .copyWith(fontSize: 52.r, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppConstants.defaultTextStyle.copyWith(
                      fontSize: 39.r,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16.0,
              bottom: 16.0,
              child: Image.asset(
                AssetConstants.profileLogo,
                height: 120.h,
              ),
            )
          ],
        ));
  }
}
