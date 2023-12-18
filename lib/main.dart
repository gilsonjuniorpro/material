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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade900),
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
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Update your password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter a new password you\'ve never used',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                buildPasswordField('Current password'),
                SizedBox(height: 20),
                Divider(height: 30, color: Colors.grey.shade400),
                SizedBox(height: 20),
                buildPasswordField('New password'),
                SizedBox(height: 40),
                buildPasswordField('Confirm new password'),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green.shade800, // text color
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data
                      }
                    },
                    child: Text('Update Password'),
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
    return TextFormField(
      style: TextStyle(color: Colors.grey), // Text color
      obscureText: !(_passwordVisible && label == 'Current password'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey), // Label color
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green), // Border color
        ),
        suffixIcon: label == 'Current password'
            ? IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.green, // Icon color
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ) : null,
        errorMaxLines: 3,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (!isValidPassword(value)) {
          return 'create a unique password. include 9 characters minimum with 1 Capital letter, 1 lower casa, 1 number or 1 special character <>~@#\$%^&*()\'';
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
