import 'package:flutter/material.dart';
import 'package:todoapp/Cubit/cubit.dart';
import 'package:todoapp/Cubit/cubit_states.dart';
import 'package:todoapp/Database/database';
import 'package:todoapp/pages/Update_Page.dart';
import 'package:todoapp/pages/secondpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cubitTasks cubit = cubitTasks.get(context);
    return BlocConsumer<cubitTasks, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff0d383d),
          appBar: AppBar(
            backgroundColor: Color(0xFF0d383d),
            title: Text(
              "Tasks ${cubit.myTasks.length}",
              style: TextStyle(fontSize: 24),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.notification_add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdatPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Checkbox(
                                value: cubit.myTasks[index].finish,
                                onChanged: (value) {
                                  cubit.checkBox(value: value!, index: index);
                                },
                                checkColor: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                '${cubit.myTasks[index].title}',
                                style: TextStyle(
                                  fontSize: 26,
                                  decoration: cubit.myTasks[index].finish!
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                            ),
                            Spacer(),
                            PopupMenuButton(
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: TextButton.icon(
                                            onPressed: null,
                                            icon: Icon(Icons.bookmark),
                                            label: const Text("Favorit")),
                                        onTap: () {},
                                      ),
                                      PopupMenuItem(
                                        child: TextButton.icon(
                                          onPressed: null,
                                          icon: Icon(Icons.delete),
                                          label: const Text("DElete"),
                                        ),
                                        onTap: () async {
                                          await DatabaseTask.deleteData(
                                              id: cubit
                                                  .myTasks[index].id!); //BOUNS
                                          cubit.GetData();
                                        },
                                      ),
                                    ]),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text('${cubit.myTasks[index].data}'),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                '${cubit.myTasks[index].time}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: cubit.myTasks.length,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondePage();
              }));
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
