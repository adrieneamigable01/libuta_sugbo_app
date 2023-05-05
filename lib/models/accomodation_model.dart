import 'package:hive/hive.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';

import '../helpers/hive_db_helper.dart';

part 'accomodation_model.g.dart';

///HiveDB Annotation
///
/// This annotation is use for the hive_generator plugin to generate an adapter.
/// Type id must be unique and hive field indexes can start from 0-223.
@HiveType(typeId: 4)
class AccomodationModel {
  @HiveField(0)
  dynamic accomodationId;
  @HiveField(1)
  dynamic listingTypeId;
  @HiveField(2)
  String? accomodation;
  @HiveField(3)
  String? isActive;
  

  AccomodationModel({
    this.accomodationId,
    this.listingTypeId,
    this.accomodation,
    this.isActive,
  });

  AccomodationModel.fromJson(Map<String, dynamic> json)
      : accomodationId    = json['id'],
        listingTypeId     = json['listing_type_id'],
        accomodation      = json['accomodation'],
        isActive          = json['is_active'];

  Map<String, dynamic> toJson() => {
        'accomodationId': accomodationId,
        'listingTypeId': listingTypeId,
        'accomodation': accomodation,
        'isActive': isActive,
      };
}

///User Box
///
/// This class handles the user data crud operation to box.
class AccomodationBox {

  Box get _accomodationBox {
    return Hive.box(Boxes.accomodationBox);
  }

  Future<void> insert(ResponseModel response) async {
    final data = AccomodationModel.fromJson(response.data);
    await _accomodationBox.put(data.accomodationId, data);
  }

   /// Inserts a list of records to box
  Future<void> insertAll(ResponseModel response) async {
    response.data.forEach((element) async {
      final data = AccomodationModel.fromJson(element);
      await _accomodationBox.put(data.accomodationId, data);
    });
  }

  Future<void> update(ResponseModel data) async {
    final item = AccomodationModel.fromJson(data.data);
    await _accomodationBox.put(item.accomodationId, data);
  }

  AccomodationModel getSingleItemById(id) {
    return _accomodationBox.values.where((b) => b.accomodationId == id).first;
  }

  List<AccomodationModel> getAccomodationByType(id) {
    return _accomodationBox.values.where((b) => b.listingTypeId == id).cast<AccomodationModel>().toList();
  }

  AccomodationModel get data {
    return _accomodationBox.getAt(0);
  }

  Future<void> clear() async {
    await _accomodationBox.clear();
  }

  bool get isEmpty {
    return _accomodationBox.isEmpty;
  }
}
