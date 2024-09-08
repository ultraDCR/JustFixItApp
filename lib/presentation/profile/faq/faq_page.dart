import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/profile/faq/faq_item_card.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<FaqData> faqList = [

    FaqData(
        question: "How to request for service",
        answer: "Just choose the service you want to request and click request button at the bottom of the screen."
    ),
    FaqData(
        question: "How to view request history",
        answer: "Just go to profile section from bottom menu of the home screen then you will see the 'My Service' section click on that and you will be redirected to the request history page."
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("FAQ"),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: faqList.length,
          itemBuilder: (BuildContext context, index) {
            return FaqItemCard(item: faqList[index]);
          },)
    );
  }
}
