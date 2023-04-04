class Ingredients {
  final String description;
  final String time;
  final bool seen;
  final bool received;
  final bool sent;
  final bool isMe;
  final bool isAddable;

  Ingredients(this.description, this.time, this.seen, this.received, this.sent,
      this.isMe, this.isAddable);
}
