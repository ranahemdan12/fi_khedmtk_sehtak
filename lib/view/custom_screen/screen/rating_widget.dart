import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({super.key});

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      // tapOnlyMode: true,
      // ignoreGestures: true,
      itemSize: 20,
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.amber.withAlpha(50),
      itemBuilder: (context,_)=> const Icon(Icons.star,color: Colors.amber,),
      onRatingUpdate: (rating){},
    );
  }
}
