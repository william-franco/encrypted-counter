import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:encrypted_counter/providers/counter_provider.dart';
import 'package:encrypted_counter/providers/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  final String title = 'Settings';

  Future<void> _themeDialog(BuildContext context) async {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Theme'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RadioListTile<ThemeMode>(
                  title: const Text('Light Mode'),
                  groupValue: theme.getTheme,
                  value: ThemeMode.light,
                  onChanged: theme.setLightTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('Dark Mode'),
                  groupValue: theme.getTheme,
                  value: ThemeMode.dark,
                  onChanged: theme.setDarkTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('System Mode'),
                  groupValue: theme.getTheme,
                  value: ThemeMode.system,
                  onChanged: theme.setSystemTheme,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteDialog(BuildContext context) async {
    final counter = Provider.of<CounterProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Do you want delete all items ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                counter.removeAll();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CupertinoScrollbar(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Theme'),
              subtitle: const Text('Choose theme of app.'),
              onTap: () => _themeDialog(context),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              subtitle: const Text('This option will erase all items saved.'),
              onTap: () => _deleteDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
