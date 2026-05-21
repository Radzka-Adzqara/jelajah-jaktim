import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {

  // CONTROLLER
  final TextEditingController
      namaController =
      TextEditingController();

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  final TextEditingController
      confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  // ================= REGISTER FUNCTION =================
  Future<void> register() async {

    String nama =
        namaController.text.trim();

    String email =
        emailController.text.trim();

    String password =
        passwordController.text.trim();

    String confirmPassword =
        confirmPasswordController.text
            .trim();

    // VALIDASI KOSONG
    if (nama.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Semua field wajib diisi!",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // VALIDASI EMAIL
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

    // VALIDASI PASSWORD
    if (password.length < 5) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Password minimal 5 karakter!",
          ),
          backgroundColor:
              Colors.orange,
        ),
      );
      return;
    }

    // PASSWORD COCOK?
    if (password !=
        confirmPassword) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Konfirmasi password tidak cocok!",
          ),
          backgroundColor:
              Colors.red,
        ),
      );
      return;
    }

    try {

      // SIMPAN KE SQLITE
      await DBHelper.instance
          .registerUser(
        nama,
        email,
        password,
      );

      // BERHASIL
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Registrasi berhasil!",
          ),
          backgroundColor:
              Colors.green,
        ),
      );

      // KEMBALI KE LOGIN
      Navigator.pushReplacementNamed(
        context,
        '/login',
      );

    } catch (e) {

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
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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

              // LOGO
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration:
                      const BoxDecoration(
                    image:
                        DecorationImage(
                      image: AssetImage(
                        "assets/images/Logo.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Daftar Akun",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Buat akun untuk mulai menjelajah",
                style: TextStyle(
                  color:
                      Colors.white70,
                ),
              ),

              const SizedBox(height: 30),

              // CARD REGISTER
              Container(
                margin:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 20,
                ),

                padding:
                    const EdgeInsets
                        .all(25),

                decoration:
                    BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius
                          .circular(35),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [

                    const Center(
                      child: Text(
                        "Register",
                        style:
                            TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: Color(
                              0xFF243B68),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    // ================= NAMA =================
                    const Text(
                      "Nama",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 8),

                    TextField(
                      controller:
                          namaController,
                      decoration:
                          InputDecoration(
                        hintText:
                            "Masukkan nama",

                        prefixIcon:
                            const Icon(
                          Icons.person,
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
                        height: 18),

                    // ================= EMAIL =================
                    const Text(
                      "Email",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 8),

                    TextField(
                      controller:
                          emailController,
                      decoration:
                          InputDecoration(
                        hintText:
                            "Masukkan email",

                        prefixIcon:
                            const Icon(
                          Icons.email,
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
                        height: 18),

                    // ================= PASSWORD =================
                    const Text(
                      "Password",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 8),

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
                        ),

                        suffixIcon:
                            IconButton(
                          onPressed:
                              () {
                            setState(
                                () {
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
                        height: 18),

                    // ================= KONFIRM PASSWORD =================
                    const Text(
                      "Konfirmasi Password",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 8),

                    TextField(
                      controller:
                          confirmPasswordController,
                      obscureText:
                          isConfirmHidden,

                      decoration:
                          InputDecoration(
                        hintText:
                            "Ulangi password",

                        prefixIcon:
                            const Icon(
                          Icons.lock_outline,
                        ),

                        suffixIcon:
                            IconButton(
                          onPressed:
                              () {
                            setState(
                                () {
                              isConfirmHidden =
                                  !isConfirmHidden;
                            });
                          },
                          icon: Icon(
                            isConfirmHidden
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

                    // BUTTON
                    SizedBox(
                      width:
                          double.infinity,
                      height: 55,
                      child:
                          ElevatedButton(
                        onPressed:
                            register,

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
                          "Daftar",
                          style:
                              TextStyle(
                            fontSize: 18,
                            color:
                                Colors.white,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [

                        const Text(
                          "Sudah punya akun?",
                        ),

                        TextButton(
                          onPressed:
                              () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/login',
                            );
                          },
                          child:
                              const Text(
                            "Login",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}