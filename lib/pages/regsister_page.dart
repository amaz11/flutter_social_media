import 'package:flutter/material.dart';
import 'package:socialmedia/api/auth_service.dart';
import '../meassages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formState = GlobalKey();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final RegExp _exp = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          centerTitle: true,
          title: const Text(
            "Sign Up",
            textAlign: TextAlign.center,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: Icon(
                    Icons.telegram,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _userName,
                  decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name can't be empty.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email can't be empty.";
                    }
                    if (_exp.hasMatch(value)) {
                      return "Enter Valid Email Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Passwordcon't not be empty";
                    }
                    if (value.length < 6) {
                      return "Pssword length can't be less than 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      FireBaseAuthService()
                          .signUP(
                              email: _email.text,
                              password: _password.text,
                              name: _userName.text)
                          .then((value) => displayMessage(value!, context));
                      _userName.clear();
                      _email.clear();
                      _password.clear();
                    },
                    child: const Text("Sign Up")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have a account. "),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Sign-in"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
