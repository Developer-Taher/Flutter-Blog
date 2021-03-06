part of 'bloc.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @required Option<Either<ApiError, ApiResponse<User>>> signInState,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
        signInState: none(),
      );
}
