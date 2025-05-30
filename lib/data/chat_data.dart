class ChatData {
  final String name;
  final String message;
  final String time;
  final String? profileImage;
  final bool isGroup;
  final int unreadCount;
  final bool isVoiceCall;
  final bool isMissedCall;

  ChatData({
    required this.name,
    required this.message,
    required this.time,
    this.profileImage,
    this.isGroup = false,
    this.unreadCount = 0,
    this.isVoiceCall = false,
    this.isMissedCall = false,
  });
}

final List<ChatData> chatList = [
  ChatData(
    name: 'We are sunar family members',
    message: 'Dimpi💩: Happy mother\'s day 🌷❤️🥰',
    time: '1:00 am',
    isGroup: true,
    unreadCount: 4,
  ),
  ChatData(
    name: 'Tapendra Mama Ktm',
    message: 'Voice call',
    time: 'Yesterday',
    isVoiceCall: true,
  ),
  ChatData(
    name: 'Amazon',
    message: '⚡ Skip the Hassle—Your Cart is Set!',
    time: 'Yesterday',
  ),
  ChatData(
    name: 'Family ❤️',
    message: 'Daddy❤️: Good morning to all..',
    time: 'Yesterday',
    isGroup: true,
  ),
  ChatData(
    name: 'Daddy🔥🔥✨',
    message: 'Ok',
    time: '09/05/25',
  ),
  ChatData(
    name: 'Dimpi💩',
    message: 'Missed voice call',
    time: '09/05/25',
    isMissedCall: true,
  ),
  ChatData(
    name: 'Amazon Pay',
    message: 'Hi, Your electricity bill from MSEDCL...',
    time: '09/05/25',
  ),
  ChatData(
    name: 'Jio Home Delivery',
    message: 'Thank you for showing interest in...',
    time: '',
  ),

  // Additional entries

  ChatData(
    name: 'Office Team',
    message: 'Meeting at 3 PM today. Don’t be late!',
    time: '10:30 am',
    isGroup: true,
    unreadCount: 7,
  ),
  ChatData(
    name: 'Riya Sharma',
    message: 'Can you send me the report?',
    time: '8:45 am',
    unreadCount: 2,
  ),
  ChatData(
    name: 'Mom',
    message: 'Have you eaten lunch?',
    time: 'Yesterday',
  ),
  ChatData(
    name: 'Dad',
    message: 'Call me when you’re free.',
    time: 'Yesterday',
  ),
  ChatData(
    name: 'Gym Buddies',
    message: 'Don’t forget the workout tomorrow!',
    time: 'Saturday',
    isGroup: true,
  ),
  ChatData(
    name: 'Bank Alert',
    message: 'Your account was credited with \$500.',
    time: 'Today',
  ),
  ChatData(
    name: 'Samir',
    message: 'Missed voice call',
    time: 'Today',
    isVoiceCall: true,
    isMissedCall: true,
    unreadCount: 1,
  ),
  ChatData(
    name: 'Grocery Store',
    message: 'Your order has been delivered.',
    time: 'Today',
  ),
  ChatData(
    name: 'Project Lead',
    message: 'Please review the PR by EOD.',
    time: 'Today',
    unreadCount: 3,
  ),
];


