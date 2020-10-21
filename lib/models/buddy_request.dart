class BuddyRequest {
  final String message;
  final String senderUid;
  final String senderUserName;
  bool accepted;

  BuddyRequest({
    this.accepted,
    this.senderUserName,
    this.message,
    this.senderUid,
  });

  BuddyRequest.fromData(Map<String, dynamic> data)
      : senderUid = data['senderUid'],
        message = data['message'],
        accepted = data['accepted'],
        senderUserName = data['senderUserName'];

  Map<String, dynamic> toJson() => {
        'accepted': accepted,
        'message': message,
        'senderUid': senderUid,
        'senderUserName': senderUserName
      };
}
