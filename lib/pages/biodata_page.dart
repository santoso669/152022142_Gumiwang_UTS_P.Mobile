import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();

  String? jenisKelamin = 'Laki-laki';
  String? prodi = 'Informatika';
  DateTime? tanggalLahir;
  String hasil = '';

  Future<void> pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        tanggalLahir = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/foto.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Form Biodata',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: nimController,
              decoration: InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            Text('Jenis Kelamin:', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Radio<String>(
                  value: 'Laki-laki',
                  groupValue: jenisKelamin,
                  onChanged: (value) {
                    setState(() {
                      jenisKelamin = value;
                    });
                  },
                ),
                const Text('Laki-laki'),
                Radio<String>(
                  value: 'Perempuan',
                  groupValue: jenisKelamin,
                  onChanged: (value) {
                    setState(() {
                      jenisKelamin = value;
                    });
                  },
                ),
                const Text('Perempuan'),
              ],
            ),
            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: prodi,
              decoration: InputDecoration(
                labelText: 'Program Studi',
                border: OutlineInputBorder(),
              ),
              items: ['Informatika', 'Sistem Informasi', 'Teknik Komputer'].map(
                (String val) {
                  return DropdownMenuItem<String>(value: val, child: Text(val));
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  prodi = value;
                });
              },
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tanggalLahir == null
                      ? 'Tanggal Lahir: Belum dipilih'
                      : 'Tanggal Lahir: ${tanggalLahir!.day}/${tanggalLahir!.month}/${tanggalLahir!.year}',
                ),
                ElevatedButton(
                  onPressed: () => pilihTanggal(context),
                  child: const Text('Pilih'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
                onPressed: () {
                  setState(() {
                    hasil =
                        'Nama: ${namaController.text}\n'
                        'NIM: ${nimController.text}\n'
                        'Jenis Kelamin: $jenisKelamin\n'
                        'Prodi: $prodi\n'
                        'Tanggal Lahir: ${tanggalLahir != null ? '${tanggalLahir!.day}/${tanggalLahir!.month}/${tanggalLahir!.year}' : '-'}';
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            if (hasil.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Text(hasil, style: const TextStyle(fontSize: 16)),
              ),
          ],
        ),
      ),
    );
  }
}
