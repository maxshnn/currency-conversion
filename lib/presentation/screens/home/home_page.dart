import 'package:currency_conversion/core/di/di.dart';
import 'package:currency_conversion/presentation/blocs/cubit/connectivity_cubit.dart';
import 'package:currency_conversion/presentation/resources/enums.dart';
import 'package:currency_conversion/presentation/screens/home/bloc/currency_bloc.dart';
import 'package:currency_conversion/presentation/screens/home/widgets/amount_text_field_widget.dart';
import 'package:currency_conversion/presentation/screens/home/widgets/convert_button_widget.dart';
import 'package:currency_conversion/presentation/screens/home/widgets/alert_cialog_currency_choice_widget.dart';
import 'package:currency_conversion/presentation/screens/home/widgets/text_error_widget.dart';
import 'package:currency_conversion/presentation/widgets/base_app_bar.dart';
import 'package:currency_conversion/presentation/widgets/base_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/select_currency_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _toTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrencyBloc(
            currencyConversionUseCase: injection(),
          ),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
      ],
      child: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
          state.mapOrNull(
            connected: (value) {
              _callSnackBar(
                  context: context, text: 'Wow, you\'re back online!');

              context.read<CurrencyBloc>().add(
                    const CurrencyEvent.getCurrencies(),
                  );
            },
            disconnected: (value) {
              _callSnackBar(
                  context: context,
                  text:
                      'There is no internet connection, the saved data will be used');

              context.read<CurrencyBloc>().add(
                    const CurrencyEvent.getLocalCurrencies(),
                  );
            },
          );
        },
        child: BlocConsumer<CurrencyBloc, CurrencyState>(
          listener: (context, state) {
            if (state.result != null) {
              _toTextFieldController.text = state.result.toString();
            }
          },
          builder: (context, state) {
            final bloc = context.read<CurrencyBloc>();
            return Scaffold(
              floatingActionButton:
                  const Text('by Maxim Shonin | git: @maxshnn'),
              appBar: BaseAppBar(
                title: state.from == null && state.to == null
                    ? const Text('Currency conversion')
                    : Text(
                        '${state.from ?? '...'} -> ${state.to ?? '...'}',
                      ),
              ),
              body: Center(
                child: switch (state.status) {
                  ProgressStatus.initial => const BaseProgressIndicator(),
                  _ => ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: TextErrorWidget(
                            error: state.error,
                            status: state.status,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: AmountTextFieldWidget(
                                labelText: 'You send',
                                status: state.status,
                                onChanged: (value) => bloc.add(
                                  CurrencyEvent.addValues(value: value),
                                ),
                              ),
                            ),
                            SelectCurrencyButtonWidget(
                              onPressed: () => _onTapSelectCurrency(
                                context: context,
                                items: state.symbols,
                                value: state.from ?? '',
                                onChanged: (value) => bloc.add(
                                  CurrencyEvent.addValues(from: value),
                                ),
                              ),
                              value: state.from,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: ConvertButtonWidget(
                              onPressed: () => bloc.add(
                                const CurrencyEvent.submit(),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: AmountTextFieldWidget(
                                controller: _toTextFieldController,
                                labelText: 'They get',
                                readOnly: true,
                                status: bloc.state.status,
                              ),
                            ),
                            SelectCurrencyButtonWidget(
                              onPressed: () => _onTapSelectCurrency(
                                context: context,
                                items: state.symbols,
                                value: state.to ?? '',
                                onChanged: (value) => bloc.add(
                                  CurrencyEvent.addValues(to: value),
                                ),
                              ),
                              value: state.to,
                            ),
                          ],
                        ),
                      ],
                    ),
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _callSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[200],
        content: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  void _onTapSelectCurrency({
    required BuildContext context,
    required List<String> items,
    required String value,
    required void Function(String? value) onChanged,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogCurrencyChoiceWidget(
          items: items,
          value: value,
          onSubmit: onChanged,
        );
      },
    );
  }
}
