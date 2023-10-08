abstract class EditPostEvent {}

class UpdatePostEvent extends EditPostEvent {
  final String newTitle;
  final String newBody;

  UpdatePostEvent(this.newTitle, this.newBody);
}
