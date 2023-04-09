import 'package:ams_frontend/src/konstants/kicons.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';

class FaceIdButton extends StatelessWidget {
  final VoidCallback onTap;

  const FaceIdButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * KRatios.r020,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: KColors.yellow,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(KSizes.s30),
                topRight: Radius.circular(KSizes.s30),
                bottomRight: Radius.circular(KSizes.s30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * KRatios.r040,
                    child: Center(
                      child: Text(
                        context.l10n.face,
                        style: TextStyle(
                            fontSize: KFontSizes.f50,
                            fontFamily: KFontsName.hpSimplifiedHans),
                      ),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * KRatios.r040,
                    child: const Icon(
                      KIcons.camera,
                      size: KFontSizes.f50,
                    )),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * KRatios.r020,
            width: MediaQuery.of(context).size.width * KRatios.r045,
            decoration: BoxDecoration(
                color: KColors.yellow,
                border: Border.all(width: 0, color: KColors.yellow),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(KSizes.s30),
                    bottomRight: Radius.circular(KSizes.s30))),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * KRatios.r040,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    context.l10n.id,
                    style: TextStyle(
                        fontSize: KFontSizes.f50,
                        fontFamily: KFontsName.hpSimplifiedHans),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
