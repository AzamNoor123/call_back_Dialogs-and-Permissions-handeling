import 'package:flutter/material.dart';
import 'package:task_5_callbacks_dialogs/Views/Home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_5_callbacks_dialogs/helper/string_resources.dart';
import 'URL_Lancher/bloc/url_lancher_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UrlLancherBloc(),
      child: MaterialApp(
          title: StringResources.TaskName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen()),
    );
  }
}
