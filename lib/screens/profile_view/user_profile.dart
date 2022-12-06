import 'package:flutter/material.dart';
import 'package:practice/models/user_profile_model.dart';
import 'package:practice/services/http_services/http_services.dart';
import 'package:provider/provider.dart';

class USerProfile extends StatefulWidget {
  const USerProfile({Key? key}) : super(key: key);

  @override
  State<USerProfile> createState() => _USerProfileState();
}

class _USerProfileState extends State<USerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  //widget for appbar
  _buildAppbar() {
    return AppBar(
      title: Text('User Profile'),
    );
  }

  _buildBody() {
    final profile = Provider.of<AuthenticationService>(context);
    return Container(
        child: FutureBuilder<UserProfileModel>(
      future: profile.getProfile(),
      builder: (index, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              (snapshot.data!.data!.image == null)
                  ? Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                          "https://www.dtourstravel.com/wp-content/uploads/2018/04/default.jpeg"))
                  : Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                          (snapshot.data!.data!.image.toString())),
                    ),
              Text(snapshot.data!.data!.name.toString()),
              Text(snapshot.data!.data!.email.toString()),
              Text(snapshot.data!.data!.phone.toString()),
            ],
          );
        } else {
          return Text('No data');
        }
      },
    ));
  }
}
