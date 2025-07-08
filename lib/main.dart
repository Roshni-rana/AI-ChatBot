import 'package:AIChatBot/feature/bottom_nav_bar/bloc/bottom_nav_bloc.dart';
import 'package:AIChatBot/feature/splash/bloc/splash_bloc.dart';
import 'package:AIChatBot/firebase_options.dart';
import 'package:AIChatBot/routes/page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => BottomNavBloc()),
      ],
      child: MaterialApp.router(
        title: 'AI Chat-Bot',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        // home: CurvedBottomNavBar(),
      ),
    );
  }
}
