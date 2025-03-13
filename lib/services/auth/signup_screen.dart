import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/services/auth/providers/signup_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import '../../core/widgets/app_bar_widgets.dart';
import '../../core/widgets/build_text_field.dart';
import '../../core/widgets/button_widgets.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});

  // CONTROLLERS
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode password1FocusNode = FocusNode();
  final FocusNode password2FocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(signUpProvider);
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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

                  // TEXT FIELD: Username
                  BuildTextField(
                    hintText: 'Username',
                    icon: LineIcons.user,
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    focusNode: usernameFocusNode,
                    focusNodeTarget: emailFocusNode,
                  ),
                  const SizedBox(height: 20),

                  // TEXT FIELD: Email
                  BuildTextField(
                    hintText: 'Email',
                    icon: LineIcons.envelope,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    focusNodeTarget: password1FocusNode,
                  ),
                  const SizedBox(height: 20),

                  // PASSWORD FIELD: New Password
                  BuildTextField(
                    hintText: 'New Password',
                    icon: LineIcons.lock,
                    obscureText: true, // Password field
                    controller: password1Controller,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: password1FocusNode,
                    focusNodeTarget: password2FocusNode,
                  ),
                  const SizedBox(height: 20),

                  // PASSWORD FIELD: Confirm Password
                  BuildTextField(
                    hintText: 'Confirm Password',
                    icon: LineIcons.lock,
                    obscureText: true, // Password field
                    controller: password2Controller,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: password2FocusNode,
                  ),
                  const SizedBox(height: 20),

                  // FORGOT PASSWORD
                  _buildForgotPassword(context),
                  const SizedBox(height: 10),

                  // BUTTON
                  AppPrimaryButton(
                    onPressed: () {
                      Map data = {
                        'username':
                        usernameController.text.toString(),
                        'email': emailController.text.toString(),
                        'password1':
                        password1Controller.text.toString(),
                        'password2':
                        password2Controller.text.toString(),
                      };
                      ref.read(signUpProvider.notifier).signUpApi(data, context);
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : ButtonIconLabel(
                      title: 'Register',
                      icon: LineIcons.userPlus,
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Register Now!',
        style: TextStyle(
          color: colors.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        textAlign: TextAlign.left,
      ),
    ],
  );
}

Widget _buildForgotPassword(BuildContext context) {
  return InkWell(
    onTap: (){},
    child: Align(
      alignment: Alignment.centerRight,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'Forgot Password?',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        TextSpan(
          text: ' Reset',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ])),
    ),
  );
}
