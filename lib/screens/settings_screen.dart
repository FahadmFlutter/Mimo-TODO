import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final fullName = authProvider.fullName ?? 'Guest';
    final email = authProvider.userId ?? 'Not Available';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle_outlined,size:50 ,),
            title: Text(fullName),
            subtitle: Text(email),
          ),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.settings,
            title: 'General',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.person,
            title: 'Account',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.info,
            title: 'About',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () async {
              await Provider.of<AuthProvider>(context, listen: false).logout();
              if (!context.mounted) return;
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
