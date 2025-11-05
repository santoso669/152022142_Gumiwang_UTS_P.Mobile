import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  // Data kontak statis
  final List<Map<String, String>> kontakList = [
    {"nama": "Agum", "telepon": "081234567890", "foto": "assets/foto_profil.jpg"},
    {"nama": "Budi", "telepon": "081234567891", "foto": "assets/foto_profil.jpg"},
    {
      "nama": "Citra",
      "telepon": "081234567892",
      "foto": "assets/foto_profil.jpg",
    },
    {"nama": "Dewi", "telepon": "081234567893", "foto": "assets/foto_profil.jpg"},
    {"nama": "Eka", "telepon": "081234567894", "foto": "assets/foto_profil.jpg"},
    {
      "nama": "Fajar",
      "telepon": "081234567895",
      "foto": "assets/foto_profil.jpg",
    },
    {
      "nama": "Gilang",
      "telepon": "081234567896",
      "foto": "assets/foto_profil.jpg",
    },
    {"nama": "Hana", "telepon": "081234567897", "foto": "assets/foto_profil.jpg"},
    {
      "nama": "Indah",
      "telepon": "081234567898",
      "foto": "assets/foto_profil.jpg",
    },
    {"nama": "Joko", "telepon": "081234567899", "foto": "assets/foto_profil.jpg"},
    {"nama": "Kiki", "telepon": "081234567900", "foto": "assets/foto_profil.jpg"},
    {"nama": "Lina", "telepon": "081234567901", "foto": "assets/foto_profil.jpg"},
    {"nama": "Mila", "telepon": "081234567902", "foto": "assets/foto_profil.jpg"},
    {"nama": "Nino", "telepon": "081234567903", "foto": "assets/foto_profil.jpg"},
    {"nama": "Oka", "telepon": "081234567904", "foto": "assets/foto_profil.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: kontakList.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final kontak = kontakList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(kontak["foto"]!),
                radius: 25,
              ),
              title: Text(
                kontak["nama"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(kontak["telepon"]!),
              trailing: Icon(Icons.phone, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
