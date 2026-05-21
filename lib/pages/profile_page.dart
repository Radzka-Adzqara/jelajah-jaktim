import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic>? user;

  const ProfilePage({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: const Color(0xFFD9DEE3),

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

            // ================= BERANDA =================
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',  arguments: user,
                );
              },

              child: navItem(
                Icons.home_outlined,
                "Beranda",
                false,
              ),
            ),

            // ================= KATEGORI =================
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/kategori',arguments: user,
                );
              },

              child: navItem(
                Icons.grid_view_rounded,
                "Kategori",
                false,
              ),
            ),

            // ================= FAVORIT =================
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/favorit',arguments: user,
                );
              },

              child: navItem(
                Icons.favorite_border,
                "Favorit",
                false,
              ),
            ),

            // ================= PROFILE ACTIVE =================
            navItem(
              Icons.person,
              "Profil",
              true,
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
              height: 220,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: Color(0xFF2E4369),

                borderRadius:
                    BorderRadius.vertical(
                  bottom: Radius.circular(35),
                ),
              ),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  // ================= FOTO PROFILE =================
                  Container(
                    width: 100,
                    height: 100,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),

                      image:
                          const DecorationImage(
                        image: AssetImage(
                          "assets/images/profil.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ================= NAMA =================
                  const Text(
                    "Radzka Adzqara",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // ================= EMAIL =================
                  Text(
                    user?['email'] ?? "Tidak ada email",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ================= MENU CARD =================
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Container(
                  width: double.infinity,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(28),

                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                      )
                    ],
                  ),

                  child: Column(
                    children: [

                      // ================= EDIT PROFILE =================
                      menuTile(
                        icon: Icons.edit,
                        title: "Edit Profil",

                        onTap: () {},
                      ),

                      divider(),


                      // ================= PENGATURAN =================
                      menuTile(
                        icon: Icons.settings,
                        title: "Pengaturan",

                        onTap: () {},
                      ),

                      divider(),

                      // ================= LOGOUT =================
                      menuTile(
                        icon: Icons.logout,
                        title: "Keluar",

                        isLogout: true,

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
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================= MENU TILE =================
  static Widget menuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      onTap: onTap,

      leading: Container(
        width: 45,
        height: 45,

        decoration: BoxDecoration(
          color: isLogout
              ? Colors.red.shade50
              : const Color(0xFFE7EDF5),

          borderRadius:
              BorderRadius.circular(15),
        ),

        child: Icon(
          icon,

          color: isLogout
              ? Colors.red
              : const Color(0xFF243B68),
        ),
      ),

      title: Text(
        title,

        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,

          color: isLogout
              ? Colors.red
              : const Color(0xFF243B68),
        ),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18,

        color:
            isLogout ? Colors.red : Colors.grey,
      ),
    );
  }

  // ================= DIVIDER =================
  static Widget divider() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: Divider(
        color: Colors.grey.shade300,
        thickness: 1,
      ),
    );
  }

  // ================= NAVBAR ITEM =================
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
            fontWeight: FontWeight.bold,

            color: active
                ? const Color(0xFF243B68)
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}