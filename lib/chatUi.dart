import 'package:flutter/material.dart';
import 'package:chatview/chatview.dart';
import 'package:simplechatui/message.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({super.key});

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  List<UserMessage> messageList = [
    UserMessage(
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true,
        text: 'hi'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'selamneh wey gen teftehal demo'),
    UserMessage(date: DateTime.now(), isSentByMe: true, text: 'endet nh'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: true,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'yewa mn yehonal belsdfsa'),
    UserMessage(
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true,
        text: 'selam'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'te te e e enji sjemr anchih bataes'),
    UserMessage(date: DateTime.now(), isSentByMe: true, text: 'welo'),
    UserMessage(
        date: DateTime.now(),
        isSentByMe: false,
        text: 'kemich kemirsdfsdf hskdj'),
  ];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('sent ${messageList.first.isSentByMe}');
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        body: Column(
          children: [
            Expanded(
                child: GroupedListView<UserMessage, DateTime>(
              // useStickyGroupSeparators: true,
              // floatingHeader: true,
              reverse: true,
              order: GroupedListOrder.DESC,
              padding: EdgeInsets.all(8),
              groupHeaderBuilder: (UserMessage message) => SizedBox(
                height: 40,
                child: Center(
                    child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(DateFormat.yMMMMd().format(message.date)),
                  ),
                )),
              ),
              elements: messageList,
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              itemBuilder: (context, UserMessage message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: message.isSentByMe
                          ? Color.fromRGBO(23, 191, 158, 1)
                          : Colors.white,
                      // elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(message.text,
                            style: TextStyle(
                                color: message.isSentByMe
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                  )),
            )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 400,
                height: 46,
                child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(243, 244, 246, 1))),
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Color.fromRGBO(14, 132, 109, 1),
                            ),
                            onPressed: () {
                              final String text = controller.text;
                              final message = UserMessage(
                                  date: DateTime.now(),
                                  isSentByMe: true,
                                  text: text);

                              setState(() {
                                messageList.add(message);
                                controller.clear();
                              });
                            }),
                        hintText: "Write your message ",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(121, 124, 123, 1),
                        ),
                        fillColor: Color.fromRGBO(245, 247, 247, 1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(243, 244, 246, 1)),
                        ),
                        alignLabelWithHint: true)),
              ),
            )
          ],
        ));
  }
}
