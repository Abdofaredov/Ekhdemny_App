// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:ekhdemny/bloc/app_cubit.dart';
import 'package:ekhdemny/bloc/app_state.dart';
import 'package:ekhdemny/compont.dart';
import 'package:ekhdemny/screens/chat_screen.dart';
import 'package:ekhdemny/screens/details_order_screen.dart';
import 'package:ekhdemny/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmOrdersScreen extends StatefulWidget {
  const ConfirmOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrdersScreen> createState() => _ConfirmOrdersScreenState();
}

class _ConfirmOrdersScreenState extends State<ConfirmOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      return RefreshIndicator(  
        onRefresh: () async {
          cubit.getDateOrdersConfirmTechnical();
        },
        child: cubit.ordersConfirmTechnicalList.isEmpty
            ? Center(
                child: emptyData(),
              )
            : ListView.builder(
                itemCount: cubit.ordersConfirmTechnicalList.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  cubit.ordersConfirmTechnicalList[index]
                                      .imageOrder,
                                ),
                                backgroundColor: Colors.white,
                                onBackgroundImageError: (Object, StackTrace) {
                                  const AssetImage(
                                    'assets/images/logo.png',
                                  );
                                },
                                //foregroundImage: NetworkImage(urlImageSignUp),
                                maxRadius: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                    cubit.ordersConfirmTechnicalList[index]
                                        .userName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.finishedOrder(
                                      idOrder: cubit
                                          .ordersConfirmTechnicalList[index]
                                          .idOrder);
                                },
                                icon: const Icon(
                                  Icons.qr_code_scanner,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                          const Divider(color: Colors.white, height: 10),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: MaterialButton(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MoreDetailOrder(
                                                orderModel: cubit
                                                        .ordersConfirmTechnicalList[
                                                    index],
                                                isConfirmed: true,
                                              )));
                                },
                                child: const Text(
                                  "More Details",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: MaterialButton(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                                idDoc: cubit
                                                    .ordersConfirmTechnicalList[
                                                        index]
                                                    .idOrder,
                                              )));
                                },
                                child: const Text(
                                  "Chat",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ],
                          )
                        ],
                      ));
                }),
      );
    }, listener: (context, state) {
      if (state is SuccessFinishOrder) {
        BlocProvider.of<AppCubit>(context).getDateOrdersFinishTechnical();
        BlocProvider.of<AppCubit>(context).getDateOrdersConfirmTechnical();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LayoutScreen(isUser: false)));
        Fluttertoast.showToast(msg: 'Finished Order');
      } else if (state is ErrorFinishOrder) {
        Fluttertoast.showToast(msg: 'Error Confirm Order');
      }
    });
  }
}
