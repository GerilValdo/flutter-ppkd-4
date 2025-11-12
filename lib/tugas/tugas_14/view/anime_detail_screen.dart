import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/anime_model.dart' as model;

class AnimeDetailScreen extends StatelessWidget {
  final model.Datum anime;

  const AnimeDetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        anime.images?['jpg']?.largeImageUrl ??
        'https://via.placeholder.com/400';
    // final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ditambahkan ke favorit ❤️")),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // 🔹 Parallax background
          Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(color: Colors.black.withOpacity(0.45)),
            ),
          ),

          // 🔹 Main scrollable content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "anime_${anime.malId}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                      imageUrl,
                      height: 340,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🎬 Judul
                Text(
                  anime.title ?? "No Title",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                if (anime.titleEnglish != null &&
                    anime.titleEnglish!.isNotEmpty)
                  Text(
                    anime.titleEnglish!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                const SizedBox(height: 20),

                // ⭐ Info ringkas (card style)
                Card(
                  color: Colors.black.withOpacity(0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _infoItem(
                          Icons.star,
                          "Skor",
                          anime.score?.toString() ?? '-',
                        ),
                        _infoItem(Icons.movie, "Tipe", anime.type ?? 'Unknown'),
                        _infoItem(
                          Icons.playlist_play,
                          "Episode",
                          anime.episodes?.toString() ?? '-',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 📖 Sinopsis
                _sectionContainer(
                  title: "Sinopsis",
                  child: Text(
                    anime.synopsis ?? "Tidak ada sinopsis tersedia.",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 📂 Informasi tambahan
                if (anime.year != null || anime.season != null)
                  _sectionContainer(
                    title: "Informasi Tambahan",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                          Icons.calendar_today,
                          "Tahun",
                          "${anime.year ?? '-'}",
                        ),
                        _buildInfoRow(
                          Icons.wb_sunny,
                          "Musim",
                          anime.season?.toString().split('.').last ?? '-',
                        ),
                        _buildInfoRow(
                          Icons.info,
                          "Status",
                          anime.status?.toString().split('.').last ?? '-',
                        ),
                        _buildInfoRow(
                          Icons.book,
                          "Sumber",
                          anime.source?.toString().split('.').last ?? '-',
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 30),

                // 🎥 Tombol aksi (contoh: trailer)
                // ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.indigoAccent,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(25),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 28,
                //       vertical: 12,
                //     ),
                //   ),
                //   onPressed: () {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text("Fitur trailer belum tersedia 🎬"),
                //       ),
                //     );
                //   },
                //   icon: const Icon(Icons.play_arrow_rounded),
                //   label: const Text(
                //     "Tonton Trailer",
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.amberAccent, size: 24),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _sectionContainer({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
