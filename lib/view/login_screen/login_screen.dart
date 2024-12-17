import 'package:events/core/constants/color_constant.dart';
import 'package:events/global_widgets/custom_button.dart';
import 'package:events/view/bottom_nav_bar_screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // #1 inatagram logo

                Image.asset('asstes/images/Instagram Logo.png'),
                const SizedBox(
                  height: 50,
                ),

                // #2 user name text field

                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                      label: const Text(
                        "Username",
                        style: TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      fillColor: ColorConstants.lightGrey,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: ColorConstants.primaryBlack.withOpacity(.1),
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstants.primaryBlack.withOpacity(.4),
                        ),
                      )),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                // #3  password text field

                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: passController,
                  obscuringCharacter: "*",
                  obscureText: true,
                  decoration: InputDecoration(
                    label: const Text(
                      'Password',
                      style: TextStyle(
                        color: ColorConstants.primaryBlack,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    fillColor: ColorConstants.lightGrey,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorConstants.primaryBlack.withOpacity(.1),
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorConstants.primaryBlack.withOpacity(.4),
                    )),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                // #4 forgot password button

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password ?',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.primaryBlue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                // #5 Login button

                CustomButton(
                  buttonColor: nameController.text.isNotEmpty &&
                          passController.text.isNotEmpty
                      ? ColorConstants.primaryBlue
                      : ColorConstants.primaryBlue.withOpacity(.4),
                  text: "Log In",
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBarScreen(),
                        ),
                        (route) => false);
                  },
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     print("my custom button pressed");
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 130,
                //     ),
                //     child: Text(
                //       "Log in",
                //       selectionColor:
                //           ColorConstants.primaryBlue.withOpacity(.4),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),

                // #6  Login with facebook

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.facebook,
                      color: ColorConstants.primaryBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Image.asset(
                    //   'asstes/images/Facebook logo.jpg',
                    //   scale: 25,
                    // ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Login with facebook",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: ColorConstants.primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                // #7   oR section

                const Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Divider(
                          endIndent: 30,
                          color: Colors.grey,
                        )),
                    Text('OR'),
                    Expanded(
                        flex: 5,
                        child: Divider(
                          indent: 30,
                          color: Colors.grey,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                // #8  Sign Up

                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Dont have an account?',
                        style: TextStyle(
                          color: ColorConstants.primaryBlack.withOpacity(.4),
                        ),
                        children: const [
                          TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                color: ColorConstants.primaryBlue,
                                fontWeight: FontWeight.w500,
                              )),
                        ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
