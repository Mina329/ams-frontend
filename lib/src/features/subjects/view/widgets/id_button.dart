import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/konstants.dart';

class IdButton extends StatelessWidget {
  final VoidCallback onTap;
  const IdButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * KRatios.r037,
        width: MediaQuery.of(context).size.width * KRatios.r045,
        decoration: BoxDecoration(
          color: KColors.darkPurple,
          borderRadius: const BorderRadius.all(
            Radius.circular(KSizes.s30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              context.l10n.id,
              style: TextStyle(
                  color: KColors.white,
                  fontSize: KFontSizes.f50,
                  fontFamily: KFontsName.hpSimplifiedHans),
            ),
            Icon(
              KIcons.id,
              size: KFontSizes.f50,
              color: KColors.white,
            )
          ],
        ),
      ),
    );
  }
}
