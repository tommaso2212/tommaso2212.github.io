import 'package:flutter/material.dart';
import 'package:personal/constants/app_color.dart';

class BaseCard extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;

  const BaseCard({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (val) => setState(() {
        isHover = val;
      }),
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
                color: AppColor.primaryColor,
                offset: Offset(2, 2),
              ),
              BoxShadow(
                color: AppColor.sectionColor,
                offset: isHover ? const Offset(0,0) : const Offset(-1,-1),
              ),
              BoxShadow(
                color: AppColor.sectionColor,
                offset: isHover ? const Offset(1,1) : const Offset(0,0),
              )
            ],
            borderRadius: BorderRadius.circular(10),
            color: AppColor.sectionColor,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
