import 'package:dio/dio.dart';
import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/services/api_provider.dart';

class ContactRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Contacts>> fetchAllContact({
    bool useDummyJsonData = false,
  }) async {
    late final dynamic data;

    final Response response = await _apiProvider.use(action: DioAction.get);
    // data = response.data?['results'] ?? [];
    return (response.data as List)
        .map(
          (e) => Contacts.fromJson(e),
        )
        .toList();
    // }
  }

  Future<List<Contacts>> fetchRecentContact({
    bool useDummyJsonData = false,
  }) async {
    late final dynamic data;

    final Response response = await _apiProvider.use(action: DioAction.get);
    // data = response.data?['results'] ?? [];
    return (response.data as List)
        .map(
          (e) => Contacts.fromJson(e),
        )
        .toList();
    // }
  }

  Future<String> deleteContact({required int id}) async {
    final Response response =
        await _apiProvider.use(action: DioAction.delete, data: id);

    return response.data;
  }

  Future<void> createContact({Contacts? contacts}) async {
    final Response response =
        await _apiProvider.use(action: DioAction.post, data: contacts);
  }

  Future<void> UpdateContact({required int id, Contacts? contacts}) async {
    final Response response =
        await _apiProvider.use(action: DioAction.put, data: id, body: contacts);
  }
}
