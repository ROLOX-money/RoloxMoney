import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int currentStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;

  NumberStepper({
    Key? key,
    required this.width,
    required this.currentStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
  })  : assert(currentStep > 0 == true && currentStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 24.0,
        right: 24.0,
      ),
      width: this.width,
      child: Row(
        children: steps(context),
      ),
    );
  }

  List<Widget> steps(BuildContext context) {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      list.add(
        Container(
          width: 30.0,
          height: 30.0,
          child: getInnerElementOfStepper(i + 1, context),
          decoration: BoxDecoration(
            color: currentStep > i + 1
                ? ColorResource.color00E94F
                : Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(
              color: ColorResource.color00E94F,
              width: 1.0,
            ),
          ),
        ),
      );
      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: 1,
              color: currentStep > i + 1
                  ? ColorResource.color00E94F
                  : Colors.white,
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(index, BuildContext context) {
    if (index < currentStep) {
      return Icon(
        Icons.check,
        color:
            currentStep > index + 1 ? ColorResource.color00E94F : Colors.white,
        size: 20.0,
      );
    } else {
      return Center(
        child: CustomText(
          text: '$index',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorResource.color00E94F,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      );
    }
    // } else
    //   return Container();
  }
}
