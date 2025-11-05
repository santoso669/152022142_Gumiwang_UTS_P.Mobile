import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  final List<Map<String, String>> beritaList = const [
    {
      "judul": "Hubungan dengan Xabi Alonso Kian Retak, Vinicius Siap Angkat Kaki dari Real Madrid pada 2026",
      "gambar": "assets/images/berita2.jpg",
      "tanggal": "27 Oktober 2025 | Bola.com",
      "isi":
          "Situasi di Real Madrid tampaknya memanas setelah hubungan Vinicius Junior dengan pelatih Xabi Alonso dikabarkan semakin renggang. "
          "Menurut laporan media Spanyol, pemain asal Brasil itu dikabarkan tidak lagi nyaman dengan gaya kepelatihan Alonso yang dinilai terlalu kaku.\n\n"
          "Vinicius, yang selama ini menjadi tumpuan serangan Los Blancos, merasa kontribusinya mulai kurang dihargai. "
          "Beberapa sumber menyebutkan bahwa sang pemain sudah mempertimbangkan untuk mencari klub baru jika situasi tidak membaik hingga musim 2026.\n\n"
          "Real Madrid sendiri belum mengeluarkan pernyataan resmi, namun rumor kepergian Vinicius mulai menjadi perbincangan hangat di kalangan fans dan media."
    },
    {
      "judul": "Resmi! FIFA ASEAN Cup Bakal Digelar, Indonesia Siap Jadi Raja",
      "gambar": "assets/images/berita1.jpg",
      "tanggal": "27 Oktober 2025 | Kompas.com",
      "isi":
          "FIFA meluncurkan turnamen baru bertajuk FIFA ASEAN Cup yang akan diikuti oleh 11 negara di regional Asia Tenggara.\n\n"
          "Presiden FIFA, Gianni Infantino mengumumkan penyelenggaraan ajang tersebut lewat konferensi pers bersama para pemimpin negara ASEAN. "
          "FIFA dan ASEAN telah menandatangani Nota Kesepahaman (MoU) baru yang menegaskan komitmen FIFA dalam mendukung pengembangan sepak bola di Asia Tenggara.\n\n"
          "Turnamen ini akan diikuti oleh 11 negara anggota ASEAN dan digelar dengan format mirip FIFA Arab Cup. "
          "Indonesia disebut-sebut menjadi salah satu kandidat kuat tuan rumah perdana turnamen tersebut."
    },
    {
      "judul": "Atletico Madrid Tundukkan Betis 2-0 di Sevilla",
      "gambar": "assets/images/berita3.jpg",
      "tanggal": "26 Oktober 2025 | RRI.co.id",
      "isi":
          "Atletico Madrid berhasil meraih kemenangan penting dengan skor 2-0 atas Real Betis di laga lanjutan La Liga yang digelar di Stadion Benito Villamarín, Sevilla.\n\n"
          "Dua gol kemenangan Los Rojiblancos dicetak oleh Antoine Griezmann dan Alvaro Morata pada masing-masing babak.\n\n"
          "Kemenangan ini membuat Atletico naik ke posisi empat besar klasemen sementara dan terus menempel Real Madrid di papan atas."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita Terkini",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                // buka detail berita
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailBeritaPage(
                      judul: berita["judul"]!,
                      gambar: berita["gambar"]!,
                      tanggal: berita["tanggal"]!,
                      isi: berita["isi"]!,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.asset(
                      berita["gambar"]!,
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            berita["judul"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            berita["tanggal"]!,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ✅ Halaman detail berita
class DetailBeritaPage extends StatelessWidget {
  final String judul;
  final String gambar;
  final String tanggal;
  final String isi;

  const DetailBeritaPage({
    super.key,
    required this.judul,
    required this.gambar,
    required this.tanggal,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(gambar, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              judul,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, height: 1.3),
            ),
            const SizedBox(height: 8),
            Text(
              tanggal,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              isi,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
