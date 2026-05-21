import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic>? user;

  final String title;
  final String image;
  final String lokasi;
  final String deskripsi;
  final String kategori;
  final String jam;
  final String harga;
  final String rating;
  final double latitude;
  final double longitude;

  const DetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.lokasi,
    required this.deskripsi,
    required this.kategori,
    required this.jam,
    required this.harga,
    required this.rating,
    required this.latitude,
    required this.longitude,
    this.user,
  });

  @override
  State<DetailPage> createState() =>
      _DetailPageState();
}

// ================= GLOBAL FAVORITE =================
List<Map<String, dynamic>> favoriteList =
    [];

class _DetailPageState
    extends State<DetailPage> {

  bool isFavorite = false;

  // ================= OPEN GOOGLE MAPS =================
  Future<void> _openMaps() async {

    final Uri googleMapsUrl =
        Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}',
    );

    if (await canLaunchUrl(
        googleMapsUrl)) {

      await launchUrl(
        googleMapsUrl,
        mode:
            LaunchMode.externalApplication,
      );
    }
  }

  // ================= FAVORITE FUNCTION =================
  void toggleFavorite() {

    setState(() {

      isFavorite = !isFavorite;

      if (isFavorite) {

        favoriteList.add({
          'title': widget.title,
          'image': widget.image,
          'lokasi': widget.lokasi,
          'rating': widget.rating,
        });

      } else {

        favoriteList.removeWhere(
          (item) =>
              item['title'] ==
              widget.title,
        );
      }
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        backgroundColor:
            const Color(0xFF243B68),

        content: Text(
          isFavorite
              ? "Berhasil ditambahkan ke favorit"
              : "Berhasil dihapus dari favorit",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xFFD9DEE3),

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

            GestureDetector(
              onTap: () {

                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: widget.user,
                );
              },

              child: navItem(
                Icons.home_outlined,
                "Beranda",
                false,
              ),
            ),

            GestureDetector(
              onTap: () {

                Navigator.pushReplacementNamed(
                  context,
                  '/kategori',arguments: widget.user,
                );
              },

              child: navItem(
                Icons.grid_view_rounded,
                "Kategori",
                true,
              ),
            ),

            GestureDetector(
              onTap: () {

                Navigator.pushReplacementNamed(
                  context,
                  '/favorit',arguments: widget.user,
                );
              },

              child: navItem(
                Icons.favorite,
                "Favorit",
                false,
              ),
            ),

            GestureDetector(
              onTap: () {

                Navigator.pushReplacementNamed(
                  context,
                  '/profile',arguments: widget.user,
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

              // ================= HERO IMAGE =================
              Stack(
                children: [

                  Container(
                    height: 340,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // LABEL
                  Positioned(
                    top: 25,
                    left: 20,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                                18),
                      ),

                      child: Text(
                        widget.kategori,

                        style: const TextStyle(
                          color:
                              Color(0xFF243B68),
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  // BACK BUTTON
                  Positioned(
                    top: 25,
                    right: 20,

                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor:
                            Colors.white,

                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color:
                              Color(0xFF243B68),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ================= CONTENT =================
              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.all(20),

                child: Container(
                  padding:
                      const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                            25),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      // TITLE
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Expanded(
                            child: Text(
                              widget.title,

                              style:
                                  const TextStyle(
                                fontSize: 22,
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Color(0xFF243B68),
                              ),
                            ),
                          ),

                          // FAVORITE BUTTON
                          GestureDetector(
                            onTap:
                                toggleFavorite,

                            child: Container(
                              width: 50,
                              height: 50,

                              decoration:
                                  BoxDecoration(
                                color:
                                    const Color(
                                        0xFFFFE5E5),

                                borderRadius:
                                    BorderRadius.circular(
                                        30),
                              ),

                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons
                                        .favorite_border,

                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 8),

                      Text(
                        widget.lokasi,

                        style:
                            const TextStyle(
                          fontSize: 18,
                          color:
                              Color(0xFF243B68),
                        ),
                      ),

                      const SizedBox(
                          height: 18),

                      // RATING
                      Row(
                        children: [

                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),

                          const SizedBox(
                              width: 5),

                          Text(
                            widget.rating,

                            style:
                                const TextStyle(
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(
                              width: 5),

                          const Text(
                            "(1.2rb ulasan)",
                          ),

                          const Spacer(),

                          Container(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),

                            decoration:
                                BoxDecoration(
                              color: Colors
                                  .green
                                  .shade100,

                              borderRadius:
                                  BorderRadius.circular(
                                      20),
                            ),

                            child: const Text(
                              "Buka",

                              style: TextStyle(
                                color:
                                    Colors.green,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                          height: 20),

                      Text(
                        widget.deskripsi,

                        style:
                            const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color:
                              Color(0xFF243B68),
                        ),
                      ),

                      const SizedBox(
                          height: 20),

                      // TIME & PRICE
                      Row(
                        children: [

                          infoChip(widget.jam),

                          const SizedBox(
                              width: 10),

                          infoChip(
                              widget.harga),
                        ],
                      ),

                      const SizedBox(
                          height: 20),

                      // ================= MAP =================
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                                20),

                        child: SizedBox(
                          height: 250,

                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter:
                                  LatLng(
                                widget.latitude,
                                widget.longitude,
                              ),

                              initialZoom: 15,
                            ),

                            children: [

                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                                userAgentPackageName:
                                    'com.example.jelajahjaktim',
                              ),

                              MarkerLayer(
                                markers: [

                                  Marker(
                                    point: LatLng(
                                      widget.latitude,
                                      widget.longitude,
                                    ),

                                    width: 80,
                                    height: 80,

                                    child:
                                        const Icon(
                                      Icons
                                          .location_on,
                                      color:
                                          Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 20),

                      // ================= BUTTON MAP =================
                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child:
                            ElevatedButton.icon(
                          onPressed:
                              _openMaps,

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                const Color(
                                    0xFF243B68),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                      18),
                            ),
                          ),

                          icon: const Icon(
                            Icons.map,
                            color: Colors.white,
                          ),

                          label: const Text(
                            "Buka di Google Maps",

                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= NAV ITEM =================
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
              ? const Color(0xFF243B68)
              : Colors.grey,
        ),

        Text(
          title,

          style: TextStyle(
            fontWeight:
                FontWeight.bold,

            color: active
                ? const Color(0xFF243B68)
                : Colors.grey,
          ),
        ),
      ],
    );
  }

  // ================= CHIP =================
  static Widget infoChip(
    String text,
  ) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color:
            const Color(0xFFE8E8E8),

        borderRadius:
            BorderRadius.circular(25),
      ),

      child: Text(
        text,

        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF243B68),
        ),
      ),
    );
  }
}