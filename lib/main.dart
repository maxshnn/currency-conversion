import 'package:currency_conversion/presentation/resources/app_colors.dart';
import 'package:currency_conversion/presentation/screens/home/home_page.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setDependencyInjection();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency conversion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
