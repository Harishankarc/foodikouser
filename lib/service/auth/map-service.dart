import 'package:dio/dio.dart';
import 'package:fudikoclient/api/dio_client.dart';
import 'package:fudikoclient/model/auth/mapplace-model.dart';
import 'package:fudikoclient/utils/tokens.dart';

class MapService {
  Future<List<MapPlacesResponse>> listPlaces(String place) async {
    try {
      final token = await getToken();
      final response = await DioClient.dio.get(
        '/places/search?input=$place',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
      if (response.statusCode == 200) {
        final List<dynamic> predictions = response.data['predictions'];

        return predictions.map<MapPlacesResponse>((place) {
          return MapPlacesResponse.fromJson({
            'place_id': place['place_id'],
            'main_text': place['structured_formatting']['main_text'],
          });
        }).toList();
      } else {
        print("error");
        return [];
      }
    } catch (e) {
      print("function not loaded error");
      return [];
    }
  }

  Future<MapCoordinatesResponse> getPlace(String placeId) async {
    try {
      final token = await getToken();
      final response = await DioClient.dio.get(
        '/places/details?place_id=$placeId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        final formateddata = response.data['result']['geometry']['location'];
        return MapCoordinatesResponse.fromJson(formateddata);
      } else {
        print("error");
        return MapCoordinatesResponse(
          lat: 0.0,
          lng: 0.0,
        );
      }
    } catch (e) {
      print("function not loaded error");
      return MapCoordinatesResponse(
        lat: 0.0,
        lng: 0.0,
      );
    }
  }


}
