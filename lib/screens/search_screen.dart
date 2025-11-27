import 'package:flutter/material.dart';

import '../models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value){
                  setState(() {
                    _searchQuery = value;
                  });
                },
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

        ],
      ),
    );
  }
}

