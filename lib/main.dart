import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:multiple_repository/data/di/app_locator_impl.dart';

import 'package:multiple_repository/presentation/repository_list/repository_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      title: 'Multiple Repository',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const RepositoryListScreen(),
    );
  }
}
