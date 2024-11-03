import 'package:currency_conversion/data/data.dart';
import 'package:currency_conversion/presentation/resources/enums.dart';
import 'package:flutter/material.dart';

class TextErrorWidget extends StatelessWidget {
  final Object? error;
  final ProgressStatus status;
  const TextErrorWidget({
    super.key,
    required this.error,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    if (error != null && status == ProgressStatus.failure) {
      return Text(
        _getUserFriendlyMessage(
          context: context,
          error: error,
        ),
        style: const TextStyle(
          color: Colors.redAccent,
        ),
      );
    }
    return const SizedBox();
  }

  String _getUserFriendlyMessage({
    required BuildContext context,
    required Object? error,
  }) {
    if (error is BadRequest) {
      return 'Неверный запрос. Пожалуйста, проверьте введённые данные и повторите попытку.';
    } else if (error is Forbidden) {
      return 'Доступ запрещён. У вас нет прав для выполнения этого действия.';
    } else if (error is NotFound) {
      return 'Запрашиваемый ресурс не найден. Проверьте правильность ссылки.';
    } else if (error is Conflict) {
      return 'Конфликт данных. Обновите страницу и попробуйте снова.';
    } else if (error is UnprocessableContent) {
      return 'Невозможно обработать данные. Проверьте ввод и повторите попытку.';
    } else if (error is TooManyRequests) {
      return 'Слишком много запросов. Токены закончились.';
    } else if (error is ServerUnavailable) {
      return 'Сервер временно недоступен. Повторите попытку позже.';
    } else {
      return 'Неизвестная ошибка. Повторите попытку позже или обратитесь в поддержку.';
    }
  }
}
