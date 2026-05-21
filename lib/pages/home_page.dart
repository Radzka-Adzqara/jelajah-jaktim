import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
 final Map<String, dynamic>? user;

  const HomePage({
    super.key,
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    final user = this.user;

    return Scaffold(
      backgroundColor: const Color(0xFFD9DEE3),
      
        drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF2E4369),
              ),
              accountName: Text(
                user?['nama'] ??
                    "Guest",
              ),
              accountEmail: Text(
                user?['email'] ??
                    "Tidak ada email",
              ),
              currentAccountPicture:
                  const CircleAvatar(
                backgroundImage:
                    AssetImage(
                  "assets/images/profil.jpg",
                ),
              ),
            ),

            ListTile(
              leading:
                  const Icon(Icons.home),
              title:
                  const Text("Beranda"),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: user,
                );
              },
            ),

            ListTile(
              leading:
                  const Icon(Icons.quiz),
              title:
                  const Text("Quiz"),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/quiz',
                  arguments: user,
                );
              },
            ),

            ListTile(
              leading: const Icon(
                  Icons.logout),
              title:
                  const Text("Logout"),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                );
              },
            ),
          ],
        ),
      ),

      // ================= NAVBAR =================
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFF2E4369),
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            // HOME ACTIVE
            navItem(
              Icons.home,
              "Beranda",
              true,
            ),

            // KATEGORI
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/kategori',arguments: user,
                    );
              },
              child: navItem(
                Icons.grid_view_rounded,
                "Kategori",
                false,
              ),
            ),

            // FAVORIT
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/favorit',arguments: user,
                    );
              },
              child: navItem(
                Icons.favorite_border,
                "Favorit",
                false,
              ),
            ),

            // PROFILE
            GestureDetector(
              onTap: () {

                Navigator.pushReplacementNamed(
                  context,
                  '/profile',arguments: user,
                  
                );
              },

              child: navItem(
                Icons.person_outline,
                "Profil",
                false,
              ),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ================= HEADER =================
              Container(
                height: 220,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF2E4369),
                  borderRadius:
                      BorderRadius.vertical(
                    bottom: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    // TOP HEADER
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [

                     Builder(
                        builder: (context) =>
                            IconButton(
                          onPressed: () {
                            Scaffold.of(context)
                                .openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                      ),

                        Container(
                          width: 50,
                          height: 50,
                          decoration:
                              BoxDecoration(
                            shape:
                                BoxShape.circle,
                            border: Border.all(
                              color:
                                  Colors.white,
                              width: 2,
                            ),
                            image:
                                const DecorationImage(
                              image:
                                  AssetImage(
                                "assets/images/profil.jpg",
                              ),
                              fit:
                                  BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20),

                    Text(
                       user?['nama'] ?? "Guest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Mau jalan kemana hari ini?",
                      style: TextStyle(
                        color:
                            Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [


                    // ================= TITLE =================
                    const Text(
                      "Rekomendasi Unggulan",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                        color: Color(
                            0xFF243B68),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    // ================= CAROUSEL =================
                    CarouselSlider(
                      items: [
                        carouselImage(
                            "assets/images/TMII.jpg"),

                        carouselImage(
                            "assets/images/Taman riario.jpg"),

                        carouselImage(
                            "assets/images/Soto Betawi.jpg"),
                      ],
                      options:
                          CarouselOptions(
                        height: 220,
                        autoPlay: true,
                        enlargeCenterPage:
                            true,
                        viewportFraction:
                            0.9,
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    // ================= QUIZ CARD =================
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            '/quiz',arguments: user,
                            );
                      },
                      child: Container(
                        width:
                            double.infinity,
                        padding:
                            const EdgeInsets
                                .all(20),
                        decoration:
                            BoxDecoration(
                          gradient:
                              const LinearGradient(
                            colors: [
                              Color(
                                  0xFF2E4369),
                              Color(
                                  0xFF4F79B9),
                            ],
                          ),
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      28),
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Colors.black26,
                              blurRadius:
                                  8,
                            )
                          ],
                        ),

                        child: Row(
                          children: [

                            const Icon(
                              Icons.quiz,
                              color:
                                  Colors.white,
                              size: 55,
                            ),

                            const SizedBox(
                                width: 15),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    "Quiz Jakarta Timur",
                                    style:
                                        TextStyle(
                                      color:
                                          Colors
                                              .white,
                                      fontSize:
                                          20,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          5),
                                  Text(
                                    "Uji pengetahuanmu tentang wisata & budaya Jakarta Timur!",
                                    style:
                                        TextStyle(
                                      color:
                                          Colors
                                              .white70,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal:
                                    16,
                                vertical:
                                    10,
                              ),
                              decoration:
                                  BoxDecoration(
                                color: Colors
                                    .white,
                                borderRadius:
                                    BorderRadius.circular(
                                        18),
                              ),
                              child:
                                  const Text(
                                "Mulai",
                                style:
                                    TextStyle(
                                  color: Color(
                                      0xFF243B68),
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    // ================= KATEGORI =================
                    const Text(
                      "Kategori Wisata",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                        color: Color(
                            0xFF243B68),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal,
                      child: Row(
                        children: [

                          categoryChip(
                              "Semua"),
                          categoryChip(
                              "Wisata"),
                          categoryChip(
                              "Kuliner"),
                          categoryChip(
                              "Budaya"),
                          categoryChip(
                              "Museum"),
                        ],
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    // ================= DESTINASI =================
                    const Text(
                      "Destinasi Populer",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                        color: Color(
                            0xFF243B68),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    GridView.count(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          2,
                      crossAxisSpacing:
                          15,
                      mainAxisSpacing:
                          15,
                      childAspectRatio:
                          0.75,

                      children: [

                       wisataCard(
                          context,
                          user: user,
                          image: "assets/images/TMII.jpg",
                          title: "TMII",
                          lokasi: "Cipayung, Jakarta Timur",
                          rating: "4.9",
                          deskripsi:
                              "Taman Mini Indonesia Indah adalah taman wisata budaya terbesar di Jakarta Timur.",
                          latitude: -6.3024,
                          longitude: 106.8951,
                          kategori: "Wisata",
                          jam: "06:00 - 20:00",
                          harga: "Rp 50.000",
                        ),

                       wisataCard(
                          context,
                          user: user,
                          image: "assets/images/old shanghai.jpeg",
                          title: "Old Shanghai",
                          lokasi: "Kelapa Gading",
                          rating: "4.7",
                          deskripsi:
                              "Old Shanghai adalah kawasan kuliner dan hiburan bernuansa Tiongkok klasik.",
                          latitude: -6.1585,
                          longitude: 106.9056,
                          kategori: "Kuliner",
                          jam: "10:00 - 22:00",
                          harga: "Gratis",
                        ),

                        wisataCard(
                          context,
                          user: user,
                          image: "assets/images/Kerak telor.jpg",
                          title: "Kerak Telor",
                          lokasi: "Jakarta Timur",
                          rating: "4.6",
                          deskripsi:
                              "Kerak Telor adalah makanan khas Betawi yang terkenal di Jakarta.",
                          latitude: -6.2000,
                          longitude: 106.8166,
                          kategori: "Kuliner",
                          jam: "08:00 - 21:00",
                          harga: "Rp 25.000",
                        ),

                      wisataCard(
                          context,
                          user: user,
                          image: "assets/images/Taman bambu.jpg",
                          title: "Taman Bambu",
                          lokasi: "Tanggerang",
                          rating: "4.8",
                          deskripsi:
                              "Taman Bambu adalah taman hijau yang cocok untuk bersantai bersama keluarga.",
                          latitude: -6.1700,
                          longitude: 106.6400,
                          kategori: "Wisata",
                          jam: "07:00 - 18:00",
                          harga: "Gratis",
                        ),

                        
                      ],
                    ),

                    const SizedBox(
                        height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= CAROUSEL =================
  static Widget carouselImage(
      String image) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(25),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  // ================= CATEGORY =================
  static Widget categoryChip(
      String text) {
    return Container(
      margin:
          const EdgeInsets.only(
              right: 10),
      padding:
          const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(
                20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight:
              FontWeight.bold,
        ),
      ),
    );
  }

  // ================= CARD =================
  static Widget wisataCard(
    BuildContext context, {
    required Map<String, dynamic>? user,
    required String image,
    required String title,
    required String lokasi,
    required String rating,
    required String deskripsi,
    required double latitude,
    required double longitude,
    required String kategori,
    required String jam,
    required String harga,
  }) {
    return GestureDetector(
     onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => DetailPage(
        user: user,
        title: title,
        image: image,
        lokasi: lokasi,
        rating: rating,
        deskripsi: deskripsi,
        latitude: latitude,
        longitude: longitude,
        kategori: kategori,
        jam: jam,
        harga: harga,
      ),
    ),
  );
},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
                  22),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
            )
          ],
        ),
        child: Column(
          children: [

            Container(
              height: 140,
              decoration:
                  BoxDecoration(
                borderRadius:
                    const BorderRadius
                        .vertical(
                  top:
                      Radius.circular(
                          22),
                ),
                image:
                    DecorationImage(
                  image: AssetImage(
                      image),
                  fit:
                      BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets
                      .all(12),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [

                  Text(
                    title,
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight
                              .bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                      height: 5),

                  Text(
                    lokasi,
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(
                      height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors
                            .amber,
                        size: 20,
                      ),
                      Text(rating),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= NAVBAR =================
  static Widget navItem(
    IconData icon,
    String title,
    bool active,
  ) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 34,
          color: active
              ? const Color(
                  0xFF243B68)
              : Colors.grey,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
            color: active
                ? const Color(
                    0xFF243B68)
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}