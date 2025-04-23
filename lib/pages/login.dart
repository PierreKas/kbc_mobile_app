import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/buttons.dart';
import 'package:kbc/components/loading.dart';
import 'package:kbc/components/snack_bar.dart';
import 'package:kbc/components/text_hearder.dart';
import 'package:kbc/components/textfields.dart';
import 'package:kbc/controller/membership_controller.dart';
import 'package:kbc/home/home_page.dart';
import 'package:kbc/pages/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: MyColors.amber.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: MyColors.amber.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                'assets/kbc_logo.jpeg',
                fit: BoxFit.cover,
                width: 180,
                height: 180,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: MyColors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.black.withOpacity(0.3),
                        blurRadius:
                            10, //The more I add this value, the more the shadow increase the size outside the container
                        offset: const Offset(0,
                            5), //Reduce the power of shadow on the top of the container
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const MyTextHeader(
                        content: 'Kingdom Believers Church',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        thickness: 4,
                        endIndent: 90,
                        indent: 90,
                        color: MyColors.amber,
                      ),
                      const SizedBox(height: 30),
                      MyTextField(
                        controller: _phoneController,
                        enabled: true,
                        hintText: 'Phone number',
                        obscureText: false,
                        prefixIcon: Icons.phone_android,
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        controller: _passwordController,
                        enabled: true,
                        hintText: 'Password',
                        obscureText: true,
                        prefixIcon: Icons.lock,
                      ),
                      // const SizedBox(height: 10),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: TextButton(
                      //     onPressed: () {},
                      //     style: TextButton.styleFrom(
                      //       foregroundColor: MyColors.black.withOpacity(0.7),
                      //       //padding: EdgeInsets.zero,
                      //       //minimumSize: const Size(30, 0),
                      //     ),
                      //     child: const Text(
                      //       'Forget password?',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 25),
                      MyButtons(
                        height: 50,
                        width: double.infinity,
                        onPressed: () async {
                          showLoadingDialog(context, 'Connecting...');
                          try {
                            final success = await MembershipController().login(
                              _phoneController.text,
                              _passwordController.text,
                              context,
                            );
                            Navigator.of(context).pop();

                            if (success) {
                              print('Success');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePages()));
                            } else {
                              print('Failure');
                              // Navigator.of(context).pop();
                              MySnackBar.showErrorMessage(
                                  'Login failed, check your credentials',
                                  context);
                            }
                          } catch (e) {
                            Navigator.of(context).pop();
                            MySnackBar.showErrorMessage(
                                'Login failed, check your credentials',
                                context);
                          }
                          _passwordController.clear();
                          _phoneController.clear();
                        },
                        text: 'Login',
                      ),
                      // MyButtons(
                      //   height: 50,
                      //   width: double.infinity,
                      //   onPressed: () async {
                      //     print("LOGIN BUTTON PRESSED");
                      //     showLoadingDialog(context);
                      //     print("LOADING DIALOG SHOWN");

                      //     try {
                      //       print("ATTEMPTING LOGIN");
                      //       final success = await MembershipController().login(
                      //         _phoneController.text,
                      //         _passwordController.text,
                      //         context,
                      //       );
                      //       print("LOGIN RETURNED: $success");

                      //       print("DISMISSING LOADING DIALOG");
                      //       Navigator.of(context).pop(); // Dismiss dialog
                      //       print("LOADING DIALOG DISMISSED");

                      //       if (success) {
                      //         print("SUCCESSFUL LOGIN - NAVIGATING TO HOME");
                      //         // Use pushReplacement instead of push
                      //         Navigator.pushReplacement(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => const HomePages()));
                      //         print(
                      //             "NAVIGATION PUSHED"); // This might not print if navigation works
                      //       } else {
                      //         print("LOGIN FAILED - SHOWING ERROR");
                      //         MySnackBar.showErrorMessage(
                      //             'Login failed', context);
                      //       }
                      //     } catch (e, stackTrace) {
                      //       print("LOGIN EXCEPTION: $e");
                      //       Navigator.of(context).pop(); // Dismiss dialog
                      //       log('Login error: $e',
                      //           error: e, stackTrace: stackTrace);
                      //       MySnackBar.showErrorMessage(
                      //           'Login error: ${e.toString()}', context);
                      //     }

                      //     print("CLEARING TEXT FIELDS");
                      //     _passwordController.clear();
                      //     _phoneController.clear();
                      //   },
                      //   text: 'Login',
                      // ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not yet a member?',
                            style: TextStyle(
                              color: MyColors.black.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red[700],
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: const Text(
                              'Register here',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
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
        ],
      ),
    );
  }
}
