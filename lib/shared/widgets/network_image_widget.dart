import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final String? placeholder;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const NetworkImageWidget({Key? key, required this.url, this.placeholder, this.fit, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (url == null || url!.isEmpty) throw InvalidUrl('Url must be not null and not empty.');

    // if (placeholder != null && placeholder!.isEmpty) throw InvalidPlaceholder('Placeholder must be not empty.');

    return FadeInImage.assetNetwork(
      placeholder: placeholder == null ? 'lib/assets/images/loading.gif' : placeholder!,
      placeholderErrorBuilder: (_, object, stackTrace) => Icon(
        Icons.error,
      ),
      placeholderCacheHeight: 40,
      placeholderCacheWidth: 40,
      image: url!,
      fit: fit == null ? BoxFit.cover : fit!,
      height: height,
      width: width,
    );
  }
}
