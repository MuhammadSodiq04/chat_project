import 'package:chat_project/provider/auth_provider.dart';
import 'package:chat_project/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/models/chat_model.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Chat App",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: "Poppins",
              fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().logOutUser(context);
              },
              icon: const Icon(Icons.logout, color: Colors.white))
        ],
      ),
      body: StreamBuilder<List<MessageModel>>(
            stream: context.read<ChatProvider>().getMessages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Data not found",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: "Poppins"),
                  ),
                );
              }
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    ...List.generate(snapshot.data!.length, (index) {
                      MessageModel x = snapshot.data[index];
                      return Container(
                        width: 150.w,
                        padding: EdgeInsets.all(8.r),
                        margin: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius:
                            BorderRadius.circular(15.r)),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              x.message,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: "Poppins"),
                            ),
                            Text(
                              x.createdAt
                                  .toString()
                                  .substring(11, 16),
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                )
                    : const Center(
                  child: Text("Data Empty"),
                );
              }
              return const Center(
                child: Text("Null"),
              );
            },
          ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: context.read<ChatProvider>().textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Type...",
                hintStyle: TextStyle(
                    fontSize: 15.sp, color: Colors.grey, fontFamily: "Poppins"),
                suffixIcon: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.white),
                  child: Center(
                    child: ZoomTapAnimation(
                      onTap: () {
                        context.read<ChatProvider>().addmessage(
                          context: context,
                          messageModel: MessageModel(
                              message: context.read<ChatProvider>().textEditingController.text,
                              createdAt: DateTime.now(),
                              uid: context.read<AuthProvider>().user!.uid,
                              messageId: ''),
                        );
                        context.read<ChatProvider>().textEditingController.clear();
                      },
                      child: Icon(Icons.send, color: Colors.black, size: 25.r),
                    ),
                  ),
                ),
              ),
            ),
        ),
    );
  }
}