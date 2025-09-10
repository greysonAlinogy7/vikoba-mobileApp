import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vikoba_mobileapp/screen/registration.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/login.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter your Email"),
                      MinLengthValidator(
                        10,
                        errorText: "include @ sign in your input text",
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter the valid password"),
                      MinLengthValidator(
                        10,
                        errorText:
                            "password should contain upper case and special character",
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password",
                      prefixIcon: Icon(Icons.lock),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "I don't have account?",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const Registration(),
                            ),
                          );
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      child: SizedBox(
                        width: 700,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              print("form validated");
                            }
                          },

                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
