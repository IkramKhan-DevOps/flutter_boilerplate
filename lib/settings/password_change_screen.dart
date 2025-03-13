import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/settings/providers/password_change_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../core/widgets/app_bar_widgets.dart';
import '../core/widgets/build_text_field.dart';
import '../core/widgets/button_widgets.dart';
import '../services/auth/widgets/general_widgets.dart';

class PasswordChangeScreen extends ConsumerWidget {
  final TextEditingController previousPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode previousPasswordFocus = FocusNode();
  final FocusNode newPasswordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isLoading = ref.watch(passwordChangeProvider);
    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;

    return Scaffold(
      appBar: const AppBarShort(
        title: 'PASSWORD CHANGE',
      ),
      body: Center(
        child: SizedBox(
          width: isTablet ? size.width * 0.4 : size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // First Name
                  BuildTextField(
                    icon: LineIcons.user,
                    labelText: 'Previous Password',
                    hintText: '********',
                    obscureText: true,
                    controller: previousPasswordController,
                    focusNode: previousPasswordFocus,
                    focusNodeTarget: newPasswordFocus,
                  ),
                  const SizedBox(height: 20),

                  // Last Name
                  BuildTextField(
                    icon: LineIcons.user,
                    labelText: 'New Password',
                    hintText: '********',
                    obscureText: true,
                    controller: newPasswordController,
                    focusNode: newPasswordFocus,
                    focusNodeTarget: confirmPasswordFocus,
                  ),
                  const SizedBox(height: 20),

                  // Username
                  BuildTextField(
                    icon: LineIcons.user,
                    labelText: 'Confirm Password',
                    hintText: '********',
                    obscureText: true,
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocus,
                  ),
                  const SizedBox(height: 10),

                  const ForgetPasswordWidget(),
                  const SizedBox(height: 10),

                  // BUTTON
                  AppPrimaryButton(
                    onPressed: isLoading
                        ? () {}
                        : () {
                      Map data = {
                        'old_password':
                        previousPasswordController.text.toString(),
                        'new_password1': newPasswordController.text.toString(),
                        'new_password2':
                        confirmPasswordController.text.toString(),
                      };
                      ref
                          .read(passwordChangeProvider.notifier)
                          .changePasswordAPI(data, context);
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const ButtonIconLabel(
                      icon: LineIcons.checkCircle,
                      title: 'SUBMIT',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
