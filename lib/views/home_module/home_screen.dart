import 'package:dating_demo_flutter/views/home_module/swipe_widgets/bottom_button.dart';
import 'package:dating_demo_flutter/views/home_module/swipe_widgets/card_overlay.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../controllers/home_screen_controller.dart';
import 'swipe_widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final _controller = Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50,top: 50),
              child: Obx(
                ()=> SwipableStack(
                  itemCount: _controller.items.length,
                  detectableSwipeDirections: const {
                    SwipeDirection.right,
                    SwipeDirection.left,
                  },
                  controller: _controller.stackController,
                  stackClipBehaviour: Clip.none,
                  onSwipeCompleted: (index, direction) {
                    if (kDebugMode) {
                      print('$index, $direction');
                    }
                  },
                  horizontalSwipeThreshold: 0.8,
                  verticalSwipeThreshold: 0.8,
                  builder: (context, properties) {
                    final itemIndex = properties.index % _controller.items.length;
                    var data =  _controller.items[itemIndex];

                    return Stack(
                      children: [
                        ExampleCard(
                          name: data.name??"",
                          assetPath: data.image??"",
                          age:  data.age??"",
                          title: data.title??"",
                          location: data.location??"",
                        ),
                        if (properties.stackIndex == 0 && properties.direction != null)
                          CardOverlay(
                            swipeProgress: properties.swipeProgress,
                            direction: properties.direction!,
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          BottomButtonsRow(
            onSwipe: (direction) {
              _controller.stackController.next(swipeDirection: direction);
            },
            onRewindTap:  _controller.stackController.rewind,
            canRewind:  _controller.stackController.canRewind,
          ),
        ],
      ),

    );
  }
}
