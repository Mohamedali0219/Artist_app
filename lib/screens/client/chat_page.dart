import 'package:elysium/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _isTextFieldEmpty = true;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Message> _messages = [
    Message(
      text: "Hello there!",
      isSentByUser: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    Message(
      text: "Hi! How are you?",
      isSentByUser: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    Message(
      text: "I'm good, thanks!",
      isSentByUser: false,
      timestamp: DateTime.now(),
    ),
    Message(
      text: "That's great to hear!",
      isSentByUser: true,
      timestamp: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Column(
                  children: [
                    if (index == 0 ||
                        _isDifferentDay(
                            message.timestamp, _messages[index - 1].timestamp))
                      _buildDateContainer(message.timestamp),
                    _buildMessageBubble(message),
                  ],
                );
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 140.h,
      color: primaryColor,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop((context));
            },
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Positioned(
                left: 35,
                top: 40,
                child: CircleAvatar(
                  radius: 6.r,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kareem Ehab",
                    style: TextStyle(fontSize: 15.sp, color: projectsBg),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Active now",
                    style: TextStyle(fontSize: 12.sp, color: projectsBg),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDateContainer(DateTime timestamp) {
    String formattedDate;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final oneWeekAgo = now.subtract(Duration(days: 7));

    if (timestamp.isAfter(today)) {
      formattedDate = 'Today';
    } else if (timestamp.isAfter(yesterday)) {
      formattedDate = 'Yesterday';
    } else if (timestamp.isAfter(oneWeekAgo)) {
      formattedDate = DateFormat('EEEE').format(timestamp);
    } else {
      formattedDate = DateFormat('dd/MM/yyyy').format(timestamp);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        formattedDate,
        style: TextStyle(color: blackcolor, fontSize: 12),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: message.isSentByUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isSentByUser) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                message.senderPhoto ?? "images/profile.png",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.w),
          ],
          Column(
            crossAxisAlignment: message.isSentByUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: message.isSentByUser ? primaryColor : secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                    bottomLeft: message.isSentByUser
                        ? Radius.circular(12.r)
                        : Radius.circular(0),
                    bottomRight: message.isSentByUser
                        ? Radius.circular(0)
                        : Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text,
                      style: TextStyle(color: projectsBg),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: message.isSentByUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(width: 5.w), // Adjust spacing
                  Text(
                    '${_formatTimestamp(message.timestamp)}',
                    style: TextStyle(color: blackcolor, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.attach_file),
            color: primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              onChanged: (text) {
                setState(() {
                  // Check if the text field is empty
                  _isTextFieldEmpty = text.isEmpty;
                });
              },
              decoration: InputDecoration(
                hintText: 'Write your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 16.w,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Visibility(
            visible: !_isTextFieldEmpty,
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: primaryColor,
              ),
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _sendMessage(_textController.text);
                  setState(() {
                    _textController.clear();
                    _isTextFieldEmpty = true;
                  });
                }
              },
            ),
          ),
          Visibility(
            visible: _isTextFieldEmpty,
            child: ElevatedButton(
              onPressed: () {
                print('ok!');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                minimumSize: Size(10.h, 40.w),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.r), // Adjust the radius
                ),
              ),
              child: Text('Contract'), // Text inside the button
            ),
          ),
        ],
      ),
    );
  }

  bool _isDifferentDay(DateTime time1, DateTime time2) {
    return time1.day != time2.day ||
        time1.month != time2.month ||
        time1.year != time2.year;
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('h:mm a').format(timestamp);
  }

  void _sendMessage(String messageText) {
    setState(() {
      _messages.add(Message(
        text: messageText,
        isSentByUser: true,
        timestamp: DateTime.now(),
      ));
    });
    _textController.clear();
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class Message {
  final String text;
  final bool isSentByUser;
  final String? senderPhoto;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isSentByUser,
    this.senderPhoto,
    required this.timestamp,
  });
}

/*void main() {
  runApp(MaterialApp(
    home: ChatPage(),
    debugShowCheckedModeBanner: false,
  ));
}*/
