import 'package:flutter/material.dart';
import 'package:my_project/New%20dashboard.dart';
import 'package:my_project/specialsignup.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) {
    setState(() {
      rememberMe = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {},
                    ),
                    Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Implement forgot password functionality here
                  },
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Newdashboard()),
                );
                // Implement login functionality here
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text('Or login with:'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Newdashboard()),
                    );

                    // Implement Facebook login here
                  },
                  icon: Icon(Icons.facebook),
                  label: Text('Facebook'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement Google login here
                  },
                  icon: Icon(Icons.snapchat),
                  label: Text('snapchat'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupApp()),
                );
                // Implement sign-up navigation here
              },
              child: Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
