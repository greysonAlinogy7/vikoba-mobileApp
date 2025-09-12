import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vikoba_mobileapp/model/User.dart';
import 'package:vikoba_mobileapp/screen/LoginScreen.dart';
import 'package:vikoba_mobileapp/service/Service.dart';

import '../widget/background.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nidaNumberController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final Service _service = Service();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _phoneNumberController.dispose();
    _nidaNumberController.dispose();
    _registrationController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Helper to reduce boilerplate for input decoration
  InputDecoration _inputDecoration(String label, String hint, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
    );
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final userData = {
        "email": _emailController.text,
        "username": _usernameController.text,
        "phone": _phoneNumberController.text,
        "nida": _nidaNumberController.text,
        "regNo": _registrationController.text,
        "password": _passwordController.text,
      };



      final User? result = await _service.createUser(userData);


      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Registration successful")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Loginscreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration failed. Try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Grid
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: GridBackgroundPainter(),
          ),

          // Foreground Scrollable Form
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Logo
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/signup.png"),
                    ),
                  ),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter your Email"),
                      EmailValidator(errorText: "Enter a valid email"),
                    ]),
                    decoration: _inputDecoration(
                      "Email",
                      "Enter email",
                      Icons.email,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Username
                  TextFormField(
                    controller: _usernameController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter the username"),
                      MinLengthValidator(4, errorText: "At least 4 characters"),
                    ]),
                    decoration: _inputDecoration(
                      "Username",
                      "Enter username",
                      Icons.person,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Phone Number
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter the phone number"),
                      PatternValidator(
                        r'^[0-9]{10}$',
                        errorText: 'Enter a valid 10-digit mobile number',
                      ),
                    ]),
                    decoration: _inputDecoration(
                      "Phone number",
                      "Enter phone number",
                      Icons.phone,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // NIDA Number
                  TextFormField(
                    controller: _nidaNumberController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter the NIDA number"),
                      MinLengthValidator(
                        15,
                        errorText: "Must be 15 characters",
                      ),
                      MaxLengthValidator(
                        15,
                        errorText: "Must be 15 characters",
                      ),
                    ]),
                    decoration: _inputDecoration(
                      "NIDA",
                      "Enter NIDA number",
                      Icons.perm_identity,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Registration Number
                  TextFormField(
                    controller: _registrationController,
                    validator: MultiValidator([
                      RequiredValidator(
                        errorText: "Enter the registration number",
                      ),
                      MinLengthValidator(
                        12,
                        errorText: "Must be 12 characters",
                      ),
                      MaxLengthValidator(
                        12,
                        errorText: "Must be 12 characters",
                      ),
                    ]),
                    decoration: _inputDecoration(
                      "Registration",
                      "Enter REG NO",
                      Icons.numbers,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter a valid password"),
                      PatternValidator(
                        r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,}$',
                        errorText:
                            "Password must have uppercase, special char & 8+ chars",
                      ),
                    ]),
                    decoration: _inputDecoration(
                      "Password",
                      "Enter password",
                      Icons.lock,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Already have account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "I have an account",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginscreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  // Register Button
                  // full width
                  ElevatedButton(
                    onPressed: _registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
