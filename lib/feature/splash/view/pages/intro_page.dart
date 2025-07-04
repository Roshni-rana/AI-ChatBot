import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practices/core/app_theme/app_colors.dart';
import 'package:practices/core/app_widgets/app_button.dart';
import 'package:practices/core/routes/route.dart';
import 'package:practices/generated/assets.dart';
import 'package:practices/utilies/sizedbox_extension.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.iconsAiImage,
                    height: 300,
                    width: 300,
                  ),
                ),

                Positioned(
                  bottom: -120,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(Assets.iconsAiHandicons, width: 400),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ChatGPT',
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '- Your AI Language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' Partner',
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Text(
              "Unlock Infinite Conversations: ChatGPT, Your AI Companion!",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AppButton(text: "Log In", isborder: false),
          10.heightSizeBox,
          AppButton(
            text: "Create Account",
            isborder: true,
            onTap: () {
              context.goNamed(AppRoutes.createAccountPage.name);
            },
          ),
        ],
      ),
    );
  }
}
