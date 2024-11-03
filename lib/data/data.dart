import 'package:currency_conversion/data/resources/api_keys.dart';
import 'package:currency_conversion/data/resources/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
import 'package:retrofit/retrofit.dart' hide Field;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

// auto_mappr codogeneration
import 'data.auto_mappr.dart';

// Domain
import '../domain/domain.dart';

// Models
part 'models/currency_convertion_model.dart';
part 'models/info_rate_model.dart';
part 'models/currency_symbol_model.dart';
part 'models/currensy_quotes_model.dart';
part 'models/quote_model.dart';

// Services
//    |--------Remote
part 'services/remote/currency_conversion_remote.dart';
//    |--------Local
part 'services/local/currency_quotes_local.dart';

// Repositories
part 'repositories/currency_conversion_repository_impl.dart';

// Exceptions
part 'exceptions/network_exception.dart';

// Interceptors
part 'interceptors/app_interceptors.dart';

// Mapper
part 'mapper/auto_mappr.dart';

part 'data.g.dart';
part 'data.freezed.dart';
