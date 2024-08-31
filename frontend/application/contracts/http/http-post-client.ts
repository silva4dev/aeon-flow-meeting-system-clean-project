import { HttpResponse } from "./index.ts";

export type HttpPostParams<T> = {
  url: string;
  body?: T;
};

export interface HttpPostClient<T, R> {
  post: (params: HttpPostParams<T>) => Promise<HttpResponse<R>>;
}
