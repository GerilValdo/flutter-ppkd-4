import 'package:flutter/material.dart';
import 'package:ppkd_batch4/config/book_image.dart';
import 'package:ppkd_batch4/models/book_model.dart';

class ListModelBook extends StatelessWidget {
  const ListModelBook({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookModel> daftarBuku = [
      BookModel(
        id: 1,
        judul: 'Laskar Pelangi',
        description:
            'Kisah inspiratif tentang perjuangan anak-anak di Belitung mengejar pendidikan.',
        image: BookImage.laskarPelangi,
      ),
      BookModel(
        id: 2,
        judul: 'Bumi Manusia',
        description:
            'Novel karya Pramoedya Ananta Toer yang menggambarkan perjuangan melawan kolonialisme.',
        image: BookImage.bumiManusia,
      ),
      BookModel(
        id: 3,
        judul: 'Negeri 5 Menara',
        description:
            'Cerita tentang persahabatan dan semangat menuntut ilmu di pesantren.',
        image: BookImage.negeri5Menara,
      ),
      BookModel(
        id: 4,
        judul: 'Ayat-Ayat Cinta',
        description:
            'Kisah cinta penuh makna dengan nilai-nilai Islam dan perjuangan hidup.',
        image: BookImage.ayatAyatCinta,
      ),
      BookModel(
        id: 5,
        judul: 'Sang Pemimpi',
        description:
            'Kisah lanjutan Laskar Pelangi tentang mimpi besar dan perjuangan menggapainya.',
        image: BookImage.sangPemimpi,
      ),
      BookModel(
        id: 6,
        judul: 'Dilan 1990',
        description:
            'Romansa remaja antara Dilan dan Milea dengan gaya khas Bandung.',
        image: BookImage.dilan1990,
      ),
      BookModel(
        id: 7,
        judul: 'Hujan',
        description:
            'Karya Tere Liye tentang kehilangan, cinta, dan bencana alam.',
        image: BookImage.hujan,
      ),
      BookModel(
        id: 8,
        judul: 'Critical Eleven',
        description:
            'Sebuah kisah cinta dewasa yang realistis dengan konflik rumah tangga.',
        image: BookImage.criticalEleven,
      ),
      BookModel(
        id: 9,
        judul: 'Cantik Itu Luka',
        description:
            'Novel epik karya Eka Kurniawan tentang cinta, keindahan, dan penderitaan.',
        image: BookImage.cantikItuLuka,
      ),
      BookModel(
        id: 10,
        judul: 'Koala Kumal',
        description: 'Kumpulan kisah lucu dan menyentuh karya Raditya Dika.',
        image: BookImage.koalaKumal,
      ),
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: daftarBuku.length,
      itemBuilder: (BuildContext context, int index) {
        final item = daftarBuku[index];
        return Card(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 200, child: Image.asset(item.image)),
                  Text(
                    item.judul,
                    overflow: TextOverflow.ellipsis,
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
