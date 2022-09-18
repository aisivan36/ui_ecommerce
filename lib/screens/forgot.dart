import 'package:flutter/material.dart';
import 'package:ui_ecommerce/widgets/form_sign.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  static const String routeName = '/forgot';

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController email = TextEditingController();

  IsIconForm emailLogo = IsIconForm.none;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'Forgot password',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.w700,
                            fontSize: 34,
                          ),
                        ),
                        const SizedBox(height: 77.0),
                        const Text(
                            'Please, enter your email address. You will receive a link to create a new password via email.'),
                        const SizedBox(height: 20.0),
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
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextButton(
                          onPressed: () {
                            // print(_formKey.currentState!.validate());
                            // print(email.text);

                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please Check your email',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              );
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
                                'Send'.toUpperCase(),
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
            ],
          ),
        ),
      ),
    );
  }
}
