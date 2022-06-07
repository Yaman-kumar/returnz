import 'package:flutter/material.dart';
import 'package:returnz/services/responsive.dart';


class SocialAuthButton extends StatelessWidget {
  final image;
  final  onTap;
  const SocialAuthButton({Key? key, this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap;
      },
      child: Image(
        height: 64.kh,
        width: 64.kw,
        image:AssetImage(image),
      ),
    );
  }
}
