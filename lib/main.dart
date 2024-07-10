import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:todoapp/Cubit/cubit.dart';
import 'package:todoapp/Database/database';
import 'package:todoapp/pages/homepage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseTask.intialdata();
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitTasks()..GetData(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
