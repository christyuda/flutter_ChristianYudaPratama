abstract class EditPostState {}

class EditPostInitialState extends EditPostState {}

class EditPostLoadingState extends EditPostState {}

class EditPostSuccessState extends EditPostState {}

class EditPostErrorState extends EditPostState {
  final String errorMessage;

  EditPostErrorState(this.errorMessage);
}

class PostUpdatedState
    extends EditPostState {} // State baru untuk sukses update
