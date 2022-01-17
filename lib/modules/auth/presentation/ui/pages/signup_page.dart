import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/auth/presentation/controllers/signup_controller.dart';
import 'package:social_app/modules/auth/presentation/ui/widgets/my_button.dart';
import 'package:social_app/modules/auth/presentation/ui/widgets/my_loading.dart';
import 'package:social_app/modules/auth/presentation/ui/widgets/my_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SingleTickerProviderStateMixin {
  final controller = Modular.get<SignupController>();

  final _name = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    _name.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up to Social App',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hintText: 'Name',
                  controller: _name,
                  inputType: TextInputType.text,
                ),
                MyTextField(
                  hintText: 'Username',
                  controller: _username,
                  inputType: TextInputType.text,
                  formatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9_-]'))],
                ),
                MyTextField(
                  hintText: 'Email',
                  controller: _email,
                  inputType: TextInputType.emailAddress,
                ),
                MyTextField(
                  hintText: 'Password',
                  controller: _password,
                  inputType: TextInputType.text,
                  obscure: true,
                ),
                MyButton(
                  title: 'Sign Up!',
                  onPressed: () async {
                    setState(() {
                      _loading = true;
                    });

                    var result = await controller(
                      context,
                      name: _name.text,
                      username: _username.text,
                      email: _email.text,
                      password: _password.text,
                    );

                    if (result) {
                      Modular.to.pop(result);
                    }

                    setState(() {
                      _loading = result;
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('or'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/g_icon.png',
                          height: 22,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
