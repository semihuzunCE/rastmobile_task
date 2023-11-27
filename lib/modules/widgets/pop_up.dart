import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rastmobile_task/bloc/home_bloc/home_bloc.dart';
import 'package:rastmobile_task/constants/app_colors.dart';
import 'package:rastmobile_task/constants/app_constants.dart';
import 'package:rastmobile_task/models/task.dart';

void showPopup(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const PopUp();
    },
  );
}

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  late String status;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController assigneeController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    status = "Backlog";
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    assigneeController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    assigneeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 1900.h,
      width: 920.w,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(ChangeButtonVisibility(visibility: true));
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.clear,
                        size: 32,
                      ))
                ],
              ),
              Text(
                "To Do",
                style: AppConstants.defaultTextStyle
                    .copyWith(fontSize: 48.r, fontWeight: FontWeight.bold),
              ),
              Card(
                  elevation: 3,
                  color: const Color(0xFFF2F2F2),
                  child: TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value != null && value.length > 1) {
                        return null;
                      } else {
                        return "This field cannot be empty.";
                      }
                    },
                    decoration: InputDecoration(
                        errorMaxLines: 1,
                        filled: true,
                        hintStyle: AppConstants.defaultTextStyle.copyWith(
                            color: const Color(0xFFB1B1B1), fontSize: 42.r),
                        hintText: "Title",
                        enabledBorder: InputBorder.none),
                  )),
              Card(
                  elevation: 3,
                  color: const Color(0xFFF2F2F2),
                  child: TextFormField(
                    controller: descriptionController,
                    validator: (value) {
                      if (value != null && value.length > 1) {
                        return null;
                      } else {
                        return "This field cannot be empty.";
                      }
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: AppConstants.defaultTextStyle.copyWith(
                            color: const Color(0xFFB1B1B1), fontSize: 42.r),
                        hintText: "Description",
                        enabledBorder: InputBorder.none),
                  )),
              Card(
                  elevation: 3,
                  color: const Color(0xFFF2F2F2),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      elevation: 0,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      underline: Container(
                        height: 0,
                      ),
                      style: AppConstants.defaultTextStyle.copyWith(
                          color: const Color(0xFFB1B1B1), fontSize: 42.r),
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Backlog",
                          child: Text("Backlog"),
                        ),
                        DropdownMenuItem<String>(
                          value: "To Do",
                          child: Text("To Do"),
                        ),
                        DropdownMenuItem<String>(
                          value: "In Progress",
                          child: Text("In Progress"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          status = value!;
                        });
                      },
                      value: status,
                    ),
                  )),
              Card(
                  elevation: 3,
                  color: const Color(0xFFF2F2F2),
                  child: TextFormField(
                    controller: assigneeController,
                    validator: (value) {
                      if (value != null && value.length > 1) {
                        return null;
                      } else {
                        return "This field cannot be empty.";
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: AppConstants.defaultTextStyle.copyWith(
                            color: const Color(0xFFB1B1B1), fontSize: 42.r),
                        hintText: "Assignee",
                        enabledBorder: InputBorder.none),
                  )),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appPurple),
                  onPressed: () {
                    setState(() {
                      formKey.currentState!.validate();
                    });
                    if (formKey.currentState!.validate() == true) {
                      context.read<HomeBloc>().add(AddTask(
                          task: Task(
                              title: titleController.text,
                              description: descriptionController.text,
                              status: status,
                              assignee: assigneeController.text)));
                              context
                            .read<HomeBloc>()
                            .add(ChangeButtonVisibility(visibility: true));
                              Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Save",
                    style: AppConstants.defaultTextStyle.copyWith(
                        fontSize: 38.r,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    ));
  }
}
