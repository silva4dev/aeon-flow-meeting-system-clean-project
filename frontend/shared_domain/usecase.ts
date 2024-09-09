export interface UseCase<T, R> {
  execute: (params: T) => Promise<R>;
}
