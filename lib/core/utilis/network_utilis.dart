import 'dart:convert';
import 'package:template/core/enums/request_type_multipart.dart';
import 'package:http_parser/http_parser.dart';

import 'package:template/core/enums/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = "backendsp01.000webhostapp.com";

  // static String baseUrl = "electra-space-api.owner-tech.com";

  static var client = http.Client();

  static Future<dynamic> postMultipart({
    required String url,
    MultiRequestType method = MultiRequestType.POST,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      // var uri = Uri.https(baseUrl, url, params);
      var request = http.MultipartRequest('POST', Uri.https(baseUrl, url, params));

      // var request = http.MultipartRequest(method.name.toString(), uri);

      var filesKeyList = files!.keys.toList();
      var filesNameList = files.values.toList();

      for (int i = 0; i < filesKeyList.length; i++) {
        if (filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            filesKeyList[i],
            filesNameList[i],
            filename: path.basename(filesNameList[i]),
            contentType:
                MediaType.parse(lookupMimeType(filesNameList[i]) ?? ''),

            // contentType: getContentType(filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value = await response.stream.bytesToString();

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

  // Here's a sample code to get the media type from a filename in Dart/Flutter using the getContentType() method:

  // static MediaType getContentType(String filename) {
  //   return MediaType.parse(lookupMimeType(filename) ?? '');

  // Get the file extension from the filename
  // String extension = filename.split('.').last;
  // Define the default media type as octet-stream
  // String mediaType = 'application/octet-stream';
  // Define a map of file extensions to media types
  // Map<String, String> mediaTypes = {
  //   'jpg': 'image/jpeg',
  //   'jpeg': 'image/jpeg',
  //   'png': 'image/png',
  //   'gif': 'image/gif',
  //   'pdf': 'application/pdf',
  //   'json': 'application/json',
  //   'xml': 'application/xml'
  // };

  // Look up the media type for the file extension if it exists, otherwise use the default
  // if (mediaTypes.containsKey(extension)) {
  //   mediaType = mediaTypes[extension]!;
  // }
  // return mediaType;
  // }

  // static MediaType getContentType(String name) {
  //   var ext = name.split('.').last;
  //   if (ext == "png" || ext == "jpeg") {
  //     return MediaType.parse("image/jpg");
  //   } else if (ext == 'pdf') {
  //     return MediaType.parse("application/pdf");
  //   } else {
  //     return MediaType.parse("image/jpg");
  //   }
  // }

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      //!--- Required for request ----
      //*--- Make full api url ------

      var uri = Uri.https(baseUrl, url, params);

      //To save api response
      late http.Response response;
      Map<String, dynamic> jsonResponse = {};
      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
      }
      dynamic result;
      try {
        result = jsonDecode(const Utf8Codec().decode(response.bodyBytes));
      } catch (e) {}
      jsonResponse.putIfAbsent(
          'response',
          () =>
              result ??
              {'title': const Utf8Codec().decode(response.bodyBytes)});
      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      return jsonResponse;
    } catch (e) {
      print(e);
    }
  }
}
