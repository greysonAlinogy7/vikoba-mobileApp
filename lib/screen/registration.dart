import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vikoba_mobileapp/screen/LoginScreen.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/signup.png"),
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
                      RequiredValidator(errorText: "Enter the username"),
                      MinLengthValidator(
                        10,
                        errorText: "less than ten characters",
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "username",
                      prefixIcon: Icon(Icons.person),
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
                      RequiredValidator(errorText: "Enter the phone number"),
                      MinLengthValidator(10, errorText: "Enter ten numbers"),
                      PatternValidator(
                        r'(^[0,9]{10}$)',
                        errorText: 'enter vaid mobile number',
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: "Enter phone number",
                      labelText: "phone number",
                      prefixIcon: Icon(Icons.phone),
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
                      RequiredValidator(errorText: "Enter the Nida number"),
                      MinLengthValidator(
                        10,
                        errorText: "Enter fifteen characters",
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: "Nida number",
                      labelText: "Nida",
                      prefixIcon: Icon(Icons.perm_identity),
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
                      RequiredValidator(
                        errorText: "Enter the registration number",
                      ),
                      MinLengthValidator(
                        10,
                        errorText: "enter twelve charachers",
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: "Enter REG NO",
                      labelText: "registration",
                      prefixIcon: Icon(Icons.numbers),
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
                        "I have account",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const Loginscreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
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
                            if (_formKey.currentState!.validate()) {
                              print("form validated");
                            }
                          },

                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 50, width: 50, child: Text("data")),
                        Container(height: 50, width: 50, child: Text("data")),
                        Container(height: 50, width: 50, child: Text("data")),
                      ],
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
