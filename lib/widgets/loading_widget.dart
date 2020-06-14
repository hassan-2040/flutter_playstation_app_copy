import 'dart:math';

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Color color;
  final double sizeReference;
  final double borderWidth;
  LoadingWidget({
    @required this.color,
    @required this.sizeReference,
    @required this.borderWidth,
  });
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  bool _showSecond = false;
  bool _showThird = false;
  bool _showFourth = false;

  @override
  void initState() {
    _changeShowStatus();
    super.initState();
  }

  void _changeShowStatus() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _showSecond = true;
    });
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      _showThird = true;
    });
    await Future.delayed(Duration(milliseconds: 900));
    setState(() {
      _showFourth = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Loading(
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: widget.color,
              strokeWidth: widget.borderWidth,
            ),
            child: Container(
              height: widget.sizeReference * 0.857,
              width: widget.sizeReference,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        _showSecond
            ? Loading(
                child: Container(
                  height: widget.sizeReference,
                  width: widget.sizeReference,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: widget.color, width: widget.borderWidth),
                  ),
                ),
              )
            : Container(
                height: widget.sizeReference,
                width: widget.sizeReference,
              ),
        SizedBox(
          width: 4,
        ),
        _showThird
            ? Loading(
                child: Container(
                  child: Icon(
                    Icons.close,
                    size: widget.sizeReference * 1.429,
                    color: widget.color,
                  ),
                ),
              )
            : Container(
                height: widget.sizeReference,
                width: widget.sizeReference,
              ),
        SizedBox(
          width: 4,
        ),
        _showFourth
            ? Loading(
                child: Container(
                  height: widget.sizeReference,
                  width: widget.sizeReference,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: widget.color, width: widget.borderWidth),
                  ),
                ),
              )
            : Container(
                height: widget.sizeReference,
                width: widget.sizeReference,
              ),
      ],
    );
  }
}

class Loading extends StatefulWidget {
  final Widget child;

  Loading({this.child});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  AnimationController _sizeController;
  Animation<double> _sizeAnimationValue;

  AnimationController _rotationControllerEnter;
  Animation<double> _rotateAnimationValueEnter;

  AnimationController _rotationControllerExit;
  Animation<double> _rotateAnimationValueExit;

  @override
  void initState() {
    super.initState();

    _rotationControllerEnter = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    _rotateAnimationValueEnter = Tween(
      begin: -pi / 2,
      end: 0.0,
    ).animate(_rotationControllerEnter)
      ..addListener(_setStateForAnimation);
    _rotationControllerExit = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    _rotateAnimationValueExit = Tween(
      begin: 0.0,
      end: pi / 2,
    ).animate(_rotationControllerExit)
      ..addListener(_setStateForAnimation);

    //setting the scale animation
    _sizeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _sizeAnimationValue = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_sizeController)
      ..addListener(_setStateForAnimation)
      ..addStatusListener(_statusListener);

    _runSizeAnimation();
  }

  @override
  void dispose() {
    _sizeController.removeStatusListener(_statusListener);
    _sizeController.removeListener(_setStateForAnimation);
    _rotationControllerEnter.removeListener(_setStateForAnimation);
    _rotationControllerExit.removeListener(_setStateForAnimation);
    _sizeController.dispose();
    _rotationControllerExit.dispose();
    _rotationControllerEnter.dispose();
    super.dispose();
  }

  void _runSizeAnimation() async {
    await Future.delayed(Duration(seconds: 1));
    _sizeController.forward();
    _rotationControllerEnter.forward();
  }

  void _statusListener(status) async {
    if (status == AnimationStatus.completed) {
      await Future.delayed(Duration(seconds: 1));
      _sizeController.reverse();
      _rotationControllerExit.forward().then((value) {
        //resetting rotation values as soon as one cycle completes
        _rotationControllerEnter.reset();
        _rotationControllerExit.reset();
      });
    } else if (status == AnimationStatus.dismissed) {
      _runSizeAnimation();
    }
  }

  void _setStateForAnimation(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotateAnimationValueEnter.value,
      child: Transform.rotate(
        angle: _rotateAnimationValueExit.value,
        child: ScaleTransition(
          scale: _sizeAnimationValue,
          alignment: Alignment.center,
          child: widget.child,
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
