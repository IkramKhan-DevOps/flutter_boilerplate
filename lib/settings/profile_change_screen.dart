import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/configs/app_routes.dart';
import '../../core/utils/logger.dart';
import '../core/errors/app_errors.dart';
import '../core/widgets/app_bar_widgets.dart';
import '../core/widgets/bottom_sheet_widgets.dart';
import '../core/widgets/build_text_field.dart';
import '../core/widgets/button_widgets.dart';
import '../providers/profile_providers.dart';

class ProfileChangeScreen extends ConsumerWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();

  ProfileChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final profileState = ref.watch(profileNetworkProvider);
    final isLoading = ref.watch(profileLoadingProvider); // Watch loading state

    ColorScheme colors = Theme.of(context).colorScheme;

    var size = MediaQuery.of(context).size;
    bool isTablet = size.width > 450;

    return Scaffold(
      appBar: const AppBarShort(
        title: 'MY PROFILE',
      ),
      bottomNavigationBar: TermsBottomSheetWidget(
        leftText: 'Deactivate or Delete your account? ',
        rightText: 'Click Here',
        backgroundColor: Colors.transparent,
        foregroundColor: colors.secondary,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.accountRemoveScreen);
        },
      ),
      body: Center(
        child: profileState.when(
          data: (data) {

            firstNameController.text = data.firstName ?? '';
            lastNameController.text = data.lastName ?? '';
            usernameController.text = data.username ?? '';

            return SizedBox(
              width: isTablet ? size.width * 0.4 : size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FORM
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [

                          // First Name
                          BuildTextField(
                            icon: LineIcons.user,
                            labelText: 'First Name',
                            hintText: 'Marcus',
                            controller: firstNameController,
                            focusNode: firstNameFocus,
                            focusNodeTarget: lastNameFocus,
                          ),
                          const SizedBox(height: 20),

                          // Last Name
                          BuildTextField(
                            icon: LineIcons.user,
                            labelText: 'Last Name',
                            hintText: 'Merlin',
                            controller: lastNameController,
                            focusNode: lastNameFocus,
                            focusNodeTarget: usernameFocus,
                          ),
                          const SizedBox(height: 20),

                          // Username
                          BuildTextField(
                            icon: LineIcons.tag,
                            labelText: 'Username',
                            hintText: 'marcus',
                            controller: usernameController,
                            focusNode: usernameFocus,
                          ),
                          const SizedBox(height: 20),

                          // BUTTON
                          AppPrimaryButton(
                            onPressed: isLoading
                                ? () {} // Disable the button if loading
                                : () async {
                              final updatedData = {
                                'username': usernameController.text,
                                'first_name': firstNameController.text,
                                'last_name': lastNameController.text,
                              };

                              // Set loading to true
                              ref
                                  .read(profileLoadingProvider.notifier)
                                  .setLoading(true);

                              try {
                                // Call the update function
                                await ref
                                    .read(profileProvider)
                                    .updateProfile(updatedData);

                                // Show success message
                                Toast.show(
                                  context,
                                  'Profile updated successfully',
                                  'success',
                                );

                                // Refresh profile data
                                ref.refresh(profileNetworkProvider);
                              } catch (error) {
                                // Handle error and show message
                                AppPrint.print(error.toString());
                                Toast.show(
                                  context,
                                  'Profile update failed',
                                  error.toString(),
                                );
                              } finally {
                                // Set loading to false after completion
                                ref
                                    .read(profileLoadingProvider.notifier)
                                    .setLoading(false);
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            ) // Show loader while updating
                                : const ButtonIconLabel(
                              icon: LineIcons.checkCircle,
                              title: 'SUBMIT',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, _) {
            return Text(error.toString());
          },
          loading: () {
            return CircularProgressIndicator(

            );
          },
        ),
      ),
    );
  }
}

