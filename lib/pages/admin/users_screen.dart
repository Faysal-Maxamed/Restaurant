import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/constant/constant.dart';
import 'package:resturent_app/controller/users_provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounclr,
      appBar: AppBar(
        backgroundColor: backgrounclr,
        title: Text("Users"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Expanded(
          child: FutureBuilder(
            future: context.read<UsersProvider>().getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var snap = snapshot!.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: backgrounclr,
                          elevation: 10,
                          child: ListTile(
                            title: Text(snapshot.data![index].name!),
                            subtitle: Text(snapshot.data![index].email!),
                            leading:
                                snap.isAdmin! ? Text("admin") : Text("users"),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Xogti waalawaayey");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
