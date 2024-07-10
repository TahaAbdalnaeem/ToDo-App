import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Cubit/cubit.dart';
import 'package:todoapp/Cubit/cubit_states.dart';

class SecondePage extends StatelessWidget {
  
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitTasks, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubitTasks cubit = cubitTasks.get(context);
        return Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                    onPressed: () {
                      cubit.insertTasks(
                        title: titleController.text,
                        description: descriptionController.text,
                        data: dateController.text,
                        time: timeController.text,
                      );
                    },
                    icon: Icon(
                      Icons.add_task,
                      size: 30,
                      color: Colors.black,
                    )),
              )
            ],
            backgroundColor: Colors.yellow,
            title: Text(
              'Add New Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          body: ListView(
            children: [
              Text(
                "lets's Add your Tasks",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 125),
                child: Text(
                  'From Here :',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.title,
                      size: 30,
                    ),
                    label: Text(
                      "title",
                      style: TextStyle(fontSize: 18),
                    ),
                    hintText: 'title',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.description,
                      size: 30,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    label: Text(
                      "Description",
                      style: TextStyle(fontSize: 18),
                    ),
                    hintText: 'description',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.date_range,
                      size: 30,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    label: Text(
                      "Data",
                      style: TextStyle(fontSize: 18),
                    ),
                    hintText: 'date',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    label: Text(
                      "Time",
                      style: TextStyle(fontSize: 18),
                    ),
                    hintText: 'time',
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Icons.hourglass_bottom),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
