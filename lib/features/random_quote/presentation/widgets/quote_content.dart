import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quote/core/utils/app_colors.dart';
import 'package:quote/core/utils/mediaquery_values.dart';
import 'package:quote/core/widgets/error_widget.dart' as error;
import 'package:quote/features/random_quote/presentation/cubit/random_quote_cubit.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        print(state);
        if (state is RandomQuoteLoading) {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteLoaded) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.quote.quote,
                  textAlign: TextAlign.center,
                  selectionColor: Colors.amber,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.3),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Text(state.quote.author,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.3))
              ],
            ),
          );
        } else if (state is RandomQuoteError) {
          return error.ErrorWidget( message: state.msg,
            onPress: ()  =>  context.read<RandomQuoteCubit>().getRandomQuotes(),
          );
        } else {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          );
        }
      },
    );
  }
}
