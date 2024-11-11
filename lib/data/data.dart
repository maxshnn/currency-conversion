import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
import 'package:retrofit/retrofit.dart' hide Field;

// Resources
import 'package:currency_conversion/data/resources/api_keys.dart';
import 'package:currency_conversion/data/resources/api_routes.dart';

// Domain
import '../domain/domain.dart';

// Models
import 'package:currency_conversion/domain/models/currency_convertion.dart';
import 'package:currency_conversion/domain/models/currency_quotes.dart';
import 'package:currency_conversion/domain/models/currency_symbol.dart';
import 'package:currency_conversion/data/models/currency_convertion_model.dart';
import 'package:currency_conversion/data/models/currency_symbol_model.dart';
import 'package:currency_conversion/data/models/currensy_quotes_model.dart';
import 'package:currency_conversion/data/models/quote_model.dart';

// Mapper
import 'package:currency_conversion/data/mapper/auto_mappr.dart';

// Services
//    |--------Remote
part 'services/remote/currency_conversion_remote.dart';
//    |--------Local
part 'services/local/currency_quotes_local.dart';

// Repositories
part 'repositories/currency_conversion_repository_impl.dart';
part 'repositories/currency_quote_local_repository_impl.dart';

// Exceptions
part 'exceptions/network_exception.dart';

// Interceptors
part 'interceptors/app_interceptors.dart';

part 'data.g.dart';
