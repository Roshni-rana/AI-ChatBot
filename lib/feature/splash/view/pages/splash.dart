import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:practices/core/app_theme/app_colors.dart';
import 'package:practices/feature/splash/splash/splash_bloc.dart';
import 'package:practices/feature/splash/view/widget/bounce_image_widget.dart';
import 'package:practices/generated/assets.dart';

import '../../../../core/routes/route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplashEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashFinished) {
            context.goNamed(AppRoutes.intro.name);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Text(
                      "Hey there!\nI'm your AI buddy 👋",
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 400,
                    child: Image.asset(
                      Assets.iconsBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: BounceImage(imagePath: Assets.iconsAiImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
