import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_image.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_image.dart';

class HNetworkImage extends StatelessWidget {
  const HNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.child,
  });

  final String url;
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: child ??
            Container(
              height: height ?? size.height,
              width: width ?? size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
      ),
      placeholder: (context, url) => LoadingImageWidget(
        height: height ?? double.infinity,
        width: width ?? MediaQuery.of(context).size.width,
      ),
      errorWidget: (context, url, error) => ErrorImageWidget(
        height: height ?? double.infinity,
        width: width ?? MediaQuery.of(context).size.width,
      ),
    );
  }
}
