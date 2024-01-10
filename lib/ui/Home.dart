import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
  final List<dynamic> imageBannerUrl = [
    'https://th.bing.com/th/id/OIG.tTBMZK9GnKo_aT0a6wKC?w=270&h=270&c=6&r=0&o=5&dpr=1.3&pid=ImgGn',
    'https://th.bing.com/th/id/OIG.Xu14zkOrKe3LDXJ.1.dT?w=270&h=270&c=6&r=0&o=5&dpr=1.3&pid=ImgGn',
    'https://th.bing.com/th/id/OIG.IUvfERAUO2WPY531Mnl2?w=270&h=270&c=6&r=0&o=5&dpr=1.3&pid=ImgGn',
    'https://th.bing.com/th/id/OIG.CtUjuOUf0mIvitfxOMHL?w=270&h=270&c=6&r=0&o=5&dpr=1.3&pid=ImgGn'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageBannerUrl.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: imageBannerUrl[index],
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(color: Color(0xff262A35)),
                          errorWidget: (context, url, error) =>
                          const Icon(CupertinoIcons.exclamationmark_triangle),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
