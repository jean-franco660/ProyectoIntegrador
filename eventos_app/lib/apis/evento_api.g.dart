part of 'evento_api.dart';

class _EventoApi implements EventoApi {
  _EventoApi(this._dio, {this.baseUrl}) {
    baseUrl ??= UrlApi.urlApix;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<EventoModelo>> getEvento(String token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<List<dynamic>>(
      _setStreamType<List<EventoModelo>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(
              _dio.options,
              '/asis/evento/list',
              queryParameters: queryParameters,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    var value = _result.data!
        .map((dynamic i) => EventoModelo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<EventoModelo> createEvento(String token, EventoModelo evento) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = evento.toJson();
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<EventoModelo>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(
              _dio.options,
              '/asis/evento/crear',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = EventoModelo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EventoModelo> findEvento(String token, int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<EventoModelo>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(
              _dio.options,
              '/asis/evento/buscar/${id}',
              queryParameters: queryParameters,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = EventoModelo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GenericModelo> deleteEvento(String token, int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<GenericModelo>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(
              _dio.options,
              '/asis/evento/eliminar/${id}',
              queryParameters: queryParameters,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = GenericModelo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EventoModelo> updateEvento(
      String token, int id, EventoModelo evento) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = evento.toJson();
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<EventoModelo>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(
              _dio.options,
              '/asis/evento/editar/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = EventoModelo.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
