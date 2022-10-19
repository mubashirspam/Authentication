import 'package:flutter/cupertino.dart';
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

  bool _validate = false;

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
              Text(
                "Hey, \nLogin Now.",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                  text: "if you Are New /",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "  Create New",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 60,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Colors.blueGrey.shade50,
                ),
                child: Center(
                  child: TextFormField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: FocusNode(),
                    autofocus: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please valid email';
                      } else if (value.endsWith("@gmail.com") != true) {
                        return 'Please valid email';
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Colors.blueGrey.shade50,
                ),
                child: Center(
                  child: TextFormField(
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
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: const TextSpan(
                  text: "Forgot Password /",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "  Reset",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
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






