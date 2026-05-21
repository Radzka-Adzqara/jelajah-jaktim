import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final Map<String, dynamic>? user;

  const QuizPage({
    super.key,
    this.user,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ================= SOAL =================
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "Makanan khas Betawi yang menggunakan bahan dasar telur adalah?",
      "options": [
        "Soto Betawi",
        "Kerak Telor",
        "Gado-Gado",
        "Nasi Uduk"
      ],
      "answer": "Kerak Telor",
    },
    {
      "question":
          "Taman Mini Indonesia Indah (TMII) berada di wilayah?",
      "options": [
        "Jakarta Selatan",
        "Jakarta Barat",
        "Jakarta Timur",
        "Jakarta Utara"
      ],
      "answer": "Jakarta Timur",
    },
    {
      "question":
          "Ondel-ondel merupakan ikon budaya dari?",
      "options": [
        "Sunda",
        "Betawi",
        "Jawa",
        "Melayu"
      ],
      "answer": "Betawi",
    },
    {
      "question":
          "Museum sejarah perjuangan yang terkenal di Jakarta Timur adalah?",
      "options": [
        "Museum Fatahillah",
        "Museum Lubang Buaya",
        "Museum Nasional",
        "Museum Tekstil"
      ],
      "answer": "Museum Lubang Buaya",
    },
    {
      "question":
          "Kuliner berkuah khas Betawi adalah?",
      "options": [
        "Rendang",
        "Pempek",
        "Soto Betawi",
        "Rawon"
      ],
      "answer": "Soto Betawi",
    },
    {
      "question":
          "Taman Mini Indonesia Indah terkenal karena menampilkan?",
      "options": [
        "Pantai Indonesia",
        "Miniatur budaya Indonesia",
        "Kebun teh",
        "Pusat belanja"
      ],
      "answer": "Miniatur budaya Indonesia",
    },
    {
      "question":
          "Makanan Betawi berikut yang biasanya disajikan dengan kuah santan adalah?",
      "options": [
        "Kerak Telor",
        "Soto Betawi",
        "Ketoprak",
        "Asinan"
      ],
      "answer": "Soto Betawi",
    },
    {
      "question":
          "Salah satu wisata budaya populer di Jakarta Timur adalah?",
      "options": [
        "Monas",
        "TMII",
        "Kota Tua",
        "Ancol"
      ],
      "answer": "TMII",
    },
    {
      "question":
          "Apa nama ikon budaya Betawi berbentuk boneka raksasa?",
      "options": [
        "Barong",
        "Reog",
        "Ondel-Ondel",
        "Wayang"
      ],
      "answer": "Ondel-Ondel",
    },
    {
      "question":
          "Apa tujuan utama aplikasi Jelajah Jaktim?",
      "options": [
        "Belanja online",
        "Mencari pekerjaan",
        "Menjelajahi wisata & budaya Jakarta Timur",
        "Bermain game"
      ],
      "answer":
          "Menjelajahi wisata & budaya Jakarta Timur",
    },
  ];

  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return Scaffold(
      backgroundColor: const Color(0xFFD9DEE3),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4369),
        centerTitle: true,
        title: const Text(
          "Quiz Jakarta Timur",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // ================= PROGRESS =================
            Text(
              "Soal ${currentQuestion + 1} / ${questions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
                color:
                    Color(0xFF243B68),
              ),
            ),

            const SizedBox(height: 20),

            // ================= SOAL =================
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(
                      20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(
                        24),
              ),
              child: Text(
                questions[currentQuestion]
                    ["question"],
                style:
                    const TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                  color: Color(
                      0xFF243B68),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= OPTION =================
            Expanded(
              child: ListView.builder(
                itemCount:
                    questions[
                            currentQuestion]
                        ["options"]
                    .length,
                itemBuilder:
                    (context, i) {
                  String option =
                      questions[
                              currentQuestion]
                          ["options"][i];

                  bool isSelected =
                      selectedAnswer ==
                          option;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnswer =
                            option;
                      });
                    },

                    child: Container(
                      margin:
                          const EdgeInsets
                              .only(
                                  bottom:
                                      15),
                      padding:
                          const EdgeInsets
                              .all(18),
                      decoration:
                          BoxDecoration(
                        color:
                            isSelected
                                ? const Color(
                                    0xFF2E4369)
                                : Colors
                                    .white,
                        borderRadius:
                            BorderRadius.circular(
                                18),
                      ),
                      child: Text(
                        option,
                        style:
                            TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight
                                  .w600,
                          color:
                              isSelected
                                  ? Colors
                                      .white
                                  : Colors
                                      .black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ================= BUTTON =================
            SizedBox(
              width: double.infinity,
              height: 60,
              child:
                  ElevatedButton(
                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      const Color(
                          0xFFE7C453),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            20),
                  ),
                ),

                onPressed: () {
                  if (selectedAnswer ==
                      null) {
                    ScaffoldMessenger.of(
                            context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Pilih jawaban terlebih dahulu",
                        ),
                      ),
                    );
                    return;
                  }

                  // cek jawaban
                  if (selectedAnswer ==
                      questions[
                              currentQuestion]
                          ["answer"]) {
                    score++;
                  }

                  // next soal
                  if (currentQuestion <
                      questions.length -
                          1) {
                    setState(() {
                      currentQuestion++;
                      selectedAnswer =
                          null;
                    });
                  }

                  // selesai
                  else {
                    showDialog(
                      context:
                          context,
                      builder:
                          (_) =>
                              AlertDialog(
                        title:
                            const Text(
                          "Quiz Selesai 🎉",
                        ),
                        content:
                            Text(
                          "Skor kamu: $score / ${questions.length}",
                        ),
                        actions: [
                          TextButton(
                            onPressed:
                                () {
                              Navigator.pop(
                                  context);

                              Navigator.pushReplacementNamed(
                                context,
                                '/home',
                                arguments:
                                    user,
                              );
                            },
                            child:
                                const Text(
                              "Kembali ke Home",
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },

                child: Text(
                  currentQuestion ==
                          questions.length -
                              1
                      ? "Selesai"
                      : "Soal Berikutnya",
                  style:
                      const TextStyle(
                    fontSize: 20,
                    color:
                        Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ================= BACK HOME =================
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                    arguments: user,
                  );
                },
                child: const Text(
                  "Kembali ke Home",
                  style: TextStyle(
                    color:
                        Color(0xFF243B68),
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}