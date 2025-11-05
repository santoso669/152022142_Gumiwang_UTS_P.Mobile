import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CuacaPage extends StatefulWidget {
  @override
  _CuacaPageState createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  late VideoPlayerController _controller;

  final Map<String, dynamic> dataCuaca = {
    "kota": "Bandung",
    "suhu": "27°C",
    "kelembapan": "65%",
    "kondisi": "Cerah Berawan",
  };

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/cuaca.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dataCuaca["kota"],
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // VIDEO CUACA
                  _controller.value.isInitialized
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        )
                      : const SizedBox(
                          height: 180,
                          child: Center(child: CircularProgressIndicator()),
                        ),

                  const SizedBox(height: 20),

                  Text(
                    dataCuaca["kondisi"],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.thermostat, color: Colors.red),
                          Text("Suhu: ${dataCuaca['suhu']}"),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.water_drop, color: Colors.blue),
                          Text("Kelembapan: ${dataCuaca['kelembapan']}"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
