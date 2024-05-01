import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';
import 'package:oway/Register_Login/HereglegchBurtgel.dart';
//import 'package:oway/Register_Login/VendorRegister/VendorRegister.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _phoneNumberController.text + "@gmail.com", // Use email as phone number
      password: _passwordController.text,
    );
    String userId = userCredential.user!.uid;
    String type = userCredential.user!.uid;
    // User successfully logged in, pass userId back
    Navigator.pop(context, userId);
  } catch (e) {
    // Handle login errors
    print("Error signing in: $e");
    // Show error message to user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Failed to sign in. Please check your credentials."),
    ));
  }
}

int selectedOption = 1; // Declare selectedOption as int
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/oway.png',
          height: 100,
          width: 100,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Нэвтрэх",
                  style: TextStyle(fontSize: 24, color: Colors.cyan, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Утасны дугаар",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                  Text('Хэрэглэгч'),
                  SizedBox(width: 20),
                  Radio(
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                  Text('Нийлүүлэгч'),
                ],
              ),
              SizedBox(height: 10,),
              TextButton(
              onPressed: () {
                if (selectedOption == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Burtgel()));
                  print("USER SHUU");
                } else {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => NiiluulegchRegister()));
                  print("VENDOR SHUU");
                }
              },
              style: ButtonStyle(
                alignment: Alignment.centerRight,
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 18)),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.transparent;
                    }
                    return null;
                  },
                ),
              ),
              child: Text("Бүртгүүлэх"),
            ),

              SizedBox(height: 30,),
              ElevatedButton(
                child: Text("Нэвтрэх", style: TextStyle(fontSize: 21),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
                ),
                onPressed: () {
                  _signInWithEmailAndPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}