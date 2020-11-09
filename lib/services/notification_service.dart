import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:scrappy/models/message.dart';


class NotificationService{
  List<Message> messages;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  getToken(){
    _firebaseMessaging.getToken().then((deviceToken){
      print("Device Token: $deviceToken");
    });
  }

  configureFirebaseListeners(){
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic>message) async{
        print('onMessage: $message');
        setMessage(message);
      },
      onLaunch: (Map<String, dynamic>message) async{
        print('onLaunch: $message');
        setMessage(message);
      },
      onResume: (Map<String, dynamic>message) async{
        print('onResume: $message');
        setMessage(message);
      },
    );
  }

  setMessage(Map<String, dynamic>message) {
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    Message m = Message(title, body, mMessage);
    messages.add(m);
  }


}