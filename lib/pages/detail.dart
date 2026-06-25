import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tb/services/auth_service.dart';
import 'package:tb/services/product_detail_service.dart';
import 'package:tb/models/product_detail.dart';
import 'package:tb/models/comment.dart';
import 'package:tb/services/comment_service.dart';

class Warna {
  final String nama;
  final int harga;

  Warna({required this.nama, required this.harga});
}


class Detail extends StatefulWidget {
  final String id;

  const Detail({required this.id, super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

    final commentController = TextEditingController();
    double selectedRating = 5;
    Future<void> openCommentDialog({Comment? existing, required int productId,}) async {
        commentController.text = existing?.comment ?? '';

        selectedRating = existing?.rating ?? 5;

        await showDialog(
            context: context,
            builder: (_) {
            return StatefulBuilder(
                builder: (
                context,
                setDialogState,
                ) {
                return AlertDialog(
                    title: Text(
                    existing == null
                        ? 'Tambah Komentar'
                        : 'Edit Komentar',
                    ),

                    content: Column(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [
                        TextField(
                        controller:
                            commentController,

                        maxLines: 4,

                        decoration:
                            const InputDecoration(
                            labelText:
                                'Komentar',
                        ),
                        ),

                        const SizedBox(
                        height: 12,
                        ),

                        DropdownButton<double>(
                        value:
                            selectedRating,

                        isExpanded:
                            true,

                        items:
                            List.generate(
                            11,
                            (i) {
                            final v =
                                i * 0.5;

                            return DropdownMenuItem(
                                value:
                                    v,

                                child:
                                    Text(
                                '$v ⭐',
                                ),
                            );
                            },
                        ),

                        onChanged:
                            (v) {
                            setDialogState(
                            () {
                                selectedRating =
                                    v!;
                            },
                            );
                        },
                        ),
                    ],
                    ),

                    actions: [
                    TextButton(
                        onPressed:
                            () =>
                                Navigator.pop(
                        context,
                        ),

                        child:
                            const Text(
                        'Batal',
                        ),
                    ),

                    FilledButton(
                        onPressed:
                            () async {
                        if (existing ==
                            null) {
                            await CommentService
                                .createComment(
                            productId:
                                productId,

                            comment:
                                commentController
                                    .text,

                            rating:
                                selectedRating,
                            );
                        } else {
                           await CommentService.updateComment(
                            productId: productId,
                            id: existing.id,
                            comment: commentController.text,
                            rating: selectedRating,
                          );
                        }

                        if (!mounted)
                            return;

                        Navigator.pop(
                            context,
                        );

                        setState(() {});
                        },

                        child:
                            const Text(
                        'Simpan',
                        ),
                    ),
                    ],
                );
                },
            );
            },
        );
    }


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final backgroundColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return colors.secondary; // Color when pressed
      }
      if (states.contains(WidgetState.disabled)) {
        return colors.tertiary; // Color when disabled
      }
      return colors.primary; // Default color
    });

    final backgroundColor2 = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.grey.shade400; // Color when pressed
      }
      if (states.contains(WidgetState.disabled)) {
        return colors.tertiary; // Color when disabled
      }
      return Colors.white; // Default color
    });


    Table detailProduk({required String tipe, required String konten, required int harga, required String lebar, required String gramasi, required String packing}) {
      return Table(
        columnWidths: {
          0: FixedColumnWidth(120),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('Detail Produk', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Text('')
            ]
          ),
          TableRow(
            children: [
              Text('Fabric Type', style: TextStyle(color: Colors.grey.shade400),),
              Text(':  $tipe')
            ]
          ),
          TableRow(
            children: [
              Text('Fabric Content', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  $konten')
            ]
          ),
          TableRow(
            children: [
              Text('Harga / Yard', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  ${formatPrice(harga.toString())}')
            ]
          ),
          TableRow(
            children: [
              Text('Lebar Kain', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  $lebar')
            ]
          ),
          TableRow(
            children: [
              Text('Gramasi', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  $gramasi')
            ]
          ),
          TableRow(
            children: [
              Text('Packing / Roll', style: TextStyle(color: Colors.grey.shade400)),
              Text(':  $packing')
            ]
          ),
        ],
      );
    }



    bool isEdited(
      Comment comment,
    ) {
      return comment.editedAt !=
          null;
    }

    Widget commentsSection(
      List<Comment> comments,
      int productId,
      ) {
      return FutureBuilder<String?>(
        future:
            AuthService
                .getUserId(),

        builder: (
          context,
          auth,
        ) {
          final currentUser =
              auth.data;

          return Column(
            children: [

              Padding(
                padding:
                    const EdgeInsets.all(
                  10,
                ),

                child: Row(
                  children: [

                    const Expanded(
                      child: Text(
                        'Komentar',

                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),

                    FutureBuilder<bool>(
                      future:
                          AuthService
                              .isLoggedIn(),

                      builder: (
                        context,
                        state,
                      ) {
                        final loggedIn =
                            state.data ??
                                false;

                        return FilledButton(
                          onPressed:
                              loggedIn
                                  ? () =>
                                        openCommentDialog(
                                          productId:
                                              productId,
                                        )
                                  : null,

                          child: Text(
                            loggedIn
                                ? '+ Tambah'
                                : 'Login',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              ...comments.map(
                (c) {
                  final ownComment =
                      currentUser ==
                          c.userId
                              .toString();

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(
                      horizontal:
                          10,

                      vertical:
                          4,
                    ),

                    child: ListTile(
                      title: Row(
                        children: [

                          Expanded(
                            child:
                                Text(
                              c.userName,
                            ),
                          ),

                          Text(
                            '⭐ ${c.rating}',
                          ),
                        ],
                      ),

                      subtitle:
                          Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          const SizedBox(
                            height:
                                4,
                          ),

                          Text(
                            c.comment,
                          ),

                          if (
                              isEdited(
                                c,
                              ))
                            const Text(
                              '(edited)',

                              style:
                                  TextStyle(
                                fontSize:
                                    12,

                                color:
                                    Colors
                                        .grey,
                              ),
                            ),
                        ],
                      ),

                      trailing:
                          ownComment
                              ? PopupMenuButton(
                                  itemBuilder:
                                      (_) => [

                                    const PopupMenuItem(
                                      value:
                                          'edit',

                                      child:
                                          Text(
                                        'Edit',
                                      ),
                                    ),

                                    const PopupMenuItem(
                                      value:
                                          'delete',

                                      child:
                                          Text(
                                        'Delete',
                                      ),
                                    ),
                                  ],

                                  onSelected:
                                      (
                                    value,
                                  ) async {
                                    if (value ==
                                        'edit') {
                                      openCommentDialog(
                                        existing:
                                            c,

                                        productId:
                                            productId,
                                      );
                                    }

                                    if (value ==
                                        'delete') {
                                      await CommentService
                                          .deleteComment(
                                        productId:
                                            productId,

                                        id:
                                            c.id,
                                      );

                                      setState(
                                        () {},
                                      );
                                    }
                                  },
                                )

                              : null,
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return FutureBuilder<ProductDetail>(
      future: ProductDetailService.getProductById(int.parse(widget.id)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
        return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
        );
        }

        if (!snapshot.hasData) {
            return const Scaffold(
                body: Center(
                child: CircularProgressIndicator(),
                ),
            );
        }

        final product = snapshot.data!;
        String appBarTitle = product.nama;

        return Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Image.network(product.imgUrl, height: 300.0, width: 300.0,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Harga: ${formatPrice(product.harga.toString())} / Kilogram', style: TextStyle(color: colors.primary, fontSize: 22, fontWeight: FontWeight.bold  ),),
                    ),
                    Divider(color: Colors.grey, thickness: 2, indent: 10, endIndent: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: detailProduk(
                        tipe: product.tipe, 
                        konten: product.konten, 
                        harga: product.harga, 
                        lebar: product.lebar, 
                        gramasi: product.gramasi, 
                        packing: product.packing,
                      ),
                    ),
                    Divider(color: Colors.grey, thickness: 2, indent: 10, endIndent: 10),
                    Padding(
                      padding: const EdgeInsetsGeometry.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                            Text(product.deskripsi),
                            const SizedBox(height: 20),
                            FutureBuilder<List<Comment>>(
                                future: CommentService.getComments(product.id,),
                                builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                    return const Center(
                                        child:
                                            CircularProgressIndicator(),
                                    );
                                    }

                                    if (snapshot.hasError) {
                                    return const Text(
                                        'Gagal memuat komentar',
                                    );
                                    }

                                    return commentsSection(
                                        snapshot.data!,
                                        product.id,
                                    );
                                },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row( 
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: colors.primary, 
                            width: 1,         
                          ),
                          ),
                        ),
                        child: FilledButton(
                          onPressed: () => {}, 
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )
                            ),
                          
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            ),
                            backgroundColor: backgroundColor2, 
                            textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white))),
                            child: Column(
                              children: [
                                Icon(Icons.chat_bubble_outline_outlined, color: colors.primary,),
                                const SizedBox(height: 4,),
                                Text('Request Handfeel', style: TextStyle(color: colors.primary),)
                              ],
                            )
                        ),
                      ),
                    ),
                    Expanded(
                        child: FilledButton(
                            onPressed: () async {
                                final loggedIn = await AuthService.isLoggedIn();
                                if (!loggedIn) {
                                    if (!context.mounted) return;
                                    return context.go('/login');
                                }


                                final prefs = await SharedPreferences.getInstance();
                                String? existingCartString = prefs.getString('keranjang');
                                List<dynamic> cartList = [];

                                if (existingCartString != null) {
                                    cartList = jsonDecode(existingCartString);
                                }

                                int existingIndex = cartList.indexWhere((item) => item['id'] == product.id);

                                if (existingIndex != -1) {
                                    cartList[existingIndex]['jumlah'] += 1;
                                } else {
                                    final data = {
                                    "id": product.id,
                                    "nama": product.nama,
                                    "jumlah": 1,
                                    "harga": product.harga,
                                    };
                                    cartList.add(data);
                                }
                                await prefs.setString('keranjang', jsonEncode(cartList));
                            },     
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                    )
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: WidgetStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                ),
                                backgroundColor: backgroundColor, 
                                textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white))
                            ),
                            child: const Text('Tambah ke Keranjang')
                       )
                    ),
                  ],
                ),
              )
            ],
          ),
        );

      }
    );

    
  }


String formatPrice(String value) {
final number = num.tryParse(value) ?? 0;

    return NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(number);
}

}
