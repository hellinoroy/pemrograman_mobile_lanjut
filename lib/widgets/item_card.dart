import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
class ItemCard extends StatelessWidget {
  final Widget cardImage;
  final String cardText;
  final String cardPrice;
  final String targetLocation;

  const ItemCard({
    super.key, 
    required this.cardImage, 
    required this.cardText, 
    required this.cardPrice, 
    required this.targetLocation
  });

  @override
  Widget build(BuildContext context) {

    SizedBox cardImageWidget() {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: cardImage,
      );
    }

    Row cardHeader() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardText, style: TextStyle(fontWeight: FontWeight.bold,), textScaler: TextScaler.linear(1.2),),
                SizedBox(height: 5.0,),
                Text(formatPrice(cardPrice)),
              ],
            ),
          ),
        ],
      );
    }

    Expanded cardBody() {
    final colors = Theme.of(context).colorScheme;
    final backgroundColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return colors.secondary; 
      }
      if (states.contains(WidgetState.disabled)) {
        return colors.tertiary; 
      }
      return colors.primary;
    });

    return  Expanded(
        child: Padding(
        padding: const EdgeInsetsGeometry.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            cardHeader(),
            SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => context.push('/detail/$targetLocation'), 
                  style: ButtonStyle(
                    backgroundColor: backgroundColor, 
                    textStyle: WidgetStateProperty.all(TextStyle(color: Colors.white))), 
                    child: const Text('Lihat Detail')),
            )
            ],
        ),
        ),
    );
    }


    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          cardImageWidget(),
          cardBody(),
        ],
      ),
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

