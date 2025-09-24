import 'package:flutter/material.dart';
import '../../../../shared/design_tokens/app_colors.dart';
import '../../../../shared/design_tokens/app_typography.dart';
import '../influencer_detail_page.dart';

class InfluencerTab extends StatefulWidget {
  const InfluencerTab({super.key});

  @override
  State<InfluencerTab> createState() => _InfluencerTabState();
}

class _InfluencerTabState extends State<InfluencerTab> {
  String selectedCategory = '';
  String selectedSort = '';
  String searchQuery = '';
  bool showCategoryDropdown = false;
  bool showSortDropdown = false;
  bool showSearchResults = false;

  final List<String> categories = [
    'Moda',
    'Spor',
    'Güzellik',
    'Teknoloji',
    'Kozmetik',
    'Anne',
    'Doğal',
    'Sanat',
    'Gastronomi',
    'Tarım',
    'Seyahat',
    'Medya',
  ];

  final List<String> interestOptions = [
    'Sporcu',
    'Hayvansever',
    'Gezgin',
    'Yemek Gurmesi',
    'Moda & Stil',
    'Teknoloji Meraklısı',
    'Sağlık & Fitness',
    'Müzik Tutkunu',
    'Kitap Kurdu',
    'Sanat & Tasarım',
    'Oyunsever',
    'Doğa & Kampçı',
    'Anne & Bebek',
    'Makyaş & Güzellik',
    'Sinema & Dizi',
  ];


  final List<Map<String, String>> influencers = [
    {'name': 'Demet AKALIN', 'image': 'assets/images/ornek.jpeg'},
    {'name': 'Seda ÖNAL', 'image': 'assets/images/ornek.jpeg'},
    {'name': 'Okan KURT', 'image': 'assets/images/ornek.jpeg'},
    {'name': 'Orhan DEMİR', 'image': 'assets/images/ornek.jpeg'},
    {'name': 'Ayşe YILMAZ', 'image': 'assets/images/ornek.jpeg'},
    {'name': 'Mehmet KARA', 'image': 'assets/images/ornek.jpeg'},
  ];


  @override
  Widget build(BuildContext context) {

// 🔍 Dinamik filtreleme
    final filteredResults = influencers.where((result) {
      final name = result['name']!.toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();

    return Scaffold(
        extendBody: true,
        body: SafeArea(
        bottom: true,
        child: GestureDetector(
      onTap: () {
        setState(() {
          showCategoryDropdown = false;
          showSortDropdown = false;
          showSearchResults = false;
        });
      },
      child: Container(
        color: AppColors.backgroundSecondary,
        child: Column(
          children: [
            // Üst bar - Kategori, Arama, Önerilen
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  // Kategori Dropdown
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showCategoryDropdown = !showCategoryDropdown;
                          showSortDropdown = false;
                          showSearchResults = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedCategory.isEmpty ? 'Kategori' : selectedCategory,
                              style: AppTypography.bodyMedium.copyWith(
                                color: selectedCategory.isEmpty
                                    ? AppColors.textTertiary
                                    : AppColors.textPrimary,
                              ),
                            ),
                            Icon(
                              showCategoryDropdown
                                  ? Icons.keyboard_arrow_up
                                  : Icons.filter_alt_outlined,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Arama Butonu
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showSearchResults = !showSearchResults;
                          showCategoryDropdown = false;
                          showSortDropdown = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),

                  // Önerilen/Sıralama Dropdown
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showSortDropdown = !showSortDropdown;
                          showCategoryDropdown = false;
                          showSearchResults = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedSort.isEmpty ? 'İlgi Alanı' : selectedSort,
                              style: AppTypography.bodyMedium.copyWith(
                                color: selectedSort.isEmpty
                                    ? AppColors.textTertiary
                                    : AppColors.textPrimary,
                              ),
                            ),
                            Icon(
                              showSortDropdown
                                  ? Icons.keyboard_arrow_up
                                  : Icons.swap_vert,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // İçerik Alanı
            Expanded(
              child: Stack(
                children: [
                  // Ana Grid
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 90), // ✅ navbar için boşluk
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: influencers.length,
                      itemBuilder: (context, index) {
                        return _buildInfluencerCard(influencers[index]);
                      },
                    ),
                  ),

                  // Arama Sonuçları
                  if (showSearchResults)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha:0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🔍 Arama Input
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      setState(() {
                                        searchQuery = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                      "Aramak istediğiniz influencer adını ya da kategori yazın.",
                                      hintStyle: AppTypography.bodySmall.copyWith(
                                        color: AppColors.textTertiary,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.search, color: Colors.purple),
                              ],
                            ),
                            const SizedBox(height: 12),


                            // 🔥 Öneriler (yatay kaydırma)
                            if (searchQuery.isNotEmpty && filteredResults.isNotEmpty)
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: filteredResults.length,
                                  itemBuilder: (context, index) {
                                    final result = filteredResults[index];
                                    return Container(
                                      width: 90,
                                      margin: const EdgeInsets.only(right: 12),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12), // köşeleri yuvarlat
                                            child: Image.asset(
                                              result['image']!,
                                              width: 100,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            result['name']!,
                                            style: AppTypography.bodySmall,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )

                            else if (searchQuery.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Sonuç bulunamadı ❌",
                                  style: AppTypography.bodySmall.copyWith(color: Colors.grey),
                                ),
                              ),

                          ],
                        ),
                      ),
                    ),


                  // Kategori Dropdown
                  if (showCategoryDropdown)
                    Positioned(
                      left: 16,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha:0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 200,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                    showCategoryDropdown = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: AppColors.divider,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    category,
                                    style: AppTypography.bodyMedium,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),


                  // Sıralama Dropdown
                  if (showSortDropdown)
                    Positioned(
                      right: 16,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha:0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 250, // 👈 burayı ayarlarsın 4–5 satır görünsün
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: interestOptions.length,
                            itemBuilder: (context, index) {
                              final option = interestOptions[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedSort = option;
                                    showSortDropdown = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: AppColors.divider,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    option,
                                    style: AppTypography.bodyMedium,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }

  Widget _buildInfluencerCard(Map<String, String> influencer) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const InfluencerDetail(), // ✅ artık doğru
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(influencer['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                influencer['name']!,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

}