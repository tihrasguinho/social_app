import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/auth/presentation/controllers/signin_controller.dart';
import 'package:social_app/modules/auth/presentation/ui/widgets/my_button.dart';
import 'package:social_app/modules/auth/presentation/ui/widgets/my_loading.dart';
import 'package:social_app/modules/auth/presentation/ui/widgets/my_text_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with SingleTickerProviderStateMixin {
  final controller = Modular.get<SigninController>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _loading = false;

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    _emailFocus.hasFocus || _passwordFocus.hasFocus ? Colors.white : Theme.of(context).primaryColorDark,
                    _emailFocus.hasFocus || _passwordFocus.hasFocus ? Colors.white : Theme.of(context).primaryColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                SizedBox(
                  height: size.height * 0.56,
                  child: Material(
                    color: Colors.white,
                    elevation: _emailFocus.hasFocus || _passwordFocus.hasFocus ? 0 : 5,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: SizedBox()),
                        Text(
                          'Social App',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const Expanded(child: SizedBox()),
                        MyTextField(
                          hintText: 'Email',
                          controller: _email,
                          inputType: TextInputType.emailAddress,
                          focus: _emailFocus,
                        ),
                        MyTextField(
                          hintText: 'Password',
                          controller: _password,
                          obscure: true,
                          focus: _passwordFocus,
                        ),
                        MyButton(
                          title: 'Sign In!',
                          onPressed: () async {
                            setState(() {
                              _loading = true;
                            });

                            var result = await controller(context, email: _email.text, password: _password.text);

                            log('$result');

                            if (result) {
                              Modular.to.pushReplacementNamed('/home');
                            }

                            setState(() {
                              _loading = false;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('or'),
                        ),
                        MaterialButton(
                          onPressed: () async {
                            setState(() {
                              _loading = true;
                            });

                            var result = await Modular.to.pushNamed('/auth/signup');

                            if (result is bool) {
                              Modular.to.pushReplacementNamed('/home');
                            }

                            setState(() {
                              _loading = false;
                            });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Text(
                            'Sign up here!',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                        const Expanded(flex: 2, child: SizedBox()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _loading ? const MyLoading() : Container(),
        ],
      ),
    );
  }
}
