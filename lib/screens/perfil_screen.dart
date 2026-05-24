import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),

      // ── BOTTOM NAV ──────────────────────────────────────────────
      bottomNavigationBar: BottomNav(currentIndex: 4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ── HEADER VERDE ─────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFFA7C957),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [

                    // avatar
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 55,
                        color: Color(0xFF7B68AA),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // nome
                    const Text(
                      'Usuário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // membro desde
                    const Text(
                      'Membro desde Jan 2026',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // badge dias limpos
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '47 dias limpos 🎉',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── METAS ATUAIS ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
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
                    children: [
                      const Text(
                        'Metas atuais',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // meta 1
                      _MetaItem(
                        label: 'Dias sem recaída',
                        valor: 0.78,
                        porcentagem: '78%',
                      ),

                      const SizedBox(height: 14),

                      // meta 2
                      _MetaItem(
                        label: 'Progresso emocional',
                        valor: 0.65,
                        porcentagem: '65%',
                      ),

                      const SizedBox(height: 16),

                      // frase de incentivo
                      const Center(
                        child: Text(
                          '🔥 Sua evolução está indo muito bem',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── CARDS DE ESTATÍSTICAS ─────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _StatCard(
                      valor: '47',
                      label: 'Dias limpos',
                      cor: const Color(0xFFA7C957),
                      icone: Icons.calendar_today_outlined,
                    ),
                    const SizedBox(width: 12),
                    _StatCard(
                      valor: '32',
                      label: 'Registros',
                      cor: const Color(0xFFFFF2B2),
                      corTexto: Colors.black87,
                      corIcone: const Color(0xFFD4A017),
                      icone: Icons.favorite_border,
                    ),
                    const SizedBox(width: 12),
                    _StatCard(
                      valor: '5',
                      label: 'Metas ok',
                      cor: const Color(0xFFA7C957),
                      icone: Icons.check_circle_outline,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── CONQUISTAS ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
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
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.emoji_events_outlined,
                              color: Color(0xFFA7C957)),
                          SizedBox(width: 8),
                          Text(
                            'Conquistas',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _ConquistaItem(emoji: '🌱', label: '7 dias'),
                            const SizedBox(width: 12),
                            _ConquistaItem(emoji: '🦆', label: '30 dias'),
                            const SizedBox(width: 12),
                            _ConquistaItem(
                                emoji: '🏆', label: '90 dias', bloqueado: true),
                            const SizedBox(width: 12),
                            _ConquistaItem(emoji: '🐓', label: '1º registro'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── MENU DE OPÇÕES ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
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
                    children: [
                      _MenuItem(
                        icone: Icons.person_outline,
                        label: 'Editar perfil',
                        onTap: () {},
                      ),
                      _Divider(),
                      _MenuItem(
                        icone: Icons.track_changes_outlined,
                        label: 'Minhas metas',
                        onTap: () {},
                      ),
                      _Divider(),
                      _MenuItem(
                        icone: Icons.notifications_outlined,
                        label: 'Notificações',
                        onTap: () {},
                      ),
                      _Divider(),
                      _MenuItem(
                        icone: Icons.lock_outline,
                        label: 'Privacidade',
                        onTap: () {},
                      ),
                      _Divider(),
                      _MenuItem(
                        icone: Icons.help_outline,
                        label: 'Ajuda e suporte',
                        onTap: () {},
                      ),
                      _Divider(),
                      _MenuItem(
                        icone: Icons.info_outline,
                        label: 'Sobre o app',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── BOTÃO SAIR ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                            (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xFFE53935),
                    ),
                    label: const Text(
                      'Sair da conta',
                      style: TextStyle(
                        color: Color(0xFFE53935),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE53935)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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

// ── META COM BARRA DE PROGRESSO ────────────────────────────────────
class _MetaItem extends StatelessWidget {
  final String label;
  final double valor;
  final String porcentagem;

  const _MetaItem({
    required this.label,
    required this.valor,
    required this.porcentagem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style:
                const TextStyle(fontSize: 14, color: Colors.black87)),
            Text(
              porcentagem,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFA7C957),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: valor,
            minHeight: 8,
            backgroundColor: const Color(0xFFEAEAEA),
            valueColor:
            const AlwaysStoppedAnimation(Color(0xFFA7C957)),
          ),
        ),
      ],
    );
  }
}

// ── CARD DE ESTATÍSTICA ────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final String valor;
  final String label;
  final Color cor;
  final IconData icone;
  final Color corTexto;
  final Color corIcone;

  const _StatCard({
    required this.valor,
    required this.label,
    required this.cor,
    required this.icone,
    this.corTexto = Colors.white,
    this.corIcone = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(icone, color: corIcone, size: 22),
            const SizedBox(height: 8),
            Text(
              valor,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: corTexto,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: corTexto),
            ),
          ],
        ),
      ),
    );
  }
}

// ── CONQUISTA ──────────────────────────────────────────────────────
class _ConquistaItem extends StatelessWidget {
  final String emoji;
  final String label;
  final bool bloqueado;

  const _ConquistaItem({
    required this.emoji,
    required this.label,
    this.bloqueado = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: bloqueado ? 0.4 : 1.0,
      child: Container(
        width: 75,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFDCEDC8),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── ITEM DO MENU ───────────────────────────────────────────────────
class _MenuItem extends StatelessWidget {
  final IconData icone;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icone,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFEFF5E6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icone, color: const Color(0xFF558B2F), size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 15),
      ),
      trailing: const Icon(Icons.chevron_right,
          color: Colors.black38, size: 20),
    );
  }
}

// ── DIVISOR ────────────────────────────────────────────────────────
class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 20,
      endIndent: 20,
      color: Color(0xFFF0F0F0),
    );
  }
}