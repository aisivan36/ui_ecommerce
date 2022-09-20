import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/login.dart';
import 'package:ui_ecommerce/screens/tabbar.dart';
import 'package:ui_ecommerce/widgets/form_sign.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String routeName = '/signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  IsIconForm nameLogo = IsIconForm.none;
  IsIconForm emailLogo = IsIconForm.none;
  IsIconForm passwordLogo = IsIconForm.none;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var heightPadding = MediaQuery.of(context);
    // print(heightPadding.size.height - 55);
    return Scaffold(
      extendBody: true,
      // backgroundColor: const Color(0x1E1F28ff),
      appBar: AppBar(
        // backgroundColor: const Color(0x1E1F28ff),
        // elevation: 0.0,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        leadingWidth: 20.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // color: Colors.amber,
          height: MediaQuery.of(context).size.height - 95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.w700,
                            fontSize: 34,
                          ),
                        ),
                        const SizedBox(height: 20),
                        FormSign(
                          labelText: 'Name',
                          controller: name,
                          isIconForm: nameLogo,
                          onChanged: (value) {
                            if (value!.isNotEmpty && value.length >= 3) {
                              nameLogo = IsIconForm.valid;
                              setState(() {});
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              nameLogo = IsIconForm.notValid;
                              setState(() {});
                              return "Name can't be empty";
                            } else if (value.length <= 2) {
                              nameLogo = IsIconForm.notValid;
                              setState(() {});
                              return "Name should be at least 3 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 5.0),
                        FormSign(
                          labelText: 'Email',
                          controller: email,
                          isIconForm: emailLogo,
                          onChanged: (value) {
                            if (value!.isNotEmpty &&
                                value.contains('@') &&
                                value.contains('.')) {
                              emailLogo = IsIconForm.valid;
                              setState(() {});
                            }
                            if (value.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.')) {
                              emailLogo = IsIconForm.none;
                              setState(() {});
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.')) {
                              emailLogo = IsIconForm.notValid;
                              setState(() {});
                              return "Please enter a valid Email";
                            } else if (value.isEmpty) {
                              emailLogo = IsIconForm.notValid;
                              setState(() {});
                              return 'Email is empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 5.0),
                        FormSign(
                          isPasswordForm: true,
                          labelText: 'Password',
                          controller: password,
                          isIconForm: passwordLogo,
                          onChanged: (value) {
                            if (value!.length >= 6) {
                              passwordLogo = IsIconForm.valid;
                              setState(() {});
                            } else if (value.length <= 5) {
                              passwordLogo = IsIconForm.none;
                              setState(() {});
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              passwordLogo = IsIconForm.notValid;
                              setState(() {});
                              return "Password cannot be empty";
                            } else if (value.length <= 5) {
                              passwordLogo = IsIconForm.notValid;
                              setState(() {});
                              return "Please enter at least 6 Characters long";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, LoginPage.routeName);
                              },
                              child: const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Color(0xffef3651),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Signup Succed');
                            }
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xffef3651),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up'.toUpperCase(),
                                style: const TextStyle(
                                  color: Color(0xfff5f5f5),
                                  fontSize: 14,
                                  // fontFamily: "Metropolis",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // TODO This is just for testing should be remove
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, TabbarScreen.routeName);
                          },
                          child: const Text(
                            'Temp Guess login?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.only(top: heightPadding.size.height - 600),
                padding: const EdgeInsets.only(bottom: 47.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text('Or sign up with social account'),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 92,
                          height: 64,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                // blurRadius: 8,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png'),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 92,
                          height: 64,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                // blurRadius: 8,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.network(
                              'https://www.freeiconspng.com/uploads/facebook-transparent-logo-png-0.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
