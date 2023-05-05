import 'package:flutter/material.dart';
import 'package:libuta_sugbo_app/widgets/dashboard/listings/dashboard_owner_listing_landscape.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:libuta_sugbo_app/widgets/dashboard/listings/dashboard_owner_add_listings_landscape.dart';
import 'package:libuta_sugbo_app/widgets/common/admin_app_bar_widget.dart';
class DashboardAdminAddListingPage extends StatefulWidget  {
  // const LoginPage({super.key});

  @override
  State<DashboardAdminAddListingPage> createState() => _DashboardAdminAddListingPageState();

}

class _DashboardAdminAddListingPageState extends State<DashboardAdminAddListingPage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: OrientationLayoutBuilder(
        portrait: (context) => ScreenTypeLayout.builder(
          // breakpoints: ScreenBreakpoints(
          //   tablet: 768,
          //   desktop: 1200,
          //   watch: 300,
          // ),
          mobile: (BuildContext context) => Container(color: Colors.pink),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => DashboardOwnerAddListingWidget(),
          watch: (BuildContext context) => Container(color: Colors.pink),
        ),
        landscape: (context) => ScreenTypeLayout.builder(
          // breakpoints: ScreenBreakpoints(
          //   tablet: 768.0,
          //   desktop: 1200,
          //   watch: 300,
          // ),
          mobile: (BuildContext context) => Container(color: Colors.pink),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => DashboardOwnerAddListingWidget(),
          watch: (BuildContext context) => Container(color: Colors.purple),
        ),
      ),
    );
  }
  

}
