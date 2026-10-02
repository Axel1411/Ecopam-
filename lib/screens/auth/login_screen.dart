import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import '../mahasiswa/mahasiswa_shell.dart';
import '../cs/cs_shell.dart';
import '../sarpras/sarpras_shell.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController();
  String? _error;

  void _login() {
    final email = _emailController.text.trim().toLowerCase();
    if (email.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _error = 'Email dan kata sandi wajib diisi');
      return;
    }

    Widget target;
    if (email == appStore.petugasCs.email) {
      target = const CsShell();
    } else if (email == appStore.timSarpras.email) {
      target = const SarprasShell();
    } else {
      target = const MahasiswaShell();
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => target));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Center(
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.accentOrangeCard,
                  child: const Icon(Icons.eco, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text('Masuk ke EcoPam',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text('Pakai akun kampus kamu', style: TextStyle(color: AppColors.textMuted)),
              ),
              const SizedBox(height: 28),
              const Text('Email Kampus', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Kata Sandi', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 8),
                Text(_error!, style: const TextStyle(color: AppColors.urgent, fontSize: 12.5)),
              ],
              const SizedBox(height: 20),
              PrimaryButton(label: 'Masuk', onPressed: _login),
              const SizedBox(height: 14),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text('Belum punya akun? ', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterScreen())),
                      child: const Text('Daftar di sini',
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Demo: queen@unpam.ac.id (mahasiswa) · budi@unpam.ac.id (petugas CS) · '
                  'sarpras@unpam.ac.id (Sarpras). Kata sandi bebas diisi apa saja.',
                  style: TextStyle(fontSize: 11.5, color: AppColors.textMuted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
