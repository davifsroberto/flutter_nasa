import 'dart:convert';

import 'package:generic_login/core/erros/exeptions.dart';
import 'package:generic_login/core/http_client/http_client.dart';
import 'package:generic_login/core/utils/converters/date_to_string_converter.dart';
import 'package:generic_login/core/utils/keys/nasa_api_keys.dart';
import 'package:generic_login/features/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:generic_login/features/data/datasources/space_media_datasource.dart';
import 'package:generic_login/features/data/models/space_media_model.dart';

class NasaDataSourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDataSourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime dateTime) async {
    final response = await client.get(NadaEndpoints.apod(
        NasaApiKeys.apiKey, DateToStringConverter.convert(dateTime)));

    if (response.statusCode != 200) throw ServerException();

    return SpaceMediaModel.fromJson(jsonDecode(response.data));
  }
}
