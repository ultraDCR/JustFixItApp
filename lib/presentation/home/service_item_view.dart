import 'package:flutter/material.dart';
import 'package:just_fix_it/core/routing/app_router.dart';
import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:just_fix_it/data/api_helper.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class ServiceItemView extends StatefulWidget {
  final String? image;
  final String? name;
  final VoidCallback onPress;
  const ServiceItemView({super.key, this.image,this.name, required this.onPress});

  @override
  State<ServiceItemView> createState() => _ServiceItemViewState();
}

class _ServiceItemViewState extends State<ServiceItemView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.onPrimary,
      margin: const EdgeInsets.only(left: Dimens.spacing,right: Dimens.spacing,top: Dimens.spacing),
      child: InkWell(
        onTap: widget.onPress,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.halfSpacing),
          child: Column(
            children: [
                  ImageItem(image: widget.image ?? ""),
                  Column(
                    children: [
                      Text(style: context.textTheme.titleMedium,widget.name ?? ""),
                      // Text(style: context.textTheme.bodySmall, "Ranjans plumbing services"),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.image,
    this.aspectRatio,
  });

  final String image;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio:aspectRatio ?? 16/9,
        child: image.isNotEmpty ? Image.network("$imageUrl$image",fit: BoxFit.cover,):
                Image.asset( "assets/images/logo.png",width: 160, height: 90,)
    );
  }
}
