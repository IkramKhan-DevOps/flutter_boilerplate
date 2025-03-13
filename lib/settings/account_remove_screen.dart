import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/settings/providers/account_remove_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/image_constants.dart';
import '../core/widgets/app_bar_widgets.dart';
import '../core/widgets/build_text_field.dart';
import '../core/widgets/button_widgets.dart';

class AccountRemoveScreen extends ConsumerWidget {
  const AccountRemoveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextEditingController passwordController = TextEditingController();
    final isLoading = ref.watch(accountRemoveProvider);

    return Scaffold(
      appBar: const AppBarShort(
        title: 'ACCOUNT REMOVAL',
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: colors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.error.withOpacity(0.5)),
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // IMAGE
                  Lottie.asset(LottieConstant.cancel, width: 100, height: 100),
                  const SizedBox(height: 20),
              
                  // TEXT
                  Text(
                    'Are your sure you want to remove your account? '
                    'There is no way to reverse this action \n\nIts better '
                    'to deactivate rather than deleting your account '
                    'permanently.',
                    style: TextStyle(
                      color: colors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
              
                  // PASSWORD
                  BuildTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: LineIcons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
              
                  // BUTTONS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppPrimaryButton(
                          onPressed: isLoading
                              ? () {}
                              : () {
                            Map data = {
                              'password': passwordController.text,
                            };
                            ref
                                .read(accountRemoveProvider.notifier)
                                .removeAccount(
                              data,
                              context,
                              ref,
                              false,
                            );
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                              : const ButtonIconLabel(
                            icon: LineIcons.link,
                            title: 'Deactivate',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AppPrimaryButton(
                          onPressed: isLoading
                              ? () {}
                              : () {
                                  Map data = {
                                    'password': passwordController.text,
                                  };
                                  ref
                                      .read(accountRemoveProvider.notifier)
                                      .removeAccount(
                                        data,
                                        context,
                                        ref,
                                        true,
                                      );
                                },
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : const ButtonIconLabel(
                                  icon: LineIcons.trash,
                                  title: 'Delete',
                                ),
                        ),
                      ),
                    ],
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
