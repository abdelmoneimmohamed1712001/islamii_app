import 'package:flutter/material.dart';
import 'package:islamii/utils/image_utils.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab>
    with SingleTickerProviderStateMixin {
  int count = 0;

  int index = 0;

  List<String> tasbehWords = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                    top: 0,
                    left: 105,
                    child: Image.asset(
                      getImagePathByName(imageName: 'head_of_seb7a.png'),
                    )),
                GestureDetector(
                    onTap: () {
                      onPressOnSeb7a();
                    },
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: Image.asset(getImagePathByName(
                            imageName: 'body_of_seb7a.png')))),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'عدد التسبيحات',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color(0x9bb7935f),
                  ),
                  child: Text(
                    count.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color(0xffB7935F),
                  ),
                  child: Text(
                    tasbehWords[index],
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPressOnSeb7a() {
    setState(() {
      count++;
      if (count % 34 == 0) {
        count = 1;
        index = (index + 1) % tasbehWords.length;
      }
    });
    _controller.forward(from: 0.0);
  }
}
