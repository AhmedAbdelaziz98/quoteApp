import 'package:flutter/material.dart';
import 'package:quote/core/widgets/error_widget.dart' as error;

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
    //   builder: (context, state) {
    //     print(state);
        // if (state is RandomQuoteLoading) {
        //   return Center(
        //     child: SpinKitFadingCircle(
        //       color: AppColors.primary,
        //     ),
        //   );
        // } else if (state is RandomQuoteLoaded) {
        //   return Container(
        //     margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        //     padding: const EdgeInsets.all(15),
        //     decoration: BoxDecoration(
        //         color: AppColors.primary,
        //         borderRadius: BorderRadius.circular(30)),
        //     child: Text(
        //       state.quote.quote,
        //       style: const TextStyle(
        //           fontSize: 22,
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           height: 1.3),
        //     ),
        //   );
        // } else 
        // if (state is RandomQuoteError) {
          return const error.ErrorWidget();
        // } else {
        //   return Center(
        //     child: SpinKitFadingCircle(
        //       color: AppColors.primary,
        //     ),
        //   );
        // }
      // },
    // );
  }
}
