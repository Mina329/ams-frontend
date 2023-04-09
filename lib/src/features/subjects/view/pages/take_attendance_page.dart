import 'package:ams_frontend/src/features/subjects/view/widgets/face_id_button.dart';
import 'package:ams_frontend/src/features/subjects/view/widgets/id_button.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../konstants/konstants.dart';
import '../widgets/qr_button.dart';

class TakeAttendanceView extends ConsumerWidget {
  const TakeAttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        Positioned(
          child: FaceIdButton(
            onTap: () {
              print("Face ID Pushed");
            },
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * KRatios.r022,
          left: MediaQuery.of(context).size.width * KRatios.r049,
          child: QrButton(
            onTap: () {
              print("QR Pushed");
            },
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * KRatios.r042,
          child: IdButton(onTap: () {
            print("ID Pushed");
          }),
        )
      ]),
    );
  }
}
