abstract class Usecase<Type, Params> {
  Future<Type> execute({required Params params});
}
