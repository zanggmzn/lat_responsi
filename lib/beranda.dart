import 'package:flutter/material.dart';
import 'package:lat_responsi/nasional.dart';
import 'package:lat_responsi/olahraga.dart';
import 'package:lat_responsi/teknologi.dart';
import 'package:lat_responsi/terbaru.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<String> buttonTexts = ['TERBARU', 'NASIONAL', 'OLAHRAGA', 'TEKNOLOGI'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff0f1f5),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.35,
                child: Image.network(
                  'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png',
                ),
              ),
              const SizedBox(height: 100),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 5, 5)),
                      ),
                      onPressed: () {
                        // Action when button is pressed
                        print('Button $index pressed.');
                        // Navigasi ke halaman yang berbeda-beda
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanTerbaru()),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanNasional()),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanOlahraga()),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanTeknologi()),
                          );
                        }
                      },
                      child: Text(buttonTexts[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
