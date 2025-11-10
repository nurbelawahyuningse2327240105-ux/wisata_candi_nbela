import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class SignInScreen extends StatefulWidget{
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TODO: 1. Deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Pasang Appbar
      appBar: AppBar(title: Text('Sign In'),),

      //TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                  // TODO: 4 Atur mainAxisALlignment dan crossAxisAllignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //TODO: 5 Pasang textFormField nama pengguna
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Nama Pengguna",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    //TODO: 6 Pasang texFormField kata sandi
                    SizedBox(height: 28),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Kata Sandi",
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: (){
                            _obscurePassword = !_obscurePassword;
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    //TODO: 7 Pasang elevatedbutton sign in
                    SizedBox(height: 28),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text('Sign In')),
                    //TODO 8: Pasang Textbutton Sign Up
                    SizedBox(height: 18),
                    // TextButton(
                    //     onPressed: (){},
                    //     child: Text('Belum punya akun? Daftar di sini.')),
                    RichText(
                        text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Daftar di sini',
                                style: TextStyle(
                                    color: Colors.blue, // warna text
                                    decoration: TextDecoration.underline,
                                    fontSize: 16
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){},
                              ),
                            ]
                        ))
                  ],
                )),
          ),),
      ),
    );
  }
}