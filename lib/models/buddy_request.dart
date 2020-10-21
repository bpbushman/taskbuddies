class BuddyRequest {
  final String message;
  final String senderUid;
  final String senderUserName;

  BuddyRequest({
    this.senderUserName,
    this.message,
    this.senderUid,
  });

  BuddyRequest.fromData(Map<String, dynamic> data)
      : senderUid = data['senderUid'],
        message = data['message'],
        senderUserName = data['senderUserName'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'senderUid': senderUid,
        'senderUserName': senderUserName
      };
}
