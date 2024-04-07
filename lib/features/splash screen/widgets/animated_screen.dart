import 'package:flutter/material.dart';

class MyAnimationRippleScale extends StatefulWidget {
  double? containerWidth;
  double? containerHeight;
  Color containerColor;
  Duration animationDuration;
  Widget? fixedWidget;
  List<Widget>? optionalWidgets;
  BoxShape containerShape;
  BoxShape animatedShape;
  Function()? onTap;
  Function()? onFinished;
  bool automaticallyTransaction;
  Duration autoDelayTransaction;

  MyAnimationRippleScale({
    super.key,
    required this.containerColor,
    this.containerHeight,
    this.containerWidth,
    this.containerShape = BoxShape.circle,
    this.animatedShape = BoxShape.circle,
    this.animationDuration = const Duration(milliseconds: 800),
    required this.fixedWidget,
    this.onTap,
    this.automaticallyTransaction = true,
    this.autoDelayTransaction = const Duration(seconds: 4),
    this.onFinished,
    this.optionalWidgets,
  });

  @override
  MyAnimationRippleScaleState createState() => MyAnimationRippleScaleState();
}

class MyAnimationRippleScaleState extends State<MyAnimationRippleScale>
    with TickerProviderStateMixin {
  bool isFinishValue = false;
  bool isStartRippleEffect = false;
  bool isScaleFinished = false;
  bool oneTap = true;

  late AnimationController rippleController;
  late AnimationController scaleController;
  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  init() {
    setState(() {
      isFinishValue = false;
      isStartRippleEffect = false;
    });
  }

  onTap() {
    setState(() {
      isFinishValue = true;
    });
    if (widget.onTap != null) {
      widget.onTap!();
    }

    if (widget.onFinished != null && oneTap) {
      Future.delayed(
        Duration(
            milliseconds:
                (widget.animationDuration.inMilliseconds * 0.4).round()),
        () => widget.onFinished!(),
      ).then((value) => setState(
            () => oneTap = false,
          ));
    }
  }

  @override
  void initState() {
    if (widget.automaticallyTransaction) {
      Future.delayed(
        widget.autoDelayTransaction,
        () => onTap(),
      );
    }
    super.initState();
    rippleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    scaleController =
        AnimationController(vsync: this, duration: widget.animationDuration)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isFinishValue = true;
              });
            }
          });
    rippleAnimation =
        Tween<double>(begin: 60.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isScaleFinished = true;
              });
            }
          });

    //rippleController.forward();
  }

  @override
  void dispose() {
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (isFinishValue) {
      setState(() {
        isFinishValue = true;
      });
      scaleController.forward();
    } else {
      if (isFinishValue) {
        scaleController.reverse().then((value) {
          init();
        });
      }
    }
    return Container(
      width: widget.containerWidth ?? size.width * 0.8,
      height: widget.containerHeight ?? size.width * 0.8,
      decoration: BoxDecoration(
        shape: widget.containerShape,
        color: widget.containerColor,
      ),
      child: Stack(
        children: [
          Align(
            child: AnimatedBuilder(
              animation: rippleAnimation,
              builder: (context, child) => SizedBox(
                width: rippleAnimation.value,
                height: rippleAnimation.value,
                child: AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (context, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: widget.animatedShape,
                              color: widget.containerColor,
                            ),
                          ),
                        )),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
                onTap: () => onTap(), child: widget.fixedWidget),
          ),
          ...widget.optionalWidgets ?? []
        ],
      ),
    );
  }
}
