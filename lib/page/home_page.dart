import 'package:flutter/material.dart';
import 'package:tokopedia/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:tokopedia/authentication/authentication.dart';

class homePage extends StatelessWidget {
  const homePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text('home page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'sign out',
                style: whiteTextStyle.copyWith(fontSize: 16),
              ),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              color: blueColor,
            )
          ],
        ),
      ),
    );
  }
}
