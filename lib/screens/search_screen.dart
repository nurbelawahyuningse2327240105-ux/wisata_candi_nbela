import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../models/candi.dart';
=======
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';
>>>>>>> 0a63f306185f8b1076cee1b67213018922c0648a

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
<<<<<<< HEAD
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  List<Candi> _filteredCandis = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat appbar dengan judul pencarian candi
      appBar: AppBar(title: Text('pencarian Candi'),),
      //TODO: 3. Buat body berupa column
      body: Column(
        children: [
          //TODO: 4. Buat TextField pencarian sebagai anak dari column
          Padding(
            padding: EdgeInsets.all(16),
            child : Container(
=======
//   TODO: 1. Deklarasi variabel yang dibutuhkan

  List<Candi> _filteredCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   TODO: 2. Buat appbar dengan judul pencarian candi
      appBar: AppBar(title: Text('Pencarian Candi'),),
      //   TODO: 3. Buat body berupa column
      body: Column(
        children: [
          //   TODO: 4. Buat TextField pencarian sebagai anak dari column
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
>>>>>>> 0a63f306185f8b1076cee1b67213018922c0648a
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
<<<<<<< HEAD
                onChanged: (value){
=======
                onChanged: (value) {
>>>>>>> 0a63f306185f8b1076cee1b67213018922c0648a
                  setState(() {
                    _searchQuery = value;
                  });
                },
<<<<<<< HEAD
                //TODO: 6. Implement5s fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Cari Candi....',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.deepPurple

                    ),
                  //TODO: 7. implementasi pengosongan input
                  border: InputBorder.none,
                  contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            )
          )
          //TODO: 5. buat ListView hasil pencarian sebagai anak dari colum
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {

              },
            ),
          )

=======
                // TODO: 6. Implementasi fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Cari candi...',
                  prefixIcon: Icon(
                      Icons.search,
                      color: Colors.deepPurple
                  ),
                  // TODO 7. Implementasi pengosongan input
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          //   TODO: 5. Buat ListView hasil pencarian sebagai anak dari Column
          Expanded(
            child: ListView.builder(
                itemCount: _filteredCandis.length,
                itemBuilder: (context, index) {
                  final candi = _filteredCandis[index];
                  // TODO: 8. Implementasi GestureDetector dan Hero animation
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              candi.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                candi.location,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
>>>>>>> 0a63f306185f8b1076cee1b67213018922c0648a
        ],
      ),
    );
  }
<<<<<<< HEAD
}

=======
}
>>>>>>> 0a63f306185f8b1076cee1b67213018922c0648a
