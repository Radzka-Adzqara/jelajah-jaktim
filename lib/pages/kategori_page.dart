import 'package:flutter/material.dart';
import 'detail_page.dart';

class KategoriPage extends StatefulWidget {

  final Map<String, dynamic>? user;

  const KategoriPage({
    super.key,
    this.user,
  });

  @override
  State<KategoriPage> createState() =>
      _KategoriPageState();
}

class _KategoriPageState
    extends State<KategoriPage> {

  // ================= SEARCH CONTROLLER =================
  final TextEditingController
      searchController =
      TextEditingController();

  // ================= DATA WISATA =================
  List<Map<String, dynamic>> wisataData = [

    {
      "title": "Taman Bambu",
      "lokasi": "Cipayung, Jakarta Timur",
      "rating": "4.2",
      "image": "assets/images/Taman bambu.jpg",
      "kategori": "Wisata Alam",
      "jam": "08:00 - 18:00",
      "harga": "Rp10.000",
      "deskripsi":
          "Taman Bambu merupakan kawasan ruang terbuka hijau yang menawarkan suasana asri, sejuk, dan nyaman untuk bersantai. Tempat ini dipenuhi pepohonan rindang dan area hijau yang cocok dijadikan lokasi rekreasi ringan bersama keluarga maupun teman. Pengunjung dapat menikmati udara segar sambil berjalan santai, berfoto, atau sekadar menikmati suasana tenang jauh dari hiruk pikuk perkotaan. Dengan fasilitas area duduk dan spot foto alami yang menarik, Taman Bambu menjadi salah satu tempat favorit untuk refreshing dan melepas penat.",
      "latitude": -6.3078,
      "longitude": 106.9018,
    },

    {
      "title": "Old Shanghai",
      "lokasi": "Kelapa Gading",
      "rating": "4.7",
      "image": "assets/images/old shanghai.jpeg",
      "kategori": "Wisata",
      "jam": "10:00 - 22:00",
      "harga": "Gratis",
      "deskripsi":
          "Old Shanghai adalah kawasan wisata kuliner dan hiburan dengan konsep arsitektur khas Tiongkok klasik yang menghadirkan suasana seperti berada di kota Shanghai tempo dulu. Tempat ini dipenuhi dekorasi lampion merah, ornamen oriental, hingga bangunan bergaya tradisional yang sangat menarik untuk dijadikan spot foto. Pengunjung dapat menikmati berbagai pilihan kuliner khas Asia, jajanan modern, hingga makanan tradisional dengan suasana yang unik dan estetik. Pada malam hari, kawasan ini terasa semakin hidup dengan pencahayaan lampu yang indah sehingga cocok dijadikan tempat bersantai bersama keluarga, pasangan, maupun teman.",
      "latitude": -6.1584,
      "longitude": 106.9057,
    },

    {
      "title": "Taman Ria Rio",
      "lokasi": "Pulo Gadung",
      "rating": "4.5",
      "image": "assets/images/Taman riario.jpg",
      "kategori": "Wisata Alam",
      "jam": "07:00 - 18:00",
      "harga": "Gratis",
      "deskripsi":
          "Taman Rio Rio merupakan taman kota modern yang berada di kawasan Jakarta Timur dan menjadi salah satu tempat favorit masyarakat untuk berolahraga maupun bersantai. Taman ini memiliki area jogging track, ruang hijau terbuka, taman bermain anak, serta tempat duduk yang nyaman untuk menikmati suasana sore hari. Dengan lingkungan yang bersih dan fasilitas yang cukup lengkap, Taman Rio Rio cocok dijadikan tempat rekreasi ringan tanpa biaya mahal. Banyak pengunjung datang untuk jogging, bersepeda, piknik kecil, atau sekadar menikmati udara segar di tengah kota.",
      "latitude": -6.1945,
      "longitude": 106.8902,
    },

    {
      "title": "TMII",
      "lokasi": "Jakarta Timur",
      "rating": "4.9",
      "image": "assets/images/TMII.jpg",
      "kategori": "Budaya",
      "jam": "08:00 - 20:00",
      "harga": "Rp25.000",
      "deskripsi":
          "Taman Mini Indonesia Indah (TMII) merupakan salah satu destinasi wisata budaya terbesar dan paling terkenal di Jakarta Timur. Tempat ini menghadirkan miniatur keberagaman Indonesia melalui anjungan rumah adat dari berbagai provinsi, museum edukatif, taman tematik, hingga pertunjukan seni budaya. Pengunjung dapat menikmati pengalaman belajar sambil berwisata dengan menjelajahi kekayaan budaya Nusantara dalam satu kawasan. Selain itu, TMII juga menyediakan fasilitas rekreasi keluarga seperti kereta gantung, taman hijau, dan wahana edukasi yang cocok dikunjungi bersama keluarga maupun teman. Tempat ini menjadi pilihan favorit wisatawan yang ingin mengenal budaya Indonesia lebih dekat dengan suasana yang nyaman dan menyenangkan.",
      "latitude": -6.3024,
      "longitude": 106.8951,
    },

    {
      "title": "Museum Lubang Buaya",
      "lokasi": "Cipayung",
      "rating": "4.6",
      "image": "assets/images/Lubang buaya.jpeg",
      "kategori": "Museum",
      "jam": "08:00 - 17:00",
      "harga": "Rp5.000",
      "deskripsi":
          "Museum Lubang Buaya merupakan destinasi wisata sejarah yang menyimpan kisah penting perjuangan bangsa Indonesia. Tempat ini menjadi saksi sejarah peristiwa Gerakan 30 September (G30S/PKI) dan menyimpan berbagai koleksi bersejarah seperti diorama perjuangan, kendaraan militer, serta peninggalan para pahlawan revolusi. Pengunjung dapat mempelajari sejarah Indonesia secara langsung melalui berbagai fasilitas edukatif yang tersedia. Museum ini cocok dikunjungi oleh pelajar, mahasiswa, maupun masyarakat umum yang ingin menambah wawasan sejarah bangsa.",
      "latitude": -6.2908,
      "longitude": 106.9065,
    },

    {
    "title": "Kerak Telor",
    "lokasi": "Jakarta Timur",
    "rating": "4.8",
    "image": "assets/images/Kerak telor.jpg",
    "kategori": "Kuliner",
    "jam": "16:00 - 22:00",
    "harga": "Rp25.000",
    "deskripsi":
        "Kerak Telor merupakan salah satu kuliner khas Betawi yang menjadi ikon makanan tradisional Jakarta. Hidangan ini terbuat dari campuran telur ayam atau telur bebek, beras ketan putih, ebi, bawang goreng, dan bumbu rempah khas yang dimasak menggunakan arang sehingga menghasilkan aroma yang sangat khas. Rasanya gurih dengan tekstur renyah di bagian bawah menjadikan makanan ini sangat digemari wisatawan lokal maupun mancanegara. Kerak Telor sering ditemukan di berbagai festival budaya Betawi dan menjadi makanan wajib bagi siapa saja yang ingin merasakan cita rasa autentik Jakarta.",
    "latitude": -6.3022,
    "longitude": 106.8955,
    },

    {
    "title": "Soto Betawi",
    "lokasi": "Jakarta Timur",
    "rating": "4.7",
    "image": "assets/images/Soto Betawi.jpg",
    "kategori": "Kuliner",
    "jam": "09:00 - 21:00",
    "harga": "Rp35.000",
    "deskripsi":
        "Soto Betawi adalah salah satu kuliner khas Jakarta yang terkenal dengan kuah santannya yang gurih dan kaya rempah. Hidangan ini biasanya disajikan dengan potongan daging sapi, jeroan, tomat, kentang goreng, emping, serta taburan bawang goreng yang menambah cita rasa khas. Perpaduan rempah-rempah tradisional membuat Soto Betawi memiliki rasa yang lezat, creamy, dan sangat menggugah selera. Kuliner ini sangat cocok dinikmati saat cuaca dingin maupun sebagai menu makan siang bersama keluarga.",
    "latitude": -6.2152,
    "longitude": 106.9103,
    },

    {
    "title": "Gado-Gado Betawi",
    "lokasi": "Jakarta Timur",
    "rating": "4.5",
    "image": "assets/images/Gado gado.jpg",
    "kategori": "Kuliner",
    "jam": "08:00 - 20:00",
    "harga": "Rp20.000",
    "deskripsi":
        "Gado-gado merupakan makanan khas Indonesia berisi sayuran, tahu, tempe, dan saus kacang.",
    "latitude": -6.2254,
    "longitude": 106.9007,
    },
  ];

  // ================= FILTER DATA =================
  List<Map<String, dynamic>>
      filteredWisata = [];

  @override
  void initState() {
    super.initState();

    filteredWisata = wisataData;
  }

  // ================= SEARCH FUNCTION =================
  void searchWisata(String keyword) {

    final hasil =
        wisataData.where((wisata) {

      final title = wisata["title"]
          .toString()
          .toLowerCase();

      final lokasi = wisata["lokasi"]
          .toString()
          .toLowerCase();

      final input =
          keyword.toLowerCase();

      return title.contains(input) ||
          lokasi.contains(input);

    }).toList();

    setState(() {
      filteredWisata = hasil;
    });
  }

  @override
  Widget build(BuildContext context) {
     final user = this.widget.user;
    return Scaffold(
      backgroundColor:
          const Color(0xFFD9DEE3),
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

            // HOME
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context,
                    '/home',arguments: widget.user, );
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
                    context,
                    '/kategori',arguments: widget.user, );
              },

              child: navItem(
                Icons.grid_view_rounded,
                "Kategori",
                true,
              ),
            ),
            // FAVORIT
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context,
                    '/favorit',arguments: widget.user,);
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
                    '/profile',arguments: widget.user, );
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
              height: 90,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              color:
                  const Color(0xFF2E4369),

              child: Row(
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

                  const Text(
                    "Jelajahi Kategori",
                    style: TextStyle(
                      color:
                          Color(0xFF63D67A),
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

               GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                        arguments: user,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    // ================= SEARCH =================
                    Container(
                      height: 120,
                      width: double.infinity,

                      padding:
                          const EdgeInsets.all(
                              20),

                      decoration:
                          const BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.vertical(
                          bottom:
                              Radius.circular(
                                  40),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black26,
                            blurRadius: 10,
                          )
                        ],
                      ),

                      child: TextField(
                        controller:
                            searchController,

                        onChanged: (value) {
                          searchWisata(value);
                        },

                        decoration:
                            InputDecoration(
                          hintText:
                              "Cari destinasi wisata...",

                          prefixIcon:
                              const Icon(
                            Icons.search,
                            color: Color(
                                0xFF243B68),
                          ),

                          filled: true,

                          fillColor:
                              const Color(
                                  0xFFD1D6DC),

                          border:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        30),

                            borderSide:
                                BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    // ================= TITLE =================
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(
                              horizontal: 20),

                      child: Align(
                        alignment:
                            Alignment.centerLeft,

                        child: Text(
                          "Eksplor Jakarta Timur",

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                            color:
                                Color(0xFF243B68),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                              horizontal: 20),

                      child: Align(
                        alignment:
                            Alignment.centerLeft,

                        child: Text(
                          "${filteredWisata.length} rekomendasi ditemukan",

                          style: const TextStyle(
                            color:
                                Color(0xFF243B68),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    // ================= LIST WISATA =================
                    ...filteredWisata.map(
                      (wisata) {

                        return wisataList(
                          context,

                          title:
                              wisata["title"],

                          lokasi:
                              wisata["lokasi"],

                          rating:
                              wisata["rating"],

                          image:
                              wisata["image"],

                          kategori:
                              wisata["kategori"],

                          jam:
                              wisata["jam"],

                          harga:
                              wisata["harga"],

                          deskripsi:
                              wisata["deskripsi"],

                          latitude:
                              wisata["latitude"],

                          longitude:
                              wisata["longitude"],
                        );
                      },
                    ),

                    const SizedBox(
                        height: 20),

                    // ================= TITLE KATEGORI =================
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(
                              horizontal: 20),

                      child: Align(
                        alignment:
                            Alignment.centerLeft,

                        child: Text(
                          "Pilih Kategori",

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                            color:
                                Color(0xFF243B68),
                          ),
                        ),
                      ),
                    ),

                    const Padding(
                      padding:
                          EdgeInsets.symmetric(
                              horizontal: 20),

                      child: Align(
                        alignment:
                            Alignment.centerLeft,

                        child: Text(
                          "Temukan Sesuai Minatmu",

                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Color(0xFF243B68),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    // ================= KATEGORI CARD =================
                    kategoriCard(
                      image:
                          "assets/images/Taman bambu.jpg",

                      title:
                          "Wisata Alam",

                      subtitle:
                          "Taman dan wisata hijau",

                      count:
                          "6 Tempat",

                      icon:
                          Icons.park,
                    ),

                    kategoriCard(
                      image:
                          "assets/images/Kerak telor.jpg",

                      title:
                          "Kuliner",

                      subtitle:
                          "Makanan khas Jakarta",

                      count:
                          "8 Menu",

                      icon:
                          Icons.restaurant,
                    ),

                    kategoriCard(
                      image:
                          "assets/images/Lubang buaya.jpeg",

                      title:
                          "Museum",

                      subtitle:
                          "Budaya dan sejarah",

                      count:
                          "6 Museum",

                      icon:
                          Icons.museum,
                    ),

                    const SizedBox(
                        height: 30),
                  ],
                ),
              ),
            )
          ],
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
            fontSize: 12,
            fontWeight:
                FontWeight.bold,

            color: active
                ? const Color(0xFF243B68)
                : Colors.grey,
          ),
        )
      ],
    );
  }

  // ================= KATEGORI CARD =================
  static Widget kategoriCard({
    required String image,
    required String title,
    required String subtitle,
    required String count,
    required IconData icon,
  }) {

    return Container(
      margin:
          const EdgeInsets.symmetric(
        horizontal: 18,
      ).copyWith(bottom: 15),

      height: 150,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(25),

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
            height: 75,

            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(25),
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

            child: Row(
              children: [

                Icon(
                  icon,
                  color:
                      const Color(0xFF243B68),
                ),

                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,

                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(subtitle),
                  ],
                ),

                const Spacer(),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color:
                        Colors.green.shade100,

                    borderRadius:
                        BorderRadius.circular(
                            20),
                  ),

                  child: Text(count),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // ================= LIST WISATA =================
   Widget wisataList(
    BuildContext context, {

    required String title,
    required String lokasi,
    required String rating,
    required String image,
    required String kategori,
    required String jam,
    required String harga,
    required String deskripsi,
    required double latitude,
    required double longitude,
  }) {

    return GestureDetector(

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (context) =>
                DetailPage(
                user: widget.user,
                title: title,
                image: image,
                lokasi: lokasi,
                deskripsi: deskripsi,
                kategori: kategori,
                jam: jam,
                harga: harga,
                rating: rating,
                latitude: latitude,
                longitude: longitude,
            ),
          ),
        );
      },

      child: Container(
        margin:
            const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(bottom: 10),

        height: 90,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(20),
        ),

        child: Row(
          children: [

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(15),

              child: Image.asset(
                image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,

                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  Text(lokasi),

                  Row(
                    children: [

                      const Icon(
                        Icons.star,
                        color:
                            Colors.amber,
                        size: 18,
                      ),

                      Text(rating)
                    ],
                  )
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15),

              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}