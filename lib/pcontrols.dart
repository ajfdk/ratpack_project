import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          //PIN toggle
          SwitchListTile(
            title: const Text('Enable PIN Protection'),
            value: Provider.of<ThemeProvider>(context).pinProtectionEnabled,
            onChanged: (bool value) {
              Provider.of<ThemeProvider>(context, listen: false).togglePinProtection();
            },
          ),
          // change pin option
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
          ListTile(
            title: Text('Manage Rooms'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageChildAccountsScreen()),
              );
            }
          )
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

class ManageChildAccountsScreen extends StatefulWidget {
  @override
  _ManageChildAccountsScreenState createState() => _ManageChildAccountsScreenState();
}

class _ManageChildAccountsScreenState extends State<ManageChildAccountsScreen> {
  List<String> _childAccounts = [];
  final TextEditingController _newChildController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadChildAccounts();
  }

  void _loadChildAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _childAccounts = prefs.getStringList('child_accounts') ?? [];
    });
  }

  void _saveChildAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('child_accounts', _childAccounts);
  }

  void _addChildAccount() {
    String newChild = _newChildController.text;
    if (newChild.isNotEmpty && !_childAccounts.contains(newChild)) {
      setState(() {
        _childAccounts.add(newChild);
        _newChildController.clear();
        _saveChildAccounts();
      });
    }
  }

  void _removeChildAccount(String child) {
    setState(() {
      _childAccounts.remove(child);
      _saveChildAccounts();
    });
  }

  void _switchToChild(String child) {
    Provider.of<ThemeProvider>(context, listen: false).setCurrentUser(child);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Child Accounts'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Add Child Account
          TextField(
            controller: _newChildController,
            decoration: InputDecoration(
              labelText: 'Add New Child Account',
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: _addChildAccount,
              ),
            ),
          ),
          SizedBox(height: 20),
          // List of Child Accounts
          Text(
            'Child Accounts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _childAccounts.length,
            itemBuilder: (context, index) {
              String child = _childAccounts[index];
              return ListTile(
                title: Text(child),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removeChildAccount(child),
                ),
                onTap: () => _switchToChild(child),
              );
            },
          ),
        ],
      ),
    );
  }
}
