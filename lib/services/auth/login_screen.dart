import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/services/auth/providers/login_provider.dart';
import 'package:flutter_boilerplate/services/auth/widgets/general_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/widgets/app_bar_widgets.dart';
import '../../core/widgets/build_text_field.dart';
import '../../core/widgets/button_widgets.dart';
import '../../providers/profile_providers.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ON TAB BUTTON USE
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginProvider);
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final profileNotifier = ref.read(profileProvider);
    ref.invalidate(profileNetworkProvider);

    return Scaffold(
      appBar: const AppBarAuth(),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SizedBox(
          width: isTablet ? isPortrait ? size.width * 0.7 : size.width * 0.4 : size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // HEADING ::
                  _buildHeading(context),
                  const SizedBox(height: 50),

                  BuildTextField(
                    hintText: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: LineIcons.envelope,
                    focusNode: emailFocusNode,
                    focusNodeTarget: passwordFocusNode,
                  ),
                  const SizedBox(height: 20),

                  // PASSWORD FIELD
                  BuildTextField(
                    hintText: 'Password',
                    icon: LineIcons.lock,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true, // Password field
                  ),
                  const SizedBox(height: 10),

                  // FORGOT PASSWORD
                  const ForgetPasswordWidget(),
                  const SizedBox(height: 10),

                  // BUTTON
                  AppPrimaryButton(
                    onPressed: isLoading
                        ? () {}
                        : () {
                            final data = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };
                            ref.read(loginProvider.notifier).loginAPI(data, context); // Calling login API
                          },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : ButtonIconLabel(
                      title: 'Login',
                      icon: LineIcons.doorOpen,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildHeading(BuildContext context) {
  ColorScheme colors = Theme.of(context).colorScheme;
  return Column(
    children: [
      Text(
        'Login To Continue!',
        style: TextStyle(
          color: colors.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

