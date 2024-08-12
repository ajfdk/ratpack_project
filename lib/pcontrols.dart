import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class ParentalControlsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parental Controls'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable PIN Protection'),
            value: Provider.of<ThemeProvider>(context).pinProtectionEnabled,
            onChanged: (bool value) {
              Provider.of<ThemeProvider>(context, listen: false).togglePinProtection();
            },
          ),
          ListTile(
            title: const Text('Change PIN'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePinScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChangePinScreen extends StatefulWidget {
  @override
  _ChangePinScreenState createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final TextEditingController _newPinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newPinController,
              decoration: const InputDecoration(
                labelText: 'Enter new 4-digit PIN',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmPinController,
              decoration: const InputDecoration(
                labelText: 'Confirm new 4-digit PIN',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_newPinController.text == _confirmPinController.text) {
                  Provider.of<ThemeProvider>(context, listen: false).setPin(_newPinController.text);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PIN changed successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PINs do not match')),
                  );
                }
              },
              child: const Text('Change PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
