import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/konstants.dart';

class QrButton extends StatelessWidget {
  final VoidCallback onTap;

  const QrButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
          height: MediaQuery.of(context).size.height * KRatios.r057,
          width: MediaQuery.of(context).size.width * KRatios.r046,
          decoration: BoxDecoration(
            color: KColors.pink,
            borderRadius: const BorderRadius.all(
              Radius.circular(KSizes.s30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                context.l10n.qr,
                style: TextStyle(
                    color: KColors.white,
                    fontSize: KFontSizes.f50,
                    fontFamily: KFontsName.hpSimplifiedHans),
              ),
              Text(
                context.l10n.code,
                style: TextStyle(
                    color: KColors.white,
                    fontSize: KFontSizes.f50,
                    fontFamily: KFontsName.hpSimplifiedHans),
              ),
              Icon(
                KIcons.qrCode,
                size: KFontSizes.f50,
                color: KColors.white,
              )
            ],
          ),
        ),

      ]),
    );
  }
}
