import 'package:digital_mag/modeles/news_modele.dart';
import 'package:flutter/material.dart';
import 'package:digital_mag/constants.dart';
import 'package:digital_mag/skeleton.dart';

import '../news_card.dart';

class Texte extends StatefulWidget {
  const Texte({Key? key}) : super(key: key);

  @override
  State<Texte> createState() => _TexteState();
}

class _TexteState extends State<Texte> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: _isLoading
            ? ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => const NewsCardSkelton(),
          separatorBuilder: (context, index) =>
          const SizedBox(height: 1),
        )
            :Text("jkljkjk"), /*ListView.separated(
          itemCount: 6,
         *//* itemBuilder: (context, index) => NewsCard(
            image: "assets/images/Image_$index.png",

          ),*//*
          separatorBuilder: (context, index) =>
          const SizedBox(height: 1),
        ),*/
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 120, width: 120),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}