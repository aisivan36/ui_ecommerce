import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/forgot.dart';
import 'package:ui_ecommerce/widgets/form_sign.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  IsIconForm emailLogo = IsIconForm.none;
  IsIconForm passwordLogo = IsIconForm.none;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                          'Login',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.w700,
                            fontSize: 34,
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                    context, ForgotPage.routeName);
                              },
                              child: const Text(
                                'Forgot your password?',
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
                              print('succed');
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
                      child: Text('Or login with social account'),
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
