import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdgica/universal/dev_scaffold.dart';

class SponsorPage extends StatelessWidget {
  static const String routeName = "/sponsor";
  const SponsorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: ListView(
        children: const <Widget>[
          SponsorImage(
            imgUrl:
                "https://seeklogo.com/images/G/google-developers-logo-F8BF3155AC-seeklogo.com.png",
          ),
          SponsorImage(
            imgUrl:
                "https://resources.jetbrains.com/storage/products/company/brand/logos/jb_beam.png",
          ),
          SponsorImage(
            imgUrl:
                "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/DMC.png?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/data_y_analitics.jpg?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/camara_comercio.png?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/systematic.jpg?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/pe%C3%B1otti.png?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/jcm.png?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/Geunica.png?raw=true",
          ),
          SponsorImage(
            imgUrl:
                "https://github.com/aalvaropc/DevFestIcaW/blob/main/public/sponsors/raul_salgado.jpg?raw=true",
          )
        ],
      ),
      title: "Sponsors",
    );
  }
}

class SponsorImage extends StatelessWidget {
  final String? imgUrl;

  const SponsorImage({Key? key, this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CachedNetworkImage(
          imageUrl: imgUrl!,
          height: 200.0,
          width: 200.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
