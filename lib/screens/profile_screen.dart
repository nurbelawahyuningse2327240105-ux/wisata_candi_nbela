import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = 'Nabela'; // Example name
  String userName = 'Bela'; // Example username
  int favoriteCandiCount = 0;
  late Color iconColor;

  //5. implementasi fungsi signIn
  void signIn() {
    // setState(() {
    //   isSignedIn = !isSignedIn;
    //    userName = 'Bela';
    //    fullName = 'Nabela';
    //    favoriteCandiCount = 3;
    // });
    Navigator.pushNamed(context, "/signin");
  }

  //6. implementasi fungsi signOut
  void signOut() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);

    setState(() {
      isSignedIn = !isSignedIn;
      userName = '';
      fullName = '';
    });
  }

  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSignedIn = prefs.getBool("isSignedIn") ?? false;
    });
  }

  void _identitas() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString("fullname") ?? "";
      userName = prefs.getString("username") ?? "";
    });
    final keyString = prefs.getString('key') ?? '';
    final ivString = prefs.getString('iv') ?? '';
    final encrypt.Key key = encrypt.Key.fromBase64(keyString);
    final iv = encrypt.IV.fromBase64(ivString);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    fullName = encrypter.decrypt64(fullName, iv: iv);
    userName = encrypter.decrypt64(userName, iv: iv);
  }

  @override
  void initState() {
    _checkSignInStatus();
    _identitas();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO: 2. Buat bagian ProfileHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                            AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // TODO: 3. Buat bagian ProfileInfo yang berisi info profil
                const SizedBox(height: 20),
                const Divider(color: Colors.deepPurple),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Nama',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $fullName',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $favoriteCandiCount',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                isSignedIn
                    ? TextButton(
                  onPressed: signOut,
                  child: const Text('Sign Out'),
                )
                    : TextButton(
                  onPressed: signIn,
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}