import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helper/shimmer/shimmer_container.dart';

class ShimmerListPlaceHolder extends StatelessWidget {
  const ShimmerListPlaceHolder({super.key});

  @override
   Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => const SizedBox(
        height: 90,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ContainerShimmer(
                height: double.infinity,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerShimmer(
                      width: double.infinity,
                      height: 15,
                    ),
                    ContainerShimmer(
                      width: 200,
                      height: 13,
                    ),
                    ContainerShimmer(
                      width: 150,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerShimmer(
                          width: 80,
                          height: 10,
                        ),
                        ContainerShimmer(
                          width: 60,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 15.0),
    );
  }
}
