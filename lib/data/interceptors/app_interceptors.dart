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
            message: err.message ?? 'Неверный запрос',
          ),
        );
        break;
      case 403:
        handler.reject(
          Forbidden(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Доступ запрещен',
          ),
        );
        break;
      case 404:
        handler.reject(
          NotFound(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Ресурс не найден',
          ),
        );
        break;
      case 409:
        handler.reject(
          Conflict(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Конфликт данных',
          ),
        );
        break;
      case 422:
        handler.reject(
          UnprocessableContent(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Невозможно обработать содержимое',
          ),
        );
        break;
      case 429:
        handler.reject(
          TooManyRequests(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Слишком много запросов',
          ),
        );
        break;
      case 500:
        handler.reject(
          ServerUnavailable(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Внутренняя ошибка сервера',
          ),
        );
        break;
      case 502:
        handler.reject(
          ServerUnavailable(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Плохой шлюз',
          ),
        );
        break;
      case 503:
        handler.reject(
          ServerTemporarilyUnavailable(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Сервер временно недоступен',
          ),
        );
        break;
      default:
        handler.reject(
          UnknownError(
            requestOptions: err.requestOptions,
            message: err.message ?? 'Неизвестная ошибка',
          ),
        );
        break;
    }
  }
}
