import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/bottom_nav.dart'; // para o botão "Ligar"

class ApoioScreen extends StatelessWidget {
  const ApoioScreen({super.key});

  // Abre o discador do celular com o número
  void _ligar(String numero) async {
    final uri = Uri(scheme: 'tel', path: numero);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  // Abre o Google Maps com o endereço
  void _verMapa(String local) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(local)}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),

      bottomNavigationBar: BottomNav(currentIndex: 3),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER VERDE ─────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
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
                    // botão voltar
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Apoio Psicossocial',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Você não está sozinho !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ── CARD AMARELO DE AVISO ─────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2B2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.groups, color: Color(0xFFA7C957), size: 22),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estamos aqui por você',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Buscar ajuda é um sinal de coragem e força. Não hesite em entrar em contato.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
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

              const SizedBox(height: 16),



              // ── TÍTULO SEÇÃO ──────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Contatos de emergência',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── CARD CVV ──────────────────────────────────────────
              _ContatoCard(
                cor: const Color(0xFFFFCDD2),
                icone: Icons.favorite,
                corIcone: const Color(0xFFE53935),
                nome: 'CVV - Centro de Valorização da Vida',
                descricao: 'Apoio emocional e prevenção do suicídio',
                horario: '24 horas',
                botao: _BotaoAcao(
                  icone: Icons.phone,
                  label: 'Ligar 188',
                  onTap: () => _ligar('188'),
                  preenchido: true,
                ),
              ),

              const SizedBox(height: 40),


              // ── TÍTULO LOCAIS DE APOIO ──────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Locais de Apoio',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── AVISO CAPS ───────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE0B2), // laranja claro
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFF9800),
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFFE65100),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Atenção sobre o CAPS',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE65100),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Nem todos os CAPS realizam acolhimento durante crises, mesmo dentro do horário de funcionamento.'
                                  ' Em caso de crise grave, dirija-se à UPA ou pronto-socorro mais próximo.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF7f3700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── CARD CAPS ─────────────────────────────────────────
              _ContatoCard(
                cor: const Color(0xFFDCEDC8),
                icone: Icons.psychology,
                corIcone: const Color(0xFF558B2F),
                nome: 'CAPS - Centro de Atenção Psicossocial',
                descricao: 'Atendimento especializado em saúde mental',
                horario: 'Seg-Sex 8h-18h',
                botao: _BotaoAcao(
                  icone: Icons.location_on_outlined,
                  label: 'Ver mapa',
                  onTap: () => _verMapa('CAPS Centro de Atenção Psicossocial'),
                  preenchido: false,
                ),
              ),

              const SizedBox(height: 16),

              // ── CARD GRUPO ORIENTAÇÃO: NARCÓTICOS ANÔNIMOS ──────────────────────────
              _ContatoCard(
                cor: const Color(0xFFDCEDC8),
                icone: Icons.group_outlined,
                corIcone: const Color(0xFF558B2F),
                nome: 'Grupo Orientação - Narcóticos Anônimos',
                descricao: 'Reuniões de apoio mútuo no prédio do Conselho Municipal de Entorpecentes (Comen)',
                horario: 'Ter, Qui e Dom - 19h-21h30',
                botao: _BotaoAcao(
                  icone: Icons.location_on_outlined,
                  label: 'Ver mapa',
                  onTap: () => _verMapa('Santa Maria, RS, Rua Euclides da Cunha, 1875'),
                  preenchido: false,
                ),
              ),

              const SizedBox(height: 30),

              // ── CARD GRUPO SERENIDADE: NARCÓTICOS ANÔNIMOS ──────────────────────────
              _ContatoCard(
                cor: const Color(0xFFDCEDC8),
                icone: Icons.group_outlined,
                corIcone: const Color(0xFF558B2F),
                nome: 'Grupo Serenidade - Narcóticos Anônimos',
                descricao: 'Se algum dia precisar de ajuda, teremos satisfação em recebê-lo em nossa Irmandade.',
                horario: 'Sábados - 18h-20h',
                botao: _BotaoAcao(
                  icone: Icons.location_on_outlined,
                  label: 'Ver mapa',
                  onTap: () => _verMapa('Santa Maria, RS, Avenida Borges de Medeiros, 880'),
                  preenchido: false,
                ),
              ),

              const SizedBox(height: 30),

              // ── CARD GRUPO BRAVURA: NARCÓTICOS ANÔNIMOS ──────────────────────────
              _ContatoCard(
                cor: const Color(0xFFDCEDC8),
                icone: Icons.group_outlined,
                corIcone: const Color(0xFF558B2F),
                nome: 'Grupo Bravura - Narcóticos Anônimos',
                descricao: 'Programa de tratamento ao alcoolismo situado no centro de Santa Maria',
                horario: 'Seg, Qua e Sex - 19:30h-21:30h',
                botao: _BotaoAcao(
                  icone: Icons.location_on_outlined,
                  label: 'Ver mapa',
                  onTap: () => _verMapa('Santa Maria, RS, Avenida Rio Branco, 880'),
                  preenchido: false,
                ),
              ),

              const SizedBox(height: 30),

              const SizedBox(height: 25),

// ── TÍTULO PROFISSIONAIS ──────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Profissionais disponíveis',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

// ── LISTA DE PROFISSIONAIS ────────────────────────────────
              _ProfissionalCard(
                nome: 'Dra. Maria Silva',
                especialidade: 'Dependência Química',
                onMensagem: () {
                  // futuramente abre chat ou WhatsApp
                },
              ),

              const SizedBox(height: 12),

              _ProfissionalCard(
                nome: 'Dr. João Santos',
                especialidade: 'Saúde Mental',
                onMensagem: () {},
              ),

              const SizedBox(height: 12),

              _ProfissionalCard(
                nome: 'Dra. Ana Costa',
                especialidade: 'Terapia Cognitiva',
                onMensagem: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── WIDGET DO CARD DE CONTATO ──────────────────────────────────────
class _ContatoCard extends StatelessWidget {
  final Color cor;
  final IconData icone;
  final Color corIcone;
  final String nome;
  final String descricao;
  final String horario;
  final Widget botao;

  const _ContatoCard({
    required this.cor,
    required this.icone,
    required this.corIcone,
    required this.nome,
    required this.descricao,
    required this.horario,
    required this.botao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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

            // ícone + nome + descrição
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icone, color: corIcone, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        descricao,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // bolinha + horário
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFA7C957),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            horario,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // botão de ação
            botao,
          ],
        ),
      ),
    );
  }
}

// ── WIDGET DO BOTÃO DE AÇÃO ────────────────────────────────────────
class _BotaoAcao extends StatelessWidget {
  final IconData icone;
  final String label;
  final VoidCallback onTap;
  final bool preenchido; // true = verde cheio | false = só borda

  const _BotaoAcao({
    required this.icone,
    required this.label,
    required this.onTap,
    required this.preenchido,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icone, size: 18),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: preenchido ? Colors.white : const Color(0xFFA7C957),
          backgroundColor: preenchido ? const Color(0xFFA7C957) : Colors.transparent,
          side: const BorderSide(color: Color(0xFFA7C957)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

// ── WIDGET DO CARD DE PROFISSIONAL ────────────────────────────────
class _ProfissionalCard extends StatelessWidget {
  final String nome;
  final String especialidade;
  final VoidCallback onMensagem;

  const _ProfissionalCard({
    required this.nome,
    required this.especialidade,
    required this.onMensagem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [

            // avatar
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFDCEDC8),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF558B2F),
                size: 26,
              ),
            ),

            const SizedBox(width: 14),

            // nome + especialidade
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    especialidade,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // ícone de mensagem
            IconButton(
              onPressed: onMensagem,
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Color(0xFFA7C957),
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}