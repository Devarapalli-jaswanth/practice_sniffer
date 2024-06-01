import 'package:flutter/material.dart';
import 'package:gemini_project/admin_app_view.dart/adminapp.dart';
import 'package:gemini_project/factoryapp.dart';
import 'package:gemini_project/fotaapp.dart';
import 'package:gemini_project/onboard.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedMenu = 'Factory App';

  void _onMenuTap(String menu) {
    setState(() {
      _selectedMenu = menu;
    });
  }

  Widget _getSelectedPage() {
    switch (_selectedMenu) {
      case 'Factory App':
        return const FactoryApp();
      case 'Fota App':
        return const FotaApp();
      case 'RPM App':
        return const Center(child: Text('RPM App'));
        case 'Onboard App':
        return const OnboardApp();
        case 'Licence':
        return const Center(child: Text('Licence'));
        case 'Admin':
        return const AdminApp();
      default:
        return const Center(child: Text('Welcome to MedSniffer Dashboard'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'images/6655.png', // Make sure to add your logo in assets folder and declare it in pubspec.yaml
                        width: 200,
                        height: 100,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _onMenuTap('Factory App'),
                  child: Container(
                    color: _selectedMenu == 'Factory App' ? Colors.green : Colors.transparent,
                    child: const ListTile(
                      leading: Icon(Icons.dashboard, color: Colors.white),
                      title: Text('Factory App', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _onMenuTap('Fota App'),
                  child: Container(
                    color: _selectedMenu == 'Fota App' ? Colors.green : Colors.transparent,
                    child: const ListTile(
                      leading: Icon(Icons.loop_rounded, color: Colors.white),
                      title: Text('Fota App', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _onMenuTap('RPM App'),
                  child: Container(
                    color: _selectedMenu == 'RPM App' ? Colors.green : Colors.transparent,
                    child: const ListTile(
                      leading: Icon(Icons.computer_outlined, color: Colors.white),
                      title: Text('RPM App', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _onMenuTap('Onboard App'),
                  child: Container(
                    color: _selectedMenu == 'Onboard App' ? Colors.green : Colors.transparent,
                    child: const ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: Text('Onboard App', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),InkWell(
                  onTap: () => _onMenuTap('Licence'),
                  child: Container(
                    color: _selectedMenu == 'Licence' ? Colors.green : Colors.transparent,
                    child: const ListTile(
                      leading: Icon(Icons.key, color: Colors.white),
                      title: Text('Licence', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),InkWell(
                  onTap: () => _onMenuTap('Admin'),
                  child: Container(
                    color: _selectedMenu == 'Admin' ? Colors.green : Colors.transparent,
                    child: const ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text('Admin', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _getSelectedPage(),
          ),
        ],
      ),
    );
  }
}