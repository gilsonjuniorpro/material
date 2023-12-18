import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF006C50)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: UpdatePasswordScreen(),
    );
  }
}

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Update your password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Enter a new password you\'ve never used',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                buildPasswordField('Current password'),
                const SizedBox(height: 24),
                Divider(height: 30, color: Colors.grey.shade400),
                const SizedBox(height: 24),
                buildPasswordField('New password'),
                const SizedBox(height: 50),
                buildPasswordField('Confirm new password'),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xFF006C50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Set border radius here
                      ), // text color
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data
                      }
                    },
                    child: const Text('Update Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(String label) {
    bool isPasswordVisible;
    TextEditingController? controller;

    if (label == 'Current password') {
      isPasswordVisible = _currentPasswordVisible;
    } else if (label == 'New password') {
      isPasswordVisible = _newPasswordVisible;
      controller = _newPasswordController;
    } else {
      isPasswordVisible = _confirmPasswordVisible;
    }

    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.grey), // Text color
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey), // Label color
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF006C50)), // Border color
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF006C50), // Icon color
          ),
          onPressed: () {
            setState(() {
              if (label == 'Current password') {
                _currentPasswordVisible = !_currentPasswordVisible;
              } else if (label == 'New password') {
                _newPasswordVisible = !_newPasswordVisible;
              } else {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              }
            });
          },
        ),
        errorMaxLines: 3,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if ((label == 'New password') && !isValidPassword(value)) {
          return 'create a unique password. include 9 characters minimum with 1 Capital letter, 1 lower casa, 1 number or 1 special character <>~@#\$%^&*()\'';
        }

        if ((label == 'Confirm new password') && !isValidPassword(value)) {
          return 'create a unique password. include 9 characters minimum with 1 Capital letter, 1 lower casa, 1 number or 1 special character <>~@#\$%^&*()\'';
        }
        if (label == 'Confirm new password' && value != _newPasswordController.text) {
          return 'That didn\'t match. Enter your new password again.';
        }

        return null;
      },
    );
  }

  bool isValidPassword(String password) {
    String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}":;<>,.?\\\/\[\]~`|]).{9,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }
}
