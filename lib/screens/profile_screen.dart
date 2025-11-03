import 'package:flutter/material.dart';
import '../widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. deklarasikan variabel yang dibutuhkan
  bool isSignedIn = true; // ubah ke true untuk menampilkan icon kamera/edit (sesuai slide)

  // contoh data pengguna
  String userName = 'Satria Dimaz Mahendra';
  String userEmail = 'Dimaz@gmail.com';
  int favoriteCandiCount = 2;

  void signIn() {
    setState(() {
      isSignedIn = true;
    });
  }

  void signOut() {
    setState(() {
      isSignedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Container ungu di bagian atas
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // beri ruang supaya avatar tumpang tindih sesuai instruksi
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0), // ~200 - 50 pada slide
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            // container pembungkus untuk memudahkan posisi
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/placeholder_image.png'),
                            ),
                          ),
                          // camera icon conditionally shown
                          if (isSignedIn)
                            Positioned(
                              right: -6,
                              bottom: -6,
                              child: Material(
                                elevation: 2,
                                shape: const CircleBorder(),
                                color: Colors.white,
                                child: IconButton(
                                  onPressed: () {
                                    // TODO: open modal bottom sheet in future per materi
                                  },
                                  icon: const Icon(Icons.camera_alt),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                  // Nama
                  Text(
                    userName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Divider & info
                  const SizedBox(height: 12),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 12),

                  // ProfileInfo: tiga baris
                  ProfileInfoItem(
                    icon: Icons.person,
                    label: 'Full Name',
                    value: userName,
                    iconColor: Colors.deepPurple,
                    showEditIcon: isSignedIn,
                    onEditPressed: () {
                      // TODO: implement edit name per materi pertemuan
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit name tapped')));
                    },
                  ),

                  const SizedBox(height: 4),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 4),

                  ProfileInfoItem(
                    icon: Icons.email,
                    label: 'Email',
                    value: userEmail,
                    iconColor: Colors.deepPurple,
                    showEditIcon: isSignedIn,
                    onEditPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit email tapped')));
                    },
                  ),

                  const SizedBox(height: 4),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 4),

                  ProfileInfoItem(
                    icon: Icons.favorite,
                    label: 'Favorite Candi',
                    value: favoriteCandiCount == 0 ? '' : favoriteCandiCount.toString(),
                    iconColor: Colors.deepPurple,
                    showEditIcon: false,
                    onEditPressed: null,
                  ),

                  const SizedBox(height: 20),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 8),

                  // ProfileAction
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        if (isSignedIn) {
                          signOut();
                        } else {
                          signIn();
                        }
                      },
                      child: Text(isSignedIn ? 'Sign Out' : 'Sign In'),
                    ),
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