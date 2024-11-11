part of '../data.dart';

class AppInterceptor extends QueuedInterceptor {
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    switch (err.response?.statusCode) {
      case 400:
        handler.reject(
          BadRequest(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Неверный запрос. Пожалуйста, проверьте введённые данные и повторите попытку.',
          ),
        );
        break;
      case 403:
        handler.reject(
          Forbidden(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Доступ запрещён. У вас нет прав для выполнения этого действия.',
          ),
        );
        break;
      case 404:
        handler.reject(
          NotFound(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Запрашиваемый ресурс не найден. Проверьте правильность ссылки.',
          ),
        );
        break;
      case 409:
        handler.reject(
          Conflict(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Конфликт данных. Обновите страницу и попробуйте снова.',
          ),
        );
        break;
      case 422:
        handler.reject(
          UnprocessableContent(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Невозможно обработать данные. Проверьте ввод и повторите попытку.',
          ),
        );
        break;
      case 429:
        handler.reject(
          TooManyRequests(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Слишком много запросов. Возможно закончились токены.',
          ),
        );
        break;
      case 500 || 502 || 503:
        handler.reject(
          ServerUnavailable(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Сервер временно недоступен. Повторите попытку позже.',
          ),
        );
        break;
      default:
        handler.reject(
          UnknownError(
            requestOptions: err.requestOptions,
            message: err.message ??
                'Неизвестная ошибка. Повторите попытку позже или обратитесь в поддержку.',
          ),
        );
        break;
    }
  }
}
