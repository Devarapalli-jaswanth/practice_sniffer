import 'package:flutter/material.dart';
import 'package:gemini_project/admin_app_view.dart/admin_addusers.dart';
import 'package:gemini_project/admin_app_view.dart/admin_viewusers.dart';

class AdminApp extends StatefulWidget {
  const AdminApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminAppState createState() => _AdminAppState();
}

class _AdminAppState extends State<AdminApp> {
  bool isGridView = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADMIN',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Admin /',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Admin Details',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          labelText: 'Type here for search',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGridView = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isGridView ? Colors.white : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(Icons.list, color: Colors.black),
                    ),
                    const SizedBox(width: 1),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGridView = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isGridView ? Colors.green : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(Icons.grid_view, color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AdminAddUsers(),
                                  ),
                                );
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      icon: const Icon(Icons.add, color: Colors.black),
                      label: const Text(
                        'Add Users',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const AdminViewUsersApp(),
                                  ),
                                );
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      icon: const Icon(Icons.add, color: Colors.black),
                      label: const Text(
                        'View Users',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your action 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      icon: const Icon(Icons.add, color: Colors.black),
                      label: const Text(
                        'View Device',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}


