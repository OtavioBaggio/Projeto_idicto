import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return; // já está na tela, não navega

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/historico');
        break;
      case 2:
        Navigator.pushNamed(context, '/sintomas');
        break;
      case 3:
        Navigator.pushNamed(context, '/apoio');
        break;
      case 4:
        Navigator.pushNamed(context, '/perfil');
        break;
    }
  }

  // ── ITEM NORMAL (não selecionado) ─────────────────────────────
  BottomNavigationBarItem _itemNormal({
    required IconData icone,
    required String label,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icone),
    );
  }

  // ── ITEM ATIVO (selecionado com fundo escuro) ─────────────────
  BottomNavigationBarItem _itemAtivo({
    required IconData icone,
    required String label,
  }) {
    return BottomNavigationBarItem(
      label: '', // label vazio — texto fica dentro do Container
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icone,
              color: const Color(0xFFA7C957),
              size: 22,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFA7C957),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // mapa de todas as abas: índice → (ícone, label)
    final abas = [
      {'icone': Icons.home,                    'label': 'Início'},
      {'icone': Icons.calendar_today,          'label': 'Histórico'},
      {'icone': Icons.monitor_heart_outlined,  'label': 'Sintomas'},
      {'icone': Icons.favorite_border,         'label': 'Apoio'},
      {'icone': Icons.person_outline,          'label': 'Perfil'},
    ];

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFFA7C957),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) => _onTap(context, index),

        // gera os itens: ativo recebe fundo escuro, os demais ficam normais
        items: List.generate(abas.length, (i) {
          final icone = abas[i]['icone'] as IconData;
          final label = abas[i]['label'] as String;

          return i == currentIndex
              ? _itemAtivo(icone: icone, label: label)
              : _itemNormal(icone: icone, label: label);
        }),
      ),
    );
  }
}