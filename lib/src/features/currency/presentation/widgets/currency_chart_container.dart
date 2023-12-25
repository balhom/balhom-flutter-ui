import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balhom/src/features/currency/presentation/widgets/currency_line_chart.dart';
import 'package:balhom/src/features/currency/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsCurrencyChartContainer extends ConsumerWidget {
  final DateCurrencyConversionListEntity dateCurrencyConversion;
  final List<CurrencyTypeEntity> currencyTypes;

  const StatisticsCurrencyChartContainer(
      {required this.dateCurrencyConversion,
      required this.currencyTypes,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    final selectedConversion = ref.watch(selectedCurrencyConversionProvider);
    final selectedConversionState =
        ref.read(selectedCurrencyConversionProvider.notifier);
    // Coin codes list
    List<String> coins = currencyTypes.map((e) => e.code).toList();
    // Screen sizes:
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double chartLineHeight = (screenHeight * 0.65 <= 350)
        ? 350
        : (screenHeight * 0.65 <= 500)
            ? screenHeight * 0.65
            : 500;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              color: const Color.fromARGB(255, 61, 138, 247),
              height: 45,
              width: screenWidth * 0.70,
              child: Center(
                  child: Text(
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      appLocalizations.currencyChartTitle)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              color: const Color.fromARGB(255, 117, 169, 249),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 45,
              child: DropdownButton<String>(
                  value: selectedConversion.currencyFrom,
                  items: coins.map((coin) {
                    return DropdownMenuItem<String>(
                      value: coin,
                      child: Text(coin),
                    );
                  }).toList(),
                  onChanged: (coin) {
                    selectedConversionState.setCurrencyFrom(coin!);
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              color: const Color.fromARGB(255, 117, 169, 249),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 45,
              child: DropdownButton<String>(
                  value: selectedConversion.currencyTo,
                  items: coins.map((coin) {
                    return DropdownMenuItem<String>(
                      value: coin,
                      child: Text(coin),
                    );
                  }).toList(),
                  onChanged: (coin) {
                    selectedConversionState.setCurrencyTo(coin!);
                  }),
            )
          ],
        ),
        SizedBox(
            height: chartLineHeight,
            width: screenWidth * 0.90,
            child: StatisticsCurrencyLineChart(
              selectedCoinFrom: selectedConversion.currencyFrom,
              selectedCoinTo: selectedConversion.currencyTo,
              dateCurrencyConversion: dateCurrencyConversion,
            )),
      ],
    );
  }
}
