import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/components/arc_clipper.dart';

class AuthBackground extends StatelessWidget {
  final image;

  AuthBackground({this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Flexible(
      flex: 2,
      child: ClipPath(
        clipper: ArcClipper(),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.blueGrey.shade800,
                  Colors.black87,
                ],
              )),
            ),
            Center(
              child: SizedBox(
                  height: deviceSize.height / 8,
                  width: deviceSize.width / 2,
                  child: this.image == null
                      ? FlutterLogo(
                    colors: Colors.yellow,
                  )
                      : Image.network(
                          image,
                          fit: BoxFit.cover,
                        )),
            )
          ],
        ),
      ),
    );
  }

  final bottomHalf = Flexible(
    flex: 3,
    child: Container(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
