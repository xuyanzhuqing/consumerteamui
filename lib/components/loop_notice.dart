// 循环滚动的小喇叭
import 'package:flutter/material.dart';
import 'package:consumerteamui/utils/caculate_text_width.dart';

class LoopNotice extends StatefulWidget {
  LoopNotice({
    Key? key,
    required this.tip,
    required this.textStyle,
    this.seconds = 5,
  }) {
    // super(key: key);
  }

  final TextStyle textStyle;
  final String tip;
  final int seconds;

  @override
  State<LoopNotice> createState() => new _LoopNotice();
}

class _LoopNotice extends State<LoopNotice>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  late Size textSize;
  late double beginPos;
  late double endPos;

  @override
  initState() {
    super.initState();

    textSize = CaculateTextWidth.boundingTextSize(widget.tip, widget.textStyle);

    beginPos = -textSize.width;
    endPos = textSize.width + 10.0;

    controller = new AnimationController(
        duration: Duration(seconds: widget.seconds), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: beginPos, end: endPos).animate(controller)
      ..addListener(() {
        setState(() => {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时重复执行动画
          controller.repeat();
        }
      });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: new InkWell(
        onTap: () {
          if (controller.isAnimating) {
            controller.stop();
          } else {
            controller.forward();
          }
        },
        child: Row(
          children: [
            Icon(
              IconData(0xe61b, fontFamily: 'Albb'),
              size: 25,
              color: Colors.brown,
            ),
            Expanded(
              child: Container(
                // 层叠布局方式
                child: Stack(
                  fit: StackFit.expand,
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Positioned(
                      left: animation.value,
                      child: Text(widget.tip, style: widget.textStyle),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
