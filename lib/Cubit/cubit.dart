import 'package:todoapp/Cubit/cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:todoapp/Database/tasks.dart';
import 'package:todoapp/Database/database';

class cubitTasks extends Cubit<CubitStates> {
  cubitTasks() : super(IntialTasks());
  static cubitTasks get(context) => BlocProvider.of(context);
  List<tasks> myTasks = [];

  Future<void> GetData() async {
    emit(GetDataLoadin());
    myTasks = [];
    DatabaseTask.takeData().then((value) {
      value.forEach((element) {
        tasks task = tasks.fromMap(element);

        myTasks.add(task);
      });
      emit(GetDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataError());
    });
  }

  void checkBox({required bool value, required int index}) {
    myTasks[index].finish = !myTasks[index].finish!;

    emit(CheckBoxState());
  }

  void insertTasks({
    required String title,
    required String description,
    required String data,
    required String time,
  }) async {
    await DatabaseTask.insertData(
            title: title,
            description: description,
            data: data,
            time: time,
            finish: 0)
        .then((value) {
      GetData();
    });
  }

  void UpdateData({
    required String title,
    required String description,
    required String data,
    required String time,
    required int id,
  }) async {
    await DatabaseTask.updatData(
            title: title,
            description: description,
            data: data,
            time: time,
            id: id,
            finish: 0)
        .then((value) {
      GetData();
    
    });
  }
}
