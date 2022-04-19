class Notifications {
  final String titleMessage, replyMessage, time;
  final bool isRead;

  Notifications({
    this.titleMessage = '',
    this.replyMessage = '',
    this.time = '',
    this.isRead = false,
  });
}

List notificationData = [
  Notifications(
    titleMessage: "Hope you are doing well...",
    replyMessage: "Lorem ipsum dolor sit amet,",
    time: "3m ago",
    isRead: false,
  ),
  Notifications(
    titleMessage: "Hello Abdullah! I am...",
    replyMessage: "assets/images/user_2.png",
    time: "8m ago",
    isRead: true,
  ),
  Notifications(
    titleMessage: "Do you have update...",
    replyMessage: "assets/images/user_3.png",
    time: "5d ago",
    isRead: false,
  ),
];
