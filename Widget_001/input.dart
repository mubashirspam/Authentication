import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordTextEditingController.dispose();
    emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leadingWidth: 60,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),

        //  ************************ ---- form  section ---- ************************ //

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              RichText(
                text: const TextSpan(
                  text: "Hey, \nLogin",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: " Now.",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: "if you Are New /",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "  Create New",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('Tap Here onTap'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              TextFormField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                focusNode: FocusNode(),
                autofocus: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please valid email';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Check your email';
                  }
                  return null;
                },
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: 'Email',
                  fillColor: const Color(0xffECEFF1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordTextEditingController,
                focusNode: FocusNode(),
                autofocus: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid passsword';
                  } else if (value.length < 6) {
                    return 'password ';
                  }

                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Password',
                  fillColor: const Color(0xffECEFF1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Forgot Password /",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "  Reset",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('Tap Here onTap'),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),

              //  ************************ ---- button section ---- ************************ //

              SizedBox(
                height: 55,
                width: double.maxFinite,
                child: CupertinoButton(
                  color: const Color(0xff5AE579),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Color(0xff5AE579),
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
