import 'package:flutter/material.dart';
import 'package:gemini_project/admin_app_view.dart/adminapp.dart';

class AdminAddUsers extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AdminAddUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin - Add Users',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add User Fields',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter User Name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Address',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'admin', child: Text('Admin')),
                DropdownMenuItem(value: 'user', child: Text('User')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Choose Role Permission',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                   onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const AdminApp(),
                                  ),
                                );
                              },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Go Back',style: TextStyle(color: Colors.black),),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Add Users logic
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Add Users',style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
