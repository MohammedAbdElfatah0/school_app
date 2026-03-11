import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/routes/routes.dart';

import '../../../../core/theme/text_style.dart';
import '../../../../core/widget/custom_loadint_widget.dart';
import '../../data/model/video_model.dart';

class ListViewBuilderVideoWidget extends StatelessWidget {
  const ListViewBuilderVideoWidget({super.key, required this.videos});

  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
      child: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  Routes.videoPlayer,
                  arguments: videos[index],
                ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 6,
                child: Row(
                  children: [
                    //image
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              videos[index].thumbnailUrl ??
                              'https://4ddig.tenorshare.com/images/photo-recovery/images-not-found.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                          placeholder:
                              (context, url) => const CustomLoadingWidget(),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              videos[index].title,
                              style: TextStyleApp.s24w600,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              videos[index].description,
                              style: TextStyleApp.s16w400,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //button
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.play_circle,
                        color: ColorManager.primaryColor,
                        size: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
