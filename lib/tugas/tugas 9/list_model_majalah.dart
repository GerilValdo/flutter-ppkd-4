import 'package:flutter/material.dart';
import 'package:ppkd_batch4/config/majalah_image.dart';
import 'package:ppkd_batch4/models/majalah_model.dart';

class ListModelMajalah extends StatelessWidget {
  const ListModelMajalah({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MajalahModel> daftarMajalah = [
      MajalahModel(
        id: 1,
        judul: 'National Geographic Indonesia',
        description:
            'Majalah sains dan lingkungan yang menyoroti keindahan alam dan budaya dunia.',
        image: MajalahImage.nationalGeographic,
      ),
      MajalahModel(
        id: 2,
        judul: 'Tempo',
        description:
            'Majalah berita mingguan yang membahas politik, ekonomi, dan budaya Indonesia.',
        image: MajalahImage.tempo,
      ),
      MajalahModel(
        id: 3,
        judul: 'Forbes Indonesia',
        description:
            'Majalah bisnis yang mengulas tokoh sukses, investasi, dan tren ekonomi.',
        image: MajalahImage.forbesIndonesia,
      ),
      MajalahModel(
        id: 4,
        judul: 'Bobo',
        description:
            'Majalah anak-anak legendaris Indonesia dengan cerita dan pengetahuan menarik.',
        image: MajalahImage.bobo,
      ),
      MajalahModel(
        id: 5,
        judul: 'Femina',
        description:
            'Majalah gaya hidup wanita dengan topik kecantikan, karier, dan keluarga.',
        image: MajalahImage.femina,
      ),
      MajalahModel(
        id: 6,
        judul: 'AutoBild Indonesia',
        description:
            'Majalah otomotif yang membahas review mobil, teknologi, dan tips berkendara.',
        image: MajalahImage.autobildIndonesia,
      ),
      MajalahModel(
        id: 7,
        judul: 'Chip Indonesia',
        description:
            'Majalah teknologi dan komputer yang berisi ulasan gadget dan tips IT.',
        image: MajalahImage.chipIndonesia,
      ),
      MajalahModel(
        id: 8,
        judul: 'Trubus',
        description:
            'Majalah pertanian yang berisi informasi tanaman, peternakan, dan agribisnis.',
        image: MajalahImage.trubus,
      ),
      MajalahModel(
        id: 9,
        judul: 'Hai',
        description:
            'Majalah remaja pria berisi musik, gaya hidup, dan kisah inspiratif anak muda.',
        image: MajalahImage.hai,
      ),
      MajalahModel(
        id: 10,
        judul: 'Cosmopolitan Indonesia',
        description:
            'Majalah modern untuk wanita muda tentang gaya hidup, fashion, dan hubungan.',
        image: MajalahImage.cosmopolitanIndonesia,
      ),
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: daftarMajalah.length,
      itemBuilder: (BuildContext context, int index) {
        final item = daftarMajalah[index];
        return Card(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 200, child: Image.asset(item.image)),
                  Text(
                    item.judul,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(item.description, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
