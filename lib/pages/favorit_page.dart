import 'package:flutter/material.dart';
import 'detail_page.dart';

class FavoritPage extends StatefulWidget {
    final Map<String, dynamic>? user;

   const FavoritPage({
    super.key,
    this.user,
  });
  @override
  State<FavoritPage> createState() =>
      _FavoritPageState();
}

class _FavoritPageState
    extends State<FavoritPage> {

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = this.widget.user;
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
                  arguments: widget.user,
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
                  arguments: widget.user,
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

            // BERANDA
            GestureDetector(
              onTap: () {
                
                Navigator.pushReplacementNamed(
                    context, '/home', arguments: widget.user);
              },
              child: navItem(
                Icons.home_outlined,
                "Beranda",
                false,
              ),
            ),

            // KATEGORI
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/kategori', arguments: widget.user);
              },
              child: navItem(
                Icons.grid_view_rounded,
                "Kategori",
                false,
              ),
            ),

            // FAVORIT ACTIVE
            navItem(
              Icons.favorite,
              "Favorit",
              true,
            ),

            // PROFILE
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/profile', arguments: widget.user);
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
        child: Column(
          children: [

            // ================= HEADER =================
            Container(
              height: 95,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              color: const Color(0xFF2E4369),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
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

                  const Text(
                    "Favorit Saya",
                    style: TextStyle(
                      color: Color(0xFF63D67A),
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/home',
                      arguments: widget.user,
                    );
                  },

                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF243B68),
                    ),
                  ),
                )
                ],
              ),
            ),

            // ================= CONTENT =================
            Expanded(
              child: favoriteList.isEmpty

                  // ================= JIKA KOSONG =================
                  ? const Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [

                          Icon(
                            Icons.favorite_border,
                            size: 90,
                            color: Colors.grey,
                          ),

                          SizedBox(height: 15),

                          Text(
                            "Belum ada favorit",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Tambahkan destinasi favoritmu",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )

                  // ================= GRID FAVORIT =================
                  : Padding(
                      padding:
                          const EdgeInsets.all(18),

                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.72,

                        children:
                            favoriteList.map((item) {

                          return favoritCard(
                            context,
                            image:
                                item['image'],
                            title:
                                item['title'],
                            lokasi:
                                item['lokasi'],
                            rating:
                                item['rating'],
                          );

                        }).toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= CARD =================
  Widget favoritCard(
    BuildContext context, {
    required String image,
    required String title,
    required String lokasi,
    required String rating,
  }) {
    return GestureDetector(

      // ================= OPEN DETAIL =================
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              title: title,
              image: image,
              lokasi: lokasi,
              deskripsi:
                  "Destinasi wisata populer di Jakarta Timur.",
              kategori: "Wisata",
              jam: "08.00 - 21.00",
              harga: "Rp 15.000",
              rating: rating,
              latitude: -6.225,
              longitude: 106.900,
            ),
          ),
        ).then((_) {
          setState(() {});
        });
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
            )
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // IMAGE
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius
                        .vertical(
                  top: Radius.circular(22),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  // TITLE + DELETE FAVORITE
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [

                      Expanded(
                        child: Text(
                          title,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 16,
                            color: Color(
                                0xFF243B68),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {

                          setState(() {

                            favoriteList.removeWhere(
                              (item) =>
                                  item['title'] ==
                                  title,
                            );

                          });
                        },

                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 22,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color:
                            Colors.grey,
                        size: 18,
                      ),

                      const SizedBox(
                          width: 4),

                      Expanded(
                        child: Text(
                          lokasi,
                          style:
                              const TextStyle(
                            color:
                                Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color:
                            Colors.amber,
                        size: 20,
                      ),

                      const SizedBox(
                          width: 4),

                      Text(
                        rating,
                        style:
                            const TextStyle(
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= NAVBAR ITEM =================
  static Widget navItem(
      IconData icon,
      String title,
      bool active) {
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
                ? const Color(
                    0xFF243B68)
                : Colors.grey,
          ),
        )
      ],
    );
  }
}