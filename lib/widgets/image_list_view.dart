import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshopee/data/data.dart';
import 'package:flutter/material.dart';

class ImageListView extends StatefulWidget {
  final int startingIndex;
  const ImageListView({super.key, required this.startingIndex});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final _scrollerController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollerController.addListener(() {
      if (!_scrollerController.position.atEdge) {
        _autoScroll();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollerController.offset;
    final scrollEndPosition = _scrollerController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollerController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: const Duration(seconds: 10),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.60,
        child: ListView.builder(
            controller: _scrollerController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl:
                    products[widget.startingIndex + index].productImageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
