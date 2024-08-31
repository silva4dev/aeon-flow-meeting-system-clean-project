export interface Service<T, R> {
  execute: (params: T) => Promise<R>;
}
