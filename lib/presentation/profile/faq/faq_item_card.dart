import 'package:flutter/material.dart';
import 'package:just_fix_it/presentation/home/dashboard_page.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';

class FaqItemCard extends StatefulWidget {
  const FaqItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final FaqData item;

  @override
  State<FaqItemCard> createState() => _FaqItemCardState();
}





class _FaqItemCardState extends State<FaqItemCard> {

  bool _isExpanded = false;

  void expand() {
    setState(() {
      _isExpanded = !(_isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          expand();
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                        widget.item.question ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: context.colorScheme.primary),
                      )),
                  Icon(_isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                ],
              ),
            ),
            AnimatedSwitcher(
              switchInCurve: Curves.fastOutSlowIn,
              switchOutCurve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 100),

              child: _isExpanded
                  ? Row(
                children: [
                  Expanded(
                    child: ColoredBox(
                      key: const Key("expanded"),
                      color: context.colorScheme.onPrimary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(widget.item.answer ?? ""),
                      ),
                    ),
                  ),
                ],
              )
                  : const SizedBox(
                key: Key("unexpanded"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FaqData {
  final String question;
  final String answer;

  FaqData({
    required this.question,
    required this.answer,
  });
}