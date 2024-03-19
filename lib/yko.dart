// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _loginPressed(BuildContext context) {
//     // You can implement your authentication logic here.
//     // For this example, we'll simply show a dialog with the entered username and password.
//     final username = _usernameController.text;
//     final password = _passwordController.text;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Login Information'),
//           content: Text('Username: $username\nPassword: $password'),
//           actions: <Widget>[
//             FlatButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _signupPressed(context);
//               },
//               child: Text('Signup'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _signupPressed {
//   _signupPressed(BuildContext context);
// }

// RaisedButton({required Null Function() onPressed, required Text child}) {}

// FlatButton({required Null Function() onPressed, required Text child}) {}
