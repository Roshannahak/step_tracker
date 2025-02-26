import 'package:flutter/material.dart';

enum TrackerState {
  none,
  complete,
  disabled,
}

enum StepTrackerType {
  indexedVertical,
  dotVertical,
  indexedHorizontal,
}

class StepTracker extends StatelessWidget {
  const StepTracker(
      {Key? key,
      required this.steps,
      this.dotSize = 9,
      this.circleSize = 24,
      this.pipeSize = 30.0,
      this.selectedColor = Colors.green,
      this.unSelectedColor = Colors.red,
      this.stepTrackerType = StepTrackerType.dotVertical})
      : assert(dotSize <= 20),
        assert(circleSize >= 20),
        assert(pipeSize >= 20);

  final List<Steps> steps;
  final double dotSize;
  final double circleSize;
  final double pipeSize;
  final Color selectedColor;
  final Color unSelectedColor;
  final StepTrackerType stepTrackerType;

  Widget _buildIndexedHorizontalHeader(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              width: pipeSize,
              child: index != 0
                  ? Divider(
                      thickness: 1.5,
                      height: 1,
                      color: _circleColor(index),
                    )
                  : null,
            ),
            _buildCircle(index),
            SizedBox(
              width: pipeSize,
              child: index != steps.length - 1
                  ? Divider(
                      thickness: 1.5,
                      height: 1,
                      color: _circleColor(index),
                    )
                  : null,
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: circleSize * 3,
          child: Text(
            steps[index].title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: steps[index].titleStyle ??
                TextStyle(fontSize: circleSize / 1.9),
          ),
        ),
      ],
    );
  }

  Widget _buildIndexedHorizontal() {
    return Container(
      constraints: BoxConstraints(maxHeight: 70),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => _buildIndexedHorizontalHeader(index),
          separatorBuilder: (context, index) => Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: pipeSize,
                  margin: EdgeInsets.only(top: circleSize / 2.1),
                  child: Divider(
                      thickness: 1.5, height: 1, color: _circleColor(index)),
                ),
              ),
          itemCount: steps.length),
    );
  }

  Widget _buildCircleChild(int index) {
    switch (steps[index].state) {
      case TrackerState.complete:
        return Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: circleSize / 1.1,
        );
      case TrackerState.disabled:
        return Icon(
          Icons.close_rounded,
          color: Colors.white,
          size: circleSize / 1.1,
        );
      case TrackerState.none:
        return Text(
          (index + 1).toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.8)),
        );
    }
  }

  Color _circleColor(int index) {
    TrackerState state = steps[index].state;
    switch (state) {
      case TrackerState.complete:
        return selectedColor;
      case TrackerState.disabled:
        return unSelectedColor;
      case TrackerState.none:
        return Colors.grey.withOpacity(0.5);
    }
  }

  Widget _buildCircle(int index) => ClipOval(
        child: Container(
          height: circleSize,
          width: circleSize,
          decoration: BoxDecoration(color: _circleColor(index)),
          child: Center(
            child: _buildCircleChild(index),
          ),
        ),
      );

  Widget _buildIndexedVerticalHeader(int index) => Row(
        children: [
          _buildCircle(index),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(steps[index].title, style: steps[index].titleStyle),
                steps[index].description != null
                    ? Text(
                        "${steps[index].description}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      );

  Widget _buildIndexedVertical() => ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
            child: _buildIndexedVerticalHeader(index),
          ),
      separatorBuilder: (context, index) => Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: pipeSize,
              margin: EdgeInsets.only(left: circleSize / 2.2),
              child: VerticalDivider(
                  thickness: 1.5, width: 1, color: _circleColor(index)),
            ),
          ),
      itemCount: steps.length);

  Widget _buildDot(int index) {
    return ClipOval(
      child: ClipOval(
          child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(color: _circleColor(index)),
      )),
    );
  }

  Widget _buildDotVerticalHeader(int index) => Row(
        children: [
          _buildDot(index),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(steps[index].title, style: steps[index].titleStyle),
                steps[index].description != null
                    ? Text(
                        "${steps[index].description}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      );

  Widget _buildDotVertical() => ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
            child: _buildDotVerticalHeader(index),
          ),
      separatorBuilder: (context, index) => Align(
          alignment: Alignment.centerLeft,
          child: Container(
              height: pipeSize,
              margin: EdgeInsets.only(left: dotSize / 2.2),
              child: VerticalDivider(
                  thickness: 1.5, width: 1, color: _circleColor(index)))),
      itemCount: steps.length);

  @override
  Widget build(BuildContext context) {
    switch (stepTrackerType) {
      case StepTrackerType.dotVertical:
        return _buildDotVertical();
      case StepTrackerType.indexedVertical:
        return _buildIndexedVertical();
      case StepTrackerType.indexedHorizontal:
        return _buildIndexedHorizontal();
    }
  }
}

class Steps {
  const Steps(
      {Key? key,
      required this.title,
      this.titleStyle,
      this.state = TrackerState.none,
      this.description});
  final TextStyle? titleStyle;
  final String title;
  final TrackerState state;
  final String? description;
}
