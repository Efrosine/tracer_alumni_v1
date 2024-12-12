import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tracer_alumni_v1/nav_bar.dart';
import 'package:tracer_alumni_v1/service_api.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final ServiceApi serviceApi = ServiceApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Tacer Alumni',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Gap(32),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Gap(24),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Gap(56),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_globalKey.currentState!.validate()) {
                              try {
                                String email = emailController.text.trim();
                                String password =
                                    passwordController.text.trim();
                                print('email:$email,pw:$password,');
                                // if (email != 'admin@gmail.com' &&
                                //     password != 'admin123') {
                                //   throw Exception('Email atau password salah');
                                // }
                                await serviceApi.auth(email, password);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavBar(),
                                    ));
                                isLogin = true;
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data tidak valid')));
                            }
                          },
                          child: Text('Login'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              isLogin = false;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBar(),
                                  ));
                            },
                            child: Text('Logis as Guest')),
                      )
                    ],
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
