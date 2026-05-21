import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  bool isPasswordHidden = true;

  // ================= LOGIN FUNCTION =================
  Future<void> login() async {

    String email =
        emailController.text.trim();

    String password =
        passwordController.text.trim();

    // VALIDASI KOSONG
    if (email.isEmpty ||
        password.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Email dan Password wajib diisi!",
          ),
          backgroundColor:
              Colors.red,
        ),
      );
      return;
    }

    // VALIDASI FORMAT EMAIL
    if (!email.contains("@")) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Format email tidak valid!",
          ),
          backgroundColor:
              Colors.orange,
        ),
      );
      return;
    }

    try {

      // LOGIN SQLITE
      final user =
          await DBHelper.instance
              .loginUser(
        email,
        password,
      );

      // LOGIN BERHASIL
      if (user != null) {

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "Login berhasil!",
            ),
            backgroundColor:
                Colors.green,
          ),
        );

        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: user,
        );
      }

      // LOGIN GAGAL
      else {

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "Email atau password salah!",
            ),
            backgroundColor:
                Colors.red,
          ),
        );
      }
    }

    catch (e) {

      print(e);

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Terjadi error: $e",
          ),
          backgroundColor:
              Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF2E4369),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 40),

              // ================= LOGO =================
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration:
                      const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Logo.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ================= TITLE =================
              const Text(
                "Jelajah JakTim",
                style: TextStyle(
                  color: Color(0xFFF4C542),
                  fontSize: 26,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Temukan destinasi terbaik\nuntuk perjalananmu",
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),

              // ================= ONDEL ONDEL =================
              SizedBox(
                height: 180,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    Image.asset(
                      "assets/images/ondel cowo.png",
                      width: 200,
                    ),

                    const SizedBox(width: 15),

                    Image.asset(
                      "assets/images/ondel cewe.png",
                      width: 200,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= LOGIN CARD =================
              Container(
                width:
                    double.infinity,

                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                padding:
                    const EdgeInsets.all(
                        25),

                decoration:
                    BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(
                          35),
                  boxShadow: const [
                    BoxShadow(
                      color:
                          Colors.black26,
                      blurRadius: 10,
                    )
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    const Center(
                      child: Text(
                        "Login",
                        style:
                            TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                          color: Color(
                              0xFF243B68),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    // ================= EMAIL =================
                    const Text(
                      "Email",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        color: Color(
                            0xFF243B68),
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    TextField(
                      controller:
                          emailController,

                      keyboardType:
                          TextInputType
                              .emailAddress,

                      decoration:
                          InputDecoration(
                        hintText:
                            "Masukkan email",

                        prefixIcon:
                            const Icon(
                          Icons.email,
                          color: Color(
                              0xFF243B68),
                        ),

                        filled: true,
                        fillColor:
                            const Color(
                                0xFFEAEFF5),

                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  18),
                          borderSide:
                              BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    // ================= PASSWORD =================
                    const Text(
                      "Password",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        color: Color(
                            0xFF243B68),
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    TextField(
                      controller:
                          passwordController,

                      obscureText:
                          isPasswordHidden,

                      decoration:
                          InputDecoration(
                        hintText:
                            "Masukkan password",

                        prefixIcon:
                            const Icon(
                          Icons.lock,
                          color: Color(
                              0xFF243B68),
                        ),

                        suffixIcon:
                            IconButton(
                          onPressed:
                              () {
                            setState(() {
                              isPasswordHidden =
                                  !isPasswordHidden;
                            });
                          },
                          icon: Icon(
                            isPasswordHidden
                                ? Icons
                                    .visibility_off
                                : Icons
                                    .visibility,
                          ),
                        ),

                        filled: true,
                        fillColor:
                            const Color(
                                0xFFEAEFF5),

                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  18),
                          borderSide:
                              BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 30),

                    // ================= BUTTON LOGIN =================
                    SizedBox(
                      width:
                          double.infinity,
                      height: 55,
                      child:
                          ElevatedButton(
                        onPressed:
                            login,

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

                        child:
                            const Text(
                          "Masuk",
                          style:
                              TextStyle(
                            fontSize: 18,
                            color:
                                Colors.white,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    // ================= REGISTER =================
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [

                        const Text(
                          "Belum punya akun?",
                          style: TextStyle(
                            color:
                                Colors.grey,
                          ),
                        ),

                        TextButton(
                          onPressed: () {

                            Navigator.pushReplacementNamed(
                              context,
                              '/register',
                            );
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),

                    const Center(
                      child: Text(
                        "Selamat menjelajah Jakarta Timur!",
                        style:
                            TextStyle(
                          color:
                              Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                  height: 30),
            ],
          ),
        ),
      ),
    );
  }
}