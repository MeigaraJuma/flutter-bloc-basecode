class JsonReturnErrorModel {
  JsonReturnErrorModel.fromJson(Map<String, dynamic> parsedJson)
      : code = parsedJson['code'] as int,
        message = parsedJson['message'] as String,
        errors = parsedJson['errors'] == null ? null : (parsedJson['errors'] as List<dynamic>).map<Error>((dynamic error) => Error.fromJson(error as Map<String,dynamic>)).toList();

  final String message;
  final int code;
  final List<Error> errors;
}

class Error {
  Error.fromJson(Map<String, dynamic> parsedJson)
      : field = parsedJson['field'] as String,
        message = parsedJson['message'] as String;

  final String field, message;
}