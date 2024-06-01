import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_project/forget_password_view.dart/reset_password.dart';
import 'forgot_password_bloc.dart';
import 'forgot_password_event.dart';


class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Row(
          children: [
            // Left section with background image and text
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('images/891.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot Password Screen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Right section with password reset form
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/6655.png',
                        width: 350,
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email ID',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                          listener: (context, state) {
                            if (state is ForgotPasswordSuccess) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ResetpasswordScreen(),
                                ),
                              );
                            } else if (state is ForgotPasswordFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is ForgotPasswordLoading) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            return ElevatedButton(
                              onPressed: () {
                                final email = _emailController.text;

                                context.read<ForgotPasswordBloc>().add(
                                  ForgotPasswordButtonPressed(email: email),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              child: const Text('Reset Password', style: TextStyle(color: Colors.white)),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'You will get the password reset link in your registered Email ID,\nKindly please click and reset your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
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
    );
  }
}
