import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_theme.dart';
import 'login_page.dart';
import '../services/auth_service.dart';

class Saya extends StatelessWidget {
  const Saya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Header Profil ──────────────────────────────────
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primary, AppTheme.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                  child: Row(
                    children: [
                      // Avatar
                      Stack(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.person_rounded,
                                size: 34, color: AppTheme.primary),
                          ),
                        ],
                      ),
                      const SizedBox(width: 14),
                      // Info user
                      Expanded(
                        child: FutureBuilder(
                          future: Future.wait([
                            AuthService.getUserNama(),
                            AuthService.getUserEmail(),
                          ]),

                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SizedBox(
                                height: 40,
                                child: Align(
                                  alignment:
                                      Alignment.centerLeft,

                                  child:
                                      CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }

                            final nama =
                                snapshot.data?[0] ??
                                    'Guest';

                            final email =
                                snapshot.data?[1] ??
                                    '';

                            return Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                Text(
                                  nama,

                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white,

                                    fontSize:
                                        17,

                                    fontWeight:
                                        FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(
                                  height: 2,
                                ),

                                Text(
                                  email,

                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white70,

                                    fontSize:
                                        13,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ── Pesanan Saya ───────────────────────────────────
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                children: [
                  // Header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pesanan Saya',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textDark,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text(
                              'Lihat Riwayat Pesanan',
                              style: TextStyle(
                                  color: AppTheme.textGrey, fontSize: 12),
                            ),
                            Icon(Icons.chevron_right_rounded,
                                color: AppTheme.textGrey, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 4 status pesanan
                  Row(
                    children: [
                      _orderStatus(
                        context,
                        icon: Icons.wallet_outlined,
                        label: 'Belum\nBayar',
                        badge: null, // placeholder: nanti dari API
                      ),
                      _orderStatus(
                        context,
                        icon: Icons.inventory_2_outlined,
                        label: 'Dikemas',
                        badge: null,
                      ),
                      _orderStatus(
                        context,
                        icon: Icons.local_shipping_outlined,
                        label: 'Dikirim',
                        badge: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── Bantuan ────────────────────────────────────────
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 14, 16, 8),
                    child: Text(
                      'Bantuan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ),
                  _bantuanItem(
                    icon: Icons.help_outline_rounded,
                    label: 'Pusat Bantuan',
                    onTap: () => _showPusatBantuan(context),
                  ),
                  const Divider(height: 1, indent: 56, color: AppTheme.divider),
                  _bantuanItem(
                    icon: Icons.headset_mic_outlined,
                    label: 'Customer Service',
                    onTap: () => _showCustomerService(context),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── Logout ─────────────────────────────────────────
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: OutlinedButton.icon(
                onPressed: () => _confirmLogout(context),
                icon: const Icon(Icons.logout_rounded, color: AppTheme.primary),
                label: const Text(
                  'Keluar',
                  style: TextStyle(
                      color: AppTheme.primary, fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppTheme.primary),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // ── Widget helper: status pesanan ──
  Widget _orderStatus(
    BuildContext context, {
    required IconData icon,
    required String label,
    String? badge,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _navigatePesanan(context, label),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 32, color: AppTheme.textDark),
                if (badge != null)
                  Positioned(
                    right: -8,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 11, color: AppTheme.textDark, height: 1.3),
            ),
          ],
        ),
      ),
    );
  }

  // ── Navigate ke halaman pesanan sesuai label ──
  void _navigatePesanan(BuildContext context, String label) {
    final clean = label.replaceAll('\n', ' ').trim();
    Widget page;
    switch (clean) {
      // case 'Belum Bayar':
      //   page = const BelumBayarPage();
      //   break;
      // case 'Dikemas':
      //   page = const DikemasPage();
      //   break;
      // case 'Dikirim':
      //   page = const DikirimPage();
      //   break;
      // case 'Beri Penilaian':
      //   page = const BeriPenilaianPage();
      //   break;
      default:
        return;
    }
    // Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  // ── Widget helper: item bantuan ──
  Widget _bantuanItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 14, color: AppTheme.textDark),
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppTheme.textLight),
          ],
        ),
      ),
    );
  }

  // ── Bottom sheet: Pusat Bantuan ──
  void _showPusatBantuan(BuildContext context) {
    final faqs = [
      {
        'q': 'Bagaimana cara memesan produk?',
        'a': 'Pilih produk → Tambah ke Keranjang → Checkout → Pilih alamat & pembayaran → Konfirmasi.',
      },
      {
        'q': 'Apa saja metode pembayaran?',
        'a': 'Transfer Bank, Dompet Digital (GoPay, OVO, Dana), QRIS, Kartu Kredit/Debit, dan COD.',
      },
      {
        'q': 'Berapa lama waktu pengiriman?',
        'a': 'Jakarta 1-2 hari, Pulau Jawa 2-3 hari, Luar Jawa 3-7 hari kerja.',
      },
      {
        'q': 'Apakah bisa retur/tukar barang?',
        'a': 'Ya, dalam 7 hari setelah barang diterima, syarat barang belum dipotong dan kondisi asli.',
      },
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        builder: (_, scrollCtrl) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: Row(
                  children: [
                    Icon(Icons.help_outline_rounded,
                        color: AppTheme.primary),
                    SizedBox(width: 8),
                    Text(
                      'Pusat Bantuan',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppTheme.divider),
              Expanded(
                child: ListView.separated(
                  controller: scrollCtrl,
                  padding: const EdgeInsets.all(16),
                  itemCount: faqs.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: 12),
                  itemBuilder: (_, i) => Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faqs[i]['q']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textDark,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          faqs[i]['a']!,
                          style: const TextStyle(
                              color: AppTheme.textGrey,
                              fontSize: 13,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Bottom sheet: Customer Service ──
  void _showCustomerService(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.headset_mic_outlined, color: AppTheme.primary),
                SizedBox(width: 8),
                Text(
                  'Customer Service',
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Tim kami siap membantu 24/7',
              style: TextStyle(color: AppTheme.textGrey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _csOption(
                  context,
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Live Chat',
                  subtitle: 'Respon < 5 menit',
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(width: 12),
                _csOption(
                  context,
                  icon: Icons.phone_outlined,
                  label: 'Telepon',
                  subtitle: '08001234567',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _csOption(
                  context,
                  icon: Icons.email_outlined,
                  label: 'Email',
                  subtitle: 'cs@tokotekstil.id',
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(width: 12),
                _csOption(
                  context,
                  icon: Icons.message_outlined,
                  label: 'WhatsApp',
                  subtitle: 'Respon cepat',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _csOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(0.07),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Icon(icon, color: AppTheme.primary, size: 26),
              const SizedBox(height: 6),
              Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                      fontSize: 13)),
              const SizedBox(height: 2),
              Text(subtitle,
                  style: const TextStyle(
                      color: AppTheme.textGrey, fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }

  // ── Dialog logout ──
  void _confirmLogout(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (
        dialogContext,
      ) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
              16,
            ),
          ),

          title: const Text(
            'Keluar?',
            style: TextStyle(
              fontWeight:
                  FontWeight.w700,
            ),
          ),

          content: const Text(
            'Kamu yakin ingin keluar dari akun ini?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(
                  dialogContext,
                ).pop();
              },

              child: const Text(
                'Batal',

                style: TextStyle(
                  color:
                      AppTheme
                          .textGrey,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                Navigator.of(
                  dialogContext,
                ).pop();

                await AuthService
                    .logout();

                if (!context.mounted) {
                  return;
                }

                context.go(
                  '/',
                );
              },

              child: const Text(
                'Keluar',
              ),
            ),
          ],
        );
      },
    );
  }


}
