import 'package:elysium/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChatReportDetails extends StatefulWidget {
  @override
  _ChatReportDetailsState createState() => _ChatReportDetailsState();
}

class _ChatReportDetailsState extends State<ChatReportDetails> {
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
          
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 130,
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
              Container(
                      width: 58.h, 
                      height: 58.h,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: CircleAvatar(
                              backgroundColor: primaryColor.withOpacity(0.2),
                              radius: 27.h,
                              child: CircleAvatar(
                                backgroundImage: const AssetImage('images/profile.png'),
                                radius: 26.h,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30.h, 
                            left: 25.h, 
                            child: CircleAvatar(
                              backgroundColor: primaryColor.withOpacity(0.2),
                              radius: 15.h,
                              child: CircleAvatar(
                                backgroundImage: const AssetImage('images/painting1.jpg'),
                                radius: 14.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kareem Ehab",
                    style: TextStyle(fontSize: 20.sp, color: projectsBg , fontWeight:FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                 Row(
                            children: [
                              SizedBox(
                                  width: 4.w,
                                ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('Reports : ' , style: TextStyle(fontSize:15.sp,
                                    color: Colors.white,fontWeight: FontWeight.w400),),
                                    Text('Omar Wael',style: TextStyle(fontSize:15.sp,
                                    color: Colors.white , fontWeight: FontWeight.bold))

                                  ],
                                )
                              ),])
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w ),
              decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(10.r) ),
              child: TextButton(
                onPressed: () {
                 showModalBottomSheet(
  context: context,
  builder: (BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              'Complaint',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: primaryColor
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(color: secondaryColor , borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                'Despite expressing my dissatisfaction and providing evidence with the issue faced, Omar Wael was uncooperative in addressing the problem or offering a refund for the subpar service.I understand that every artist may have their unique style and process , but the issue I encountered with Omar Wael was beyond what was reasonably expected from your platform',
                style: TextStyle(
                  fontSize: 16.0,color: primaryColor , 
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          
        ],
      ),
    );
  },
);

                },
                child: Text('Complaint' , style:TextStyle(color: primaryColor , fontSize:16.sp) ,),
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
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        formattedDate,
        style: TextStyle(color: blackcolor, fontSize: 12),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
            SizedBox(width: 8.0),
          ],
          Column(
            crossAxisAlignment: message.isSentByUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: message.isSentByUser ? projectsBg : secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: message.isSentByUser
                        ? Radius.circular(12)
                        : Radius.circular(0),
                    bottomRight: message.isSentByUser
                        ? Radius.circular(0)
                        : Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text,
                      style: TextStyle(color: blackcolor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: message.isSentByUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(width: 5.0), // Adjust spacing
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
