import 'package:multi_vendor_vendor_app/utils/constants/imports.dart';

class PositionedWidget extends StatefulWidget {
  double left;
  double top;
  double opacity;
  double height;
  double width;
  double? borderWidth;
  double borderRadius;
  Color color;
  PositionedWidget({
    required this.left,
    required this.top,
    required this.opacity,
    required this.height,
    required this.width,
    required this.color,
    this.borderWidth,
    required this.borderRadius,
    super.key,
  });

  @override
  State<PositionedWidget> createState() => _PositionedWidgetState();
}

class _PositionedWidgetState extends State<PositionedWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: Opacity(
        opacity: widget.opacity,
        child: Container(
          height: widget.height,
          width: widget.width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(width: widget.borderWidth ?? 0.0),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }
}
