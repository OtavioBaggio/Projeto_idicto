# 📋 Pendências — IDICTO

> Status geral: Em desenvolvimento

---

## 🔴 Funcionalidades principais

###  Recaída
- [ ] Botão discreto "Registrar recaída" na HomeScreen
- [ ] Modal de acolhimento ao registrar recaída
- [ ] Lógica de reinício do contador de dias
- [ ] Registro da recaída no histórico sem apagar dados anteriores

###  Tela de Histórico (`historico_screen.dart`)
- [ ] Criar a tela
- [ ] Linha do tempo com ciclos de remissão
- [ ] Exibir recaídas registradas na linha do tempo
- [ ] Calendário de dias limpos

###  Tela de Sintomas (`sintomas_screen.dart`)
- [ ] Criar a tela
- [ ] Check-in diário de sintomas
- [ ] Seleção de intensidade (leve / moderado / forte)
- [ ] Campo de observações livres
- [ ] Salvar registro com data e hora

###  Progresso
- [ ] Gráfico de evolução emocional (pacote `fl_chart`)
- [ ] Gráfico de dias limpos ao longo do tempo
- [ ] Exibir na tela de Perfil ou tela dedicada

### 🖥 Telas
- [x] Tela de Login (`login_screen.dart`)
- [x] Tela de Onboarding (`onboarding_screen.dart`)
- [x] Tela Home (`home_screen.dart`)
- [x] Tela de Apoio Psicossocial (`apoio_screen.dart`)
- [x] Tela de Perfil (`perfil_screen.dart`)

###  Navegação
- [x] Widget de navegação inferior reutilizável (`bottom_nav.dart`)
- [x] Navegação entre telas via rotas nomeadas (`main.dart`)
- [x] Efeito de fundo escuro no item ativo do menu inferior

###  Apoio
- [x] Botão "Ver mapa" com integração Google Maps
- [x] Botão "Ligar 188" com integração telefone
- [x] Aviso sobre limitação do CAPS
- [x] Lista de profissionais disponíveis na tela de Apoio

###  Mensagens
- [x] Arquivo com 200 mensagens motivacionais por dia aleatórias (`mensagens.dart`)

---

## 🟡 Banco de dados

- [ ] Integrar Firebase (`firebase_core`, `cloud_firestore`)
- [ ] Salvar data de início da remissão do usuário
- [ ] Salvar dependências selecionadas no onboarding
- [ ] Salvar sintomas e objetivos selecionados no onboarding
- [ ] Persistir check-ins diários de sintomas
- [ ] Persistir histórico de recaídas
- [ ] Carregar dados do usuário na HomeScreen (nome, dias limpos reais)

---

## 🟡 Autenticação

- [ ] Implementar cadastro real com e-mail e senha (Firebase Auth)
- [ ] Implementar login real com e-mail e senha
- [ ] Implementar login com Google (`google_sign_in`)
- [ ] Lógica de redirecionamento: novo usuário → onboarding / já cadastrado → home
- [ ] Tela de recuperação de senha

---

## 🟡 Notificações

- [ ] Configurar `flutter_local_notifications`
- [ ] Notificação diária de incentivo com mensagem motivacional
- [ ] Notificação de marco (7 dias, 30 dias, 90 dias)
- [ ] Configurações de notificação na tela de Perfil

---

## 🟡 Tela de Perfil

- [ ] Tela "Editar perfil" (nome, foto, data de início)
- [ ] Tela "Minhas metas" (editar objetivos escolhidos no onboarding)
- [ ] Tela "Notificações" (ligar/desligar alertas)
- [ ] Tela "Privacidade" (política de dados, anonimato)
- [ ] Tela "Ajuda e suporte"
- [ ] Tela "Sobre o app"
- [ ] Foto de perfil real (câmera ou galeria)
- [ ] Conquistas desbloqueando automaticamente por dias limpos

---

## 🟡 Onboarding

- [ ] Salvar seleções do onboarding no banco de dados
- [ ] Usar dependências selecionadas para personalizar conteúdo do app
- [ ] Usar sintomas selecionados como base para o check-in diário

---

## 🟠 Estrutura e boas práticas

###  Separação de widgets
- [ ] Extrair `_InfoCard` da `home_screen.dart` → `lib/widgets/info_card.dart`
- [ ] Extrair `_ContatoCard` da `apoio_screen.dart` → `lib/widgets/contato_card.dart`
- [ ] Extrair `_BotaoAcao` da `apoio_screen.dart` → `lib/widgets/botao_acao.dart`
- [ ] Extrair `_ProfissionalCard` da `apoio_screen.dart` → `lib/widgets/profissional_card.dart`
- [ ] Extrair `_MetaItem` da `perfil_screen.dart` → `lib/widgets/meta_item.dart`
- [ ] Extrair `_StatCard` da `perfil_screen.dart` → `lib/widgets/stat_card.dart`
- [ ] Extrair `_ConquistaItem` da `perfil_screen.dart` → `lib/widgets/conquista_item.dart`
- [ ] Extrair `_MenuItem` da `perfil_screen.dart` → `lib/widgets/menu_item.dart`
- [ ] Extrair card de "Mensagem do dia" → `lib/widgets/mensagem_card.dart`
- [ ] Extrair header verde padrão → `lib/widgets/header_verde.dart`
- [x] Widget de navegação inferior separado (`bottom_nav.dart`)

###  Estrutura das pastas
-  Possível organização futura do projeto:

```
lib/
├── main.dart
├── app/
│   └── routes.dart              ← rotas centralizadas
├── constants/
│   ├── mensagens.dart           ← já existe
│   ├── app_colors.dart          ← cores do app centralizadas
│   └── app_strings.dart         ← textos fixos centralizados
├── models/
│   ├── usuario.dart             ← modelo de dados do usuário
│   ├── sintoma.dart             ← modelo de sintoma
│   └── recaida.dart             ← modelo de recaída
├── services/
│   ├── auth_service.dart        ← lógica de autenticação
│   ├── usuario_service.dart     ← lógica de dados do usuário
│   └── notificacao_service.dart ← lógica de notificações
├── screens/
│   ├── login_screen.dart
│   ├── onboarding_screen.dart
│   ├── home_screen.dart
│   ├── apoio_screen.dart
│   ├── perfil_screen.dart
│   ├── historico_screen.dart
│   └── sintomas_screen.dart
└── widgets/
    ├── bottom_nav.dart          ← já existe
    ├── info_card.dart
    ├── contato_card.dart
    ├── profissional_card.dart
    ├── meta_item.dart
    ├── stat_card.dart
    ├── conquista_item.dart
    ├── menu_item.dart
    ├── mensagem_card.dart
    └── header_verde.dart
```

###  Centralizar cores e temas
- [ ] Criar `lib/constants/app_colors.dart` com todas as cores do app:
```dart
class AppColors {
  static const verde = Color(0xFFA7C957);
  static const verdeEscuro = Color(0xFF558B2F);
  static const verdeClaro = Color(0xFFDCEDC8);
  static const amarelo = Color(0xFFFFF2B2);
  static const fundo = Color(0xFFF4F8F2);
  static const azulEscuro = Color(0xFF183B4E);
}
```
- [ ] Substituir todos os `Color(0xFF...)` hardcoded pelas constantes

###  Centralizar rotas
- [ ] Criar `lib/app/routes.dart` com todas as rotas em um lugar só:


###  Gerenciamento de estado dos dependentes químicos
- [ ] Remover dados hardcoded (ex: `47 dias`, `65%`) e conectar ao estado real


---

## 🔵 Melhorias de UX

- [ ] Splash screen com logo do IDICTO
- [ ] Animações de transição entre telas  
- [ ] Dias limpos calculados dinamicamente pela data real do usuário
- [ ] Barra de progresso da meta mensal calculada dinamicamente
- [ ] Estado de carregamento (loading) nas telas com dados do Firebase
- [ ] Tratamento de erros de conexão

---

## 🔵 Segurança e ética

- [ ] Opção de anonimato para o usuário
- [ ] Política de privacidade (LGPD)
- [ ] Permissões do Android/iOS declaradas no `AndroidManifest.xml`

---

## 🔵 Pré-lançamento

- [ ] Testes com usuários reais - a ser escolhido
- [ ] Validação com profissional de saúde mental
- [ ] Ícone do app (`flutter_launcher_icons`)
- [ ] Nome e descrição na Play Store
- [ ] Build de release para Android (`.aab`)
- [ ] Talvez não teremos: Build de release para iOS (requer Mac + Xcode) 

---

##  Pacotes 

| Pacote | Para que serve | Status |
|---|---|---|
| `url_launcher` | Ligar e abrir mapas | ✅ Instalado |
| `firebase_core` | Base do Firebase | ⏳ Pendente |
| `cloud_firestore` | Banco de dados | ⏳ Pendente |
| `firebase_auth` | Autenticação | ⏳ Pendente |
| `google_sign_in` | Login com Google | ⏳ Pendente |
| `flutter_local_notifications` | Notificações | ⏳ Pendente |
| `fl_chart` | Gráficos de progresso | ⏳ Pendente |
| `flutter_launcher_icons` | Ícone do app | ⏳ Pendente |
| `image_picker` | Foto de perfil | ⏳ Pendente |

---
