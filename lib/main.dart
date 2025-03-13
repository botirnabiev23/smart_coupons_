import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_coupons/pages/splash/splash_page.dart';
import 'db/app_database.dart';
import 'db/dao/category_dao.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase appDatabase = AppDatabase();
  final CategoryDao categoryDao = CategoryDao(appDatabase);

  runApp(
    MyApp(
      categoryDao: categoryDao,
    ),
  );
}

class MyApp extends StatelessWidget {
  final CategoryDao categoryDao;

  const MyApp({
    super.key,
    required this.categoryDao,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryDao),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black),
          ),
          colorScheme: ColorScheme.light(
            primary: Colors.black,
            onPrimary: Colors.white,
          ),
        ),
        title: 'Smart Coupons',
        home: const SplashPage(),
      ),
    );
  }
}
