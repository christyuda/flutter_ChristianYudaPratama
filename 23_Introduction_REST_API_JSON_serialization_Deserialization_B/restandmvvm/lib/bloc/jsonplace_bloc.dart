import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restandmvvm/bloc/jsonplace_event.dart';
import 'package:restandmvvm/bloc/jsonplace_state.dart';
import 'package:restandmvvm/services/jsonplace_service.dart';
import 'package:restandmvvm/viewmodels/editpost_viewmodel.dart';

class EditPostBloc extends Bloc<EditPostEvent, EditPostState> {
  final EditPostViewModel _editPostViewModel = EditPostViewModel();

  EditPostBloc() : super(EditPostInitialState());

  @override
  Stream<EditPostState> mapEventToState(EditPostEvent event) async* {
    if (event is UpdatePostEvent) {
      yield EditPostLoadingState();
      try {
        await _editPostViewModel.updatePost(event.newTitle, event.newBody);
        yield EditPostSuccessState();
      } catch (e) {
        yield EditPostErrorState('Failed to update post: $e');
      }
    }
  }
}
