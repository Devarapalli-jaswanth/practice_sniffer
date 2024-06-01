import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_project/create_account_view.dart/create_account.dart';
import 'package:gemini_project/dashboard.dart';
import 'package:gemini_project/forget_password_view.dart/forget_password.dart';
import 'login_bloc.dart';
import 'login_event.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _rememberMeNotifier = ValueNotifier<bool>(false);

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Set background color for entire screen 
        backgroundColor: Colors.black,
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2, // Half screen width
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        'images/891.jpeg', 
                        fit: BoxFit.contain, 
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Additional Text
                    const Text(
                      'Monitoring Your Health,\n Your Health in Our Safe Hands.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ],
                ),
              ),
              // Login Column with white background
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 350,
                        height: 150,
                        child: Image.asset(
                          'images/6655.png', 
                        ),
                      ),
                      // Username Text Field
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Grey border for light background
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Grey border when focused
                            ),
                            labelText: 'Office Mail ID',
                            labelStyle: TextStyle(color: Colors.grey), // Grey text for light background
                          ),
                          style: const TextStyle(color: Colors.black), // Grey text for light background
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Text Field
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true, // Hide password input
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Grey border for light background
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Grey border when focused
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey), // Grey text for light background
                          ),
                          style: const TextStyle(color: Colors.black), // Grey text for light background
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Forgot Password and Remember Me
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ValueListenableBuilder<bool>(
                                  valueListenable: _rememberMeNotifier,
                                  builder: (context, value, child) {
                                    return Checkbox(
                                      value: value,
                                      onChanged: (newValue) {
                                        _rememberMeNotifier.value = newValue!;
                                      },
                                    );
                                  },
                                ),
                                const Text('Remember Me', style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            TextButton(
                             onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordScreen(),
                                  ),
                                );
                              },
                              child: const Text('Forgot Password', style: TextStyle(color: Colors.green)), // Black text for light background
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Login Button with BlocConsumer
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          } else if (state is LoginSuccess) {
                             Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const DashboardPage(),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator();
                          }
                          return SizedBox(
                            width: 350,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginButtonPressed(
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                    rememberMe: _rememberMeNotifier.value,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              child: const Text('Login', style: TextStyle(color: Colors.white)), 
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Create Account Section
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?', style: TextStyle(color: Colors.black)), // Black text for light background
                            TextButton(
                               onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CreateAccount(),
                                  ),
                                );
                              },
                              child: const Text('Create New Account', style: TextStyle(color: Colors.green)), // Black text for light background
                            ),
                          ],
                        ),
                      ),
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
