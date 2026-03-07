import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/color_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widget/custom_loadint_widget.dart';
import '../../data/model/courses_model.dart';

class BuildCoursesGrid extends StatelessWidget {
  const BuildCoursesGrid({super.key, required this.courses});
  final List<CoursesModel> courses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                border: Border.all(color: ColorManager.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: courses[index].id,
                      child: CachedNetworkImage(
                        imageUrl: courses[index].imageUrl,
                        fit: BoxFit.cover,
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                        placeholder:
                            (context, url) => const CustomLoadingWidget(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    courses[index].title,
                    style: TextStyleApp.s16w600.copyWith(
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "${courses[index].price} EGP",
                    style: TextStyleApp.s16w600.copyWith(
                      color: ColorManager.primaryColor,
                    ),
                  ),

                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        //navaigtor to details screen
                        Navigator.pushNamed(
                          context,
                          Routes.detailsCourses,
                          arguments: courses[index],
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                      ),
                      child: Text(
                        "show details",
                        style: TextStyleApp.s18w600.copyWith(
                          color: ColorManager.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
