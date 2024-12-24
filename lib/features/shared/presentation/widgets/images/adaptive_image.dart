import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdaptiveImage extends StatelessWidget {

  final String? imageUrl;
  final double? borderRadius;
  final double aspectRatio;

  const AdaptiveImage({
    super.key,
    this.imageUrl,
    this.aspectRatio = 16/9,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {

  return AspectRatio(
    aspectRatio: aspectRatio,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.transparent, BlendMode.colorBurn
                )
              ),
            ),
          ),
          placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.grey.withValues(alpha: .4))),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
    ),
  );

  }

}