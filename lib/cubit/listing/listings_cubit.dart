import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:libuta_sugbo_app/contants/api_constants.dart';
import 'package:libuta_sugbo_app/models/listing_list_model.dart';
import 'package:libuta_sugbo_app/models/accomodation_model.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';
import 'package:libuta_sugbo_app/services/api_service.dart';

part 'listings_state.dart';

APIServiceRepo _apiServiceRepo    = APIServiceRepo();
ListingListBox _listingListBox    = ListingListBox();
AccomodationBox _accomodationBox  = AccomodationBox();

class ListingsCubit extends Cubit<ListingsState> {
  ListingsCubit() : super(ListingsInitial());

  getListings(String payload) async {
    var newUri  = Uri.parse("${kGetUserListing}?${payload}");
    var response = await _apiServiceRepo.get(newUri);
    ResponseModel responseModel = ResponseModel(json: response);
    if(!responseModel.isError){
      _listingListBox.insertAll(responseModel);
    }
  }

  getAccomodations(String payload) async {
    var newUri = Uri.parse("${kGetAccomodations}?${payload}");
    var response = await _apiServiceRepo.get(newUri);
    ResponseModel responseModel = ResponseModel(json: response);
    if(!responseModel.isError){
      _accomodationBox.insertAll(responseModel);
    }
  }

}
