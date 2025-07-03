import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practices/feature/splash/splash/splash_bloc.dart';

import 'core/routes/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SplashBloc())],
      child: MaterialApp.router(
        title: 'AI Chat-Boat',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        // home: SplashScreen(),
      ),
    );
  }
}
