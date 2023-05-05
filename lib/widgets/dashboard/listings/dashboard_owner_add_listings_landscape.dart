import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libuta_sugbo_app/contants/common_style_constants.dart';
import 'package:libuta_sugbo_app/contants/form_constants.dart';
import 'package:libuta_sugbo_app/models/accomodation_model.dart';
import 'package:libuta_sugbo_app/models/listing_list_model.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';
import 'package:easy_stepper/easy_stepper.dart';

UserBox _userBox = UserBox();
ListingListBox _listingListBox = ListingListBox();
AccomodationBox _accomodationBox = AccomodationBox();
final formKey = GlobalKey<FormState>();

class DashboardOwnerAddListingWidget extends StatelessWidget {
  const DashboardOwnerAddListingWidget({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    int activeStep = 2;
    bool isLoading = false ;

    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView(
                          // mainAxisSize: MainAxisSize.max,
                          children: <Widget>[

                            Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 370.0, minHeight: 10.0),
                                child: DropdownSearch<AccomodationModel>(
                                  // selectedItem: _categoryBox.getCategory().first,
                                  selectedItem:_accomodationBox.isEmpty
                                          ? null
                                          : _accomodationBox
                                              .getAccomodationByType(1)
                                              .first,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration:
                                        kTextFieldInputDecorationLogin(
                                      labelText: 'Category',
                                      // prefixIcon:const Icon(Icons.type_specimen_outlined),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                  popupProps:
                                      PopupPropsMultiSelection.menu(
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      // controller: _categoryController,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () {
                                            // _categoryController.clear();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  // searchBoxController: _categoryController,
                                  // searchBoxDecoration:
                                  //     kTextFieldInputDecoration(
                                  //         labelText: 'Search Category'),
                                  // mode: Mode.DIALOG,

                                  // onFind: (String filter) => ,
                                  items: _accomodationBox.isEmpty
                                      ? []
                                      : _accomodationBox.getAccomodationByType(1),
                                  itemAsString: (AccomodationModel c) =>
                                      '${c.accomodation}',
                                  onChanged: (AccomodationModel? data) {
                                    // dynamic categoryId =
                                    //     data?.accomodationId!;
                                    // _categoryController.text =
                                    //     categoryId.toString();
                                    // _subcategoryCubit
                                    //     .getSubCategoryByCategoryId(
                                    //         categoryId:
                                    //             categoryId.toString());
                                  },
                                )),

                            Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 370.0, minHeight: 10.0),
                              child: TextFormField(
                                decoration:
                                    kTextFieldInputDecorationLogin(
                                  labelText: 'Listing Name',
                                  // prefixIcon: const Icon(Icons.type_specimen_outlined),
                                  fillColor: Colors.white,
                                ),
                                // focusNode: productNameFocus,
                                textInputAction: TextInputAction.next,
                                // controller: productNameController,
                                onFieldSubmitted: (submit) async {
                                  // _fieldFocusChange(
                                  //     context: context,
                                  //     currentFocus: FocusNode(),
                                  //     nextFocus:
                                  //         productDescriptionFocus);
                                },
                                validator: (textValue) =>
                                    textValue == ""
                                        ? 'This field is required.'
                                        : null,
                                onChanged: (newTextValue) {
                                  // usernameController.text = newTextValue;
                                },
                              )
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 370.0, minHeight: 10.0),
                              child: TextFormField(
                                decoration:
                                    kTextFieldInputDecorationLogin(
                                  labelText: 'Quantity',
                                  // prefixIcon: const Icon(Icons.type_specimen_outlined),
                                  fillColor: Colors.white,
                                ),
                                // focusNode: productNameFocus,
                                textInputAction: TextInputAction.next,
                                // controller: productNameController,
                                onFieldSubmitted: (submit) async {
                                  // _fieldFocusChange(
                                  //     context: context,
                                  //     currentFocus: FocusNode(),
                                  //     nextFocus:
                                  //         productDescriptionFocus);
                                },
                                validator: (textValue) =>
                                    textValue == ""
                                        ? 'This field is required.'
                                        : null,
                                onChanged: (newTextValue) {
                                  // usernameController.text = newTextValue;
                                },
                              )
                            ),
                              Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 370.0, minHeight: 10.0),
                                child: TextFormField(
                                  decoration:
                                      kTextFieldInputDecorationLogin(
                                    labelText: 'Price',
                                    // prefixIcon: const Icon(Icons.type_specimen_outlined),
                                    fillColor: Colors.white,
                                  ),
                                  // focusNode: productNameFocus,
                                  textInputAction: TextInputAction.next,
                                  // controller: productNameController,
                                  onFieldSubmitted: (submit) async {
                                    // _fieldFocusChange(
                                    //     context: context,
                                    //     currentFocus: FocusNode(),
                                    //     nextFocus:
                                    //         productDescriptionFocus);
                                  },
                                  validator: (textValue) =>
                                      textValue == ""
                                          ? 'This field is required.'
                                          : null,
                                  onChanged: (newTextValue) {
                                    // usernameController.text = newTextValue;
                                  },
                                )
                              ),
                            Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 370.0, minHeight: 10.0),
                              child: FormBuilderDropdown(
                                name: "type",
                                decoration: kTextFieldInputDecorationLogin(
                                    labelText: "Type",
                                    hintText: "Select a role"
                                ),
                                // initialValue: userRoleController.text,
                                // initialValue: widget.initialType,
                                // readOnly: widget.eventType == 'Update',
                                // enabled: widget.eventType != 'Update',
                                onChanged: (value) {
                                //  userRoleController.text = value.toString().toLowerCase();
                                  //print(('Type Value Changed $value');
                                },
                                // hint: Text('Select Type'),
                                // validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                                // items: ['Admin','Staff']
                                 items: ['Online Booking','Onsite Booking']
                                    .map((type) => DropdownMenuItem(
                                    value: type, child: Text("$type")))
                                    .toList(),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 370.0, minHeight: 10.0),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                decoration:
                                    kTextFieldInputDecorationLogin(
                                  labelText: 'Description',
                                  // prefixIcon: const Icon(Icons.list),
                                  fillColor: Colors.white,
                                ),
                                // focusNode: productDescriptionFocus,
                                textInputAction: TextInputAction.next,
                                // controller:productDescriptionController,
                                onFieldSubmitted: (submit) async {
                                  // _fieldFocusChange(
                                  //     context: context,
                                  //     currentFocus: FocusNode(),
                                  //     nextFocus: categoryFocus);
                                },
                                validator: (textValue) =>
                                    textValue == ""
                                        ? 'This field is required.'
                                        : null,
                                onChanged: (newTextValue) {
                                  // usernameController.text = newTextValue;
                                },
                              )
                            ),
                          ]
                        ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cancelButton(
                      onPressedFunction: () => Navigator.pop(context)),
                  const SizedBox(
                    width: 10.0,
                  ),
                  saveButton(
                      onPressedFunction: !isLoading
                          ? () {
                              if (formKey.currentState!.validate()) {
                                //Map _payload = {
                                //   'type': _typeController,
                                //   'firm_id': _searchControllerFirm.text,
                                //   'license_no': _typeController == 'broker' ?  _licenseNumberController.text : "",
                                // };

                                
                              }
                            }
                          // ignore: dead_code
                          : null,
                      label: "Save"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}