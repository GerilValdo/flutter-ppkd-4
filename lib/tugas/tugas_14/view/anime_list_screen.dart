import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ppkd_batch4/tugas/tugas_14/service/anime_service.dart';
import '../models/anime_model.dart' as model;
import 'anime_detail_screen.dart';

class AnimeListScreen extends StatefulWidget {
  const AnimeListScreen({super.key});

  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  final _animeService = AnimeService();
  final _searchController = TextEditingController();
  List<model.Datum> _allAnime = [];
  List<model.Datum> _filteredAnime = [];
  bool _isLoading = true;
  bool _isSearching = false;
  String? _selectedGenre;

  final List<Map<String, dynamic>> _genres = [
    {'id': 1, 'name': 'Action'},
    {'id': 2, 'name': 'Adventure'},
    {'id': 4, 'name': 'Comedy'},
    {'id': 8, 'name': 'Drama'},
    {'id': 10, 'name': 'Fantasy'},
    {'id': 14, 'name': 'Horror'},
    {'id': 22, 'name': 'Romance'},
    {'id': 24, 'name': 'Sci-Fi'},
    {'id': 30, 'name': 'Sports'},
  ];

  @override
  void initState() {
    super.initState();
    _loadAnime();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _loadAnime() async {
    setState(() => _isLoading = true);
    try {
      final result = await _animeService.fetchAnime();
      setState(() {
        _allAnime = result.data ?? [];
        _filteredAnime = _allAnime;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal memuat anime: $e")));
    }
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _isSearching = query.isNotEmpty;
      _filteredAnime = _allAnime.where((anime) {
        final title = anime.title?.toLowerCase() ?? '';
        return title.contains(query);
      }).toList();
    });
  }

  void _filterByGenre(String? genreName) async {
    setState(() => _isLoading = true);
    if (genreName == null) {
      await _loadAnime();
      setState(() => _selectedGenre = null);
      return;
    }

    final genreId = _genres.firstWhere((g) => g['name'] == genreName)['id'];
    final result = await _animeService.fetchAnimeByGenre(genreId.toString());
    setState(() {
      _selectedGenre = genreName;
      _allAnime = result.data ?? [];
      _filteredAnime = _allAnime;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 110,
        elevation: 6,
        shadowColor: Colors.black45,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.shade600.withOpacity(0.85),
                    Colors.indigo.shade400.withOpacity(0.8),
                    Colors.indigo.shade200.withOpacity(0.75),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          '🎌 Anime Explorer',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                // 🔍 Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onChanged: (v) => _onSearchChanged(),
                      decoration: InputDecoration(
                        hintText: "Cari anime favoritmu...",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        suffixIcon: _isSearching
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() => _filteredAnime = _allAnime);
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ),

                // 🎭 Filter Genre
                const SizedBox(height: 6),
                _buildGenreFilterBar(),
              ],
            ),
          ),
        ),
      ),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _filteredAnime.isEmpty
          ? const Center(
              child: Text(
                "Tidak ada anime ditemukan 😢",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadAnime,
              color: Colors.indigoAccent,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 800
                      ? 4
                      : 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.68,
                ),
                itemCount: _filteredAnime.length,
                itemBuilder: (context, index) {
                  final anime = _filteredAnime[index];
                  final imageUrl =
                      anime.images?['jpg']?.largeImageUrl ??
                      'https://via.placeholder.com/300';

                  // Hitung delay animasi berdasarkan posisi index
                  final animationDelay = (index % 10) * 100;

                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 600 + animationDelay),
                    curve: Curves.easeOutCubic,
                    builder: (context, double opacity, child) {
                      return Opacity(
                        opacity: opacity,
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            30 * (1 - opacity),
                          ), // parallax saat muncul
                          child: child,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                AnimeDetailScreen(anime: anime),
                            transitionsBuilder: (_, animation, __, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: "anime_${anime.malId}",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.broken_image,
                                  color: Colors.white54,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black87,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        anime.title ?? "No Title",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          height: 1.3,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            anime.score?.toString() ?? '-',
                                            style: const TextStyle(
                                              color: Colors.amber,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildGenreFilterBar() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _genres.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final genre = _genres[index];
          final bool isSelected = _selectedGenre == genre['name'];
          return GestureDetector( 
            onTap: () => _filterByGenre(isSelected ? null : genre['name']),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  genre['name'],
                  style: TextStyle(
                    color: isSelected ? Colors.indigo : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
