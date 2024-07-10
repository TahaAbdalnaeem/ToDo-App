import 'package:flutter/material.dart';
import 'package:todoapp/Cubit/cubit.dart';
import 'package:todoapp/Cubit/cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatPage extends StatelessWidget {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cubitTasks cubit = cubitTasks.get(context);
    titleController.text = cubit.myTasks[0].title!;
    descriptionController.text = cubit.myTasks[0].description!;
    dateController.text = cubit.myTasks[0].data!;
    timeController.text = cubit.myTasks[0].time!;
    return BlocConsumer<cubitTasks, CubitStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Text(
              'Update your task',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                color: Colors.black,
                iconSize: 30,
                onPressed: () {
                  cubit.UpdateData(
                      title: cubit.myTasks[0].title!,
                      description: cubit.myTasks[0].description!,
                      data: cubit.myTasks[0].data!,
                      time: cubit.myTasks[0].time!,
                      id: cubit.myTasks[0].id!);
                },
                icon: Icon(Icons.save),
              ),
            ],
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(40)),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 400,
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        hintText: 'Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        hintText: 'Time',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
