import {
  HttpPostClient,
  HttpPostParams,
} from "../../application/contracts/http/http-post-client.ts";
import { HttpResponse } from "../../application/contracts/http/http-response.ts";
import axios from "axios";

export class AxiosHttpClient implements HttpPostClient<any, any> {
  async post(params: HttpPostParams<any>): Promise<HttpResponse<any>> {
    const httpResponse = await axios.post(params.url, params.body);
    return {
      statusCode: httpResponse.status,
      body: httpResponse.data,
    };
  }
}
