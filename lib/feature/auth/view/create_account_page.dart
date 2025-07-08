import 'package:AIChatBot/core/app_theme/app_colors.dart';
import 'package:AIChatBot/core/app_widgets/app_button.dart';
import 'package:AIChatBot/core/app_widgets/app_text_form_field.dart';
import 'package:AIChatBot/feature/auth/bloc/auth_bloc.dart';
import 'package:AIChatBot/generated/assets.dart';
import 'package:AIChatBot/routes/route.dart';
import 'package:AIChatBot/utilies/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(GoogleSignIn(scopes: ['email', 'profile'])),
      child: Scaffold(
        appBar: AppBar(title: const Text("")),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AuthSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(state.photoUrl ?? ''),
                      radius: 40,
                    ),
                    const SizedBox(height: 8),
                    Text("Hello, ${state.name}"),
                    Text(state.email),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(SignOutRequested());
                      },
                      child: const Text("Sign out"),
                    ),
                  ],
                ),
              );
            }
            if (state is AuthFailure) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your account",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    10.heightSizeBox,
                    Text(
                      "To begin using the chat GPT, please create an account with your email address.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    50.heightSizeBox,
                    AppTextFormField(),
                    40.heightSizeBox,
                    Row(children: []),
                    AppButton(
                      text: "Continue",
                      marginHorizontal: 0,
                      onTap: () {
                        context.goNamed(AppRoutes.bottomNavBarPage.name);
                      },
                    ),
                    30.heightSizeBox,
                    GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(SignInRequested());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: AppColors.primary,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(Assets.iconsGoogle, height: 30),
                              10.widthSizeBox,
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
