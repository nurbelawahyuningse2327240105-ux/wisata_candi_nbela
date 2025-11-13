import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Candi> _filteredCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  void _filterCandis(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredCandis = candiList.where((candi) {
        return candi.name.toLowerCase().contains(_searchQuery) ||
            candi.location.toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _filteredCandis = candiList;
      _searchQuery = '';
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pencarian Candi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // 🔍 Search Field
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari candi ...',
                  hintStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.deepPurple),
                    onPressed: _clearSearch,
                  )
                      : null,
                ),
                onChanged: _filterCandis,
              ),
            ),
            const SizedBox(height: 16),

            // 🏯 Daftar hasil pencarian
            Expanded(
              child: _filteredCandis.isEmpty
                  ? const Center(
                child: Text(
                  'Tidak ada candi ditemukan.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
                  : ListView.builder(
                itemCount: _filteredCandis.length,
                itemBuilder: (context, index) {
                  final candi = _filteredCandis[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          candi.imageAsset,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        candi.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        candi.location,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}