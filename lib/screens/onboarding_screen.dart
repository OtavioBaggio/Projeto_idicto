import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // dependências selecionadas
  final Set<String> _dependenciasSelecionadas = {};

  // sintomas selecionados
  final Set<String> _sintomasSelecionados = {};

  // objetivos selecionados
  final Set<String> _objetivosSelecionados = {};

  // ── DADOS ────────────────────────────────────────────────────────

  final List<Map<String, dynamic>> _dependencias = [
    {'label': 'Álcool', 'icon': Icons.local_bar_outlined},
    {'label': 'Nicotina', 'icon': Icons.smoking_rooms_outlined},
    {'label': 'Maconha', 'icon': Icons.grass_outlined},
    {'label': 'Cocaína / Crack', 'icon': Icons.warning_amber_outlined},
    {'label': 'Medicamentos', 'icon': Icons.medication_outlined},
    {'label': 'Drogas sintéticas', 'icon': Icons.science_outlined},
    {'label': 'Outro', 'icon': Icons.add},
  ];

  final List<Map<String, dynamic>> _sintomas = [
    {'label': 'Ansiedade', 'emoji': '😰'},
    {'label': 'Insônia', 'emoji': '😴'},
    {'label': 'Estresse', 'emoji': '😤'},
    {'label': 'Tristeza', 'emoji': '😔'},
    {'label': 'Irritação', 'emoji': '😠'},
    {'label': 'Compulsão', 'emoji': '🔄'},
    {'label': 'Cansaço', 'emoji': '😩'},
    {'label': 'Falta de foco', 'emoji': '😵'},
  ];

  final List<Map<String, dynamic>> _objetivos = [
    {'label': 'Dias sem recaída', 'icon': Icons.emoji_events_outlined},
    {'label': 'Melhorar humor', 'icon': Icons.sentiment_satisfied_outlined},
    {'label': 'Dormir melhor', 'icon': Icons.bedtime_outlined},
    {'label': 'Reduzir ansiedade', 'icon': Icons.favorite_border},
    {'label': 'Melhorar rotina', 'icon': Icons.calendar_today_outlined},
    {'label': 'Mais energia', 'icon': Icons.bolt_outlined},
    {'label': 'Mais foco', 'icon': Icons.center_focus_strong_outlined},
  ];

  // ── HELPERS ──────────────────────────────────────────────────────

  Widget _chip({
    required String label,
    IconData? icon,
    String? emoji,
    required Set<String> selecionados,
  }) {
    final selecionado = selecionados.contains(label);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selecionado) {
            selecionados.remove(label);
          } else {
            selecionados.add(label);
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selecionado ? const Color(0xFFDCEDC8) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selecionado
                ? const Color(0xFFA7C957)
                : Colors.grey.shade200,
            width: selecionado ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (emoji != null)
              Text(emoji, style: const TextStyle(fontSize: 18))
            else if (icon != null)
              Icon(
                icon,
                size: 18,
                color: selecionado
                    ? const Color(0xFF558B2F)
                    : Colors.black45,
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selecionado
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: selecionado
                      ? const Color(0xFF558B2F)
                      : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _secao({
    required String titulo,
    required String subtitulo,
    required Widget conteudo,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitulo,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 16),
          conteudo,
        ],
      ),
    );
  }

  // ── BUILD ─────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ── HEADER VERDE ────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 25, vertical: 40),
                decoration: const BoxDecoration(
                  color: Color(0xFFA7C957),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // ícone planta
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.spa,
                        size: 44,
                        color: Color(0xFFA7C957),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Vamos começar sua jornada',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Personalize sua experiência no IDICTO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ── SEÇÃO DEPENDÊNCIAS ───────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _secao(
                  titulo: 'O que você quer superar?',
                  subtitulo: 'Selecione suas dependências',
                  conteudo: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _dependencias
                        .map((d) => _chip(
                      label: d['label'],
                      icon: d['icon'],
                      selecionados: _dependenciasSelecionadas,
                    ))
                        .toList(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── SEÇÃO SINTOMAS ───────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _secao(
                  titulo: 'Como você está se sentindo?',
                  subtitulo: 'Selecione seus sintomas atuais',
                  conteudo: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _sintomas
                        .map((s) => _chip(
                      label: s['label'],
                      emoji: s['emoji'],
                      selecionados: _sintomasSelecionados,
                    ))
                        .toList(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── SEÇÃO OBJETIVOS ──────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _secao(
                  titulo: 'Quais são seus objetivos?',
                  subtitulo: 'Escolha suas metas de recuperação',
                  conteudo: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _objetivos
                        .map((o) => _chip(
                      label: o['label'],
                      icon: o['icon'],
                      selecionados: _objetivosSelecionados,
                    ))
                        .toList(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── CARD MOTIVACIONAL ────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2B2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('✨', style: TextStyle(fontSize: 22)),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lembre-se sempre',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '"Cada pequeno passo também é progresso."',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ── BOTÃO COMEÇAR ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                            (route) => false, // limpa o histórico de navegação
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA7C957),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Começar minha jornada',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}