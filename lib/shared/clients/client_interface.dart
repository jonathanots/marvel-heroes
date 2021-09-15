abstract class IClient {
  /// Handle for Http Request using method [GET]
  Future get(String? uri, {String? query, Map<String, dynamic>? headers});

  /// Handle for Http Request using method [POST]
  Future post(String? uri, {dynamic data, String? query, Map<String, dynamic>? headers});

  /// Handle for Http Request using method [PUT]
  Future update(String? uri, {dynamic data, String? query, Map<String, dynamic>? headers});

  /// Handle for Http Request using method [DELETE]
  Future delete(String? uri, {dynamic data, String? query, Map<String, dynamic>? headers});
}
