import 'package:ekhdemny/bloc/app_cubit.dart';
import 'package:ekhdemny/bloc/app_state.dart';
import 'package:ekhdemny/screens/auth/login_screen.dart';
import 'package:ekhdemny/screens/setting_screen.dart';
import 'package:ekhdemny/screens/technical/confirm_order_screen.dart';
import 'package:ekhdemny/screens/technical/home_tec_sceen.dart';
import 'package:ekhdemny/screens/technical/orders_tec_screen.dart';
import 'package:ekhdemny/screens/user/home_user_screen.dart';
import 'package:ekhdemny/screens/user/notification_screen.dart';
import 'package:ekhdemny/screens/user/orders_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  final bool isUser;
  const LayoutScreen({Key? key, required this.isUser}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> listScreenUser = [
    HomeUserScreen(),
    const OrdersUserScreen(),
    const SettingScreen(),
  ];
  List<Widget> listScreenTec = [
    const HomeTecScreen(),
    const OrdersTecScreen(),
    const ConfirmOrdersScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: const Text(
            "Ekhdemny",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            widget.isUser
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationScreen()));
                    },
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.white,
                    ))
                : Container()
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    color: Colors.orange), //كود لاضافة خليفة رأس الدراور
                accountName: Text(
                    cubit.userModel != null ? cubit.userModel!.userName : '',
                    style: const TextStyle(fontSize: 20)),
                accountEmail:
                    Text(cubit.userModel != null ? cubit.userModel!.email : ''),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(cubit.userModel != null
                      ? cubit.userModel!.imageUri
                      : 'https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0='),
                ),
              ),
              ListTile(
                title: const Text("Home Page"),
                leading: const Icon(Icons.home_rounded),
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Help"),
                leading: const Icon(Icons.help_rounded),
                onTap: () {},
              ),
              ListTile(
                title: const Text("About"),
                leading: const Icon(Icons.help_center_rounded),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout_rounded),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 6.0),
                                child: Icon(Icons.logout),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Sign out'),
                              ),
                            ],
                          ),
                          content: const Text('Do you wanna Sign out?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  cubit.signOut();
                                },
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        );
                      });
                },
              )
            ],
          ),
        ),
        body: widget.isUser
            ? listScreenUser[currentIndex]
            : listScreenTec[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          backgroundColor: Colors.orange,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          unselectedItemColor: Colors.grey.shade300,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          items: widget.isUser
              ? [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Home'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.border_all_outlined), label: 'Orders'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Setting'),
                ]
              : [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Home'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.border_all_outlined), label: 'Orders'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.construction), label: 'Confirm'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Setting'),
                ],
        ),
      );
    }, listener: (context, state) {
      if (state is SignOutState) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }
}
