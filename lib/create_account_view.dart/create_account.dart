import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_project/create_account_view.dart/confirmation_screen.dart';
import 'create_account_bloc.dart';
import 'create_account_event.dart';


// ignore: must_be_immutable
class CreateAccount extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final List<String> _roles = ['Doctor', 'Patient', 'Admin'];
  String _selectedRole = 'Doctor';

  CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CreateAccountBloc(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
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
                    const Text(
                      'Create New Account in this Screen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold,color: Colors.green),
                    ),
                  ],
                ),
              ),
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
                      const SizedBox(height: 20),
                      // Select Role Dropdown
                      SizedBox(
                        width: 350,
                        child: DropdownButtonFormField<String>(
                          value: _selectedRole,
                          items: _roles.map((role) {
                            return DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedRole = value!;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Select the Role',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Email Text Field
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
                      // New Password Text Field
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: _newPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'New Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Confirm Password Text Field
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Create New Account Button
                      SizedBox(
                        width: 350,
                        child: BlocConsumer<CreateAccountBloc, CreateAccountState>(
                          listener: (context, state) {
                            if (state is CreateAccountSuccess) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ConfirmationScreen(),
                                ),
                              );
                            } else if (state is CreateAccountFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is CreateAccountLoading) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            return ElevatedButton(
                              onPressed: () {
                                final email = _emailController.text;
                                final password = _newPasswordController.text;
                                final confirmPassword = _confirmPasswordController.text;
                                final role = _selectedRole;
                                
                                context.read<CreateAccountBloc>().add(
                                  CreateAccountButtonPressed(
                                    email: email,
                                    password: password,
                                    confirmPassword: confirmPassword,
                                    role: role,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              child: const Text('Create New Account', style: TextStyle(color: Colors.white)),
                            );
                          },
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
