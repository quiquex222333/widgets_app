import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageURL;

  SlideInfo(this.title, this.caption, this.imageURL);
}

final slides = <SlideInfo>[
  SlideInfo(
      "Search lunch",
      "Est ipsum in enim ullamco eiusmod enim qui enim adipisicing.",
      "assets/images/1.png"),
  SlideInfo(
      "Fast Delivery",
      "Ad cillum est labore cupidatat occaecat cillum mollit reprehenderit voluptate nostrud dolor quis consequat eiusmod.",
      "assets/images/2.png"),
  SlideInfo(
      "Enjoy your food",
      "Consequat nisi sunt nostrud labore id consectetur sunt incididunt duis nulla.",
      "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides
                  .map(
                    (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageURL: slideData.imageURL,
                    ),
                  )
                  .toList(),
            ],
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text("Skip"),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text("Start"),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageURL;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageURL)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
