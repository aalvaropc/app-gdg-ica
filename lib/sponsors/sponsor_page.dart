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
                "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/chapter_banners/gdg%20ica.jpg",
          ),
          SponsorImage(
            imgUrl:
                "https://resources.jetbrains.com/storage/products/company/brand/logos/jb_beam.png",
          ),
          SponsorImage(
            imgUrl:
                "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
          ),
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
