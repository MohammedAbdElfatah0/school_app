import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_loadint_widget.dart';
import '../../../home/data/model/courses_model.dart';

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({super.key, required this.course});
  final List<CoursesModel> course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
      child: ListView.builder(
        itemCount: course.length,
        itemBuilder: (context, index) {
          return SizedBox(
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
                        imageUrl: course[index].imageUrl,
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

                  //colum =>title / button
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            course[index].title,
                            style: TextStyleApp.s24w600,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          CustomButton(
                            title: 'Complete course',
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.videos,
                                arguments: course[index].id,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
