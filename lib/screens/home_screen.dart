import 'package:flutter/material.dart';
import 'package:idicto/constants/mensagens.dart';

import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String get _mensagemDeHoje {
    final hoje = DateTime.now();
    final indice = hoje.day % mensagensMotivacional.length;
    return mensagensMotivacional[indice];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),

      // ── MENU DE NAVEGAÇÃO INFERIOR ──────────────────────────────────────────────
      bottomNavigationBar: BottomNav(currentIndex: 0),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ── HEADER VERDE ─────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Color(0xFFA7C957),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // saudação + ícone sol
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, usuário',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Bem-vindo de volta',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white24,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.wb_sunny,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ── CARD DIAS LIMPOS ──────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Dias limpos',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // número grande + label "dias"
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '47',
                                style: TextStyle(
                                  fontSize: 72,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFA7C957),
                                ),
                              ),
                              SizedBox(width: 8),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text(
                                  'dias',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // barra de progresso
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const LinearProgressIndicator(
                              value: 0.65,
                              minHeight: 10,
                              backgroundColor: Color(0xFFEAEAEA),
                              valueColor: AlwaysStoppedAnimation(
                                Color(0xFFA7C957),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            '65% da sua meta mensal',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ── MENSAGEM DO DIA ───────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2B2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '✨ Mensagem do dia',
                        style: TextStyle(
                          fontSize: 18,


                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '"$_mensagemDeHoje"',
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ── COMO VOCÊ ESTÁ HOJE ───────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Como você está hoje?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // emojis dentro de containers brancos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['😊', '😌', '😐', '😔', '😰']
                      .map(
                        (emoji) => Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          emoji,
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),

              const SizedBox(height: 25),

              // ── GRID DE CARDS ─────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: [
                    const _InfoCard(
                      icon: Icons.calendar_today_outlined,
                      title: 'Histórico',
                      subtitle: 'Ver evolução',
                    ),
                    const _InfoCard(
                      icon: Icons.monitor_heart_outlined,
                      title: 'Sintomas',
                      subtitle: 'Registrar',
                    ),
                    const _InfoCard(
                      icon: Icons.show_chart,
                      title: 'Progresso',
                      subtitle: 'Ver gráficos',
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/apoio'),
                      child: const _InfoCard(
                        icon: Icons.favorite_border,
                        title: 'Apoio',
                        subtitle: 'Buscar ajuda',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ── WIDGET DO CARD ─────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: const Color(0xFFA7C957),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}