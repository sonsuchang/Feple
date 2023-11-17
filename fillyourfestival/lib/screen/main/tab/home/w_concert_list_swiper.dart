import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:fast_app_base/screen/main/tab/home/concert_information/f_festival_information.dart';
import 'package:flutter/material.dart';

class ConcertListSwiperWidget extends StatefulWidget {
  const ConcertListSwiperWidget({super.key});

  @override
  State<ConcertListSwiperWidget> createState() => _ConcertListSwiperWidgetState();
}

class _ConcertListSwiperWidgetState extends State<ConcertListSwiperWidget> {
  final List<String> posterList = [
    'assets/image/poster/hiphopplaya_poster.jpg',
    'assets/image/poster/psy_poster.jpg',
    'assets/image/poster/rapbeat_poster.jpg',
    'assets/image/poster/waterbomb_poster.jpg',
  ];

  int _currentPage = 0;

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(//포스터 뒷배경 blur처리한 화면
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  posterList[_currentPage],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Swiper(
              onIndexChanged: _onPageChanged,
              viewportFraction: 0.6,
              scale: 0.4,
              autoplay: true,
              duration: 300,
              itemCount: posterList.length,
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.blue,
                  color: Colors.grey,
                ),
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FestivalInformationFragment(posterName : posterList[index])),
                    );
                  },
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      posterList[index ?? 0],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              layout: SwiperLayout.CUSTOM,
              customLayoutOption: CustomLayoutOption(
                startIndex: -1,
                stateCount: posterList.length - 1,
              )
                ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                ..addTranslate([
                  Offset(-370.0, -40.0),
                  Offset(0.0, 0.0),
                  Offset(370.0, -40.0)
                ]),
              itemWidth: 180,
              itemHeight: 254.5,
            ),
          ),
        ),
      ],
    );
  }
}
