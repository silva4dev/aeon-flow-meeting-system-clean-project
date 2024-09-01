import { Right } from "../../@shared/either.ts";
import {
  CreateRoomRequest,
  CreateRoomResponse,
  CreateRoomUseCase,
} from "../../domain/usecases/index.ts";
import { RoomEntity } from "../../domain/entities/room-entity.ts";
import { HttpClient } from "../../@shared/http-client.ts";

export class HttpCreateRoomUseCase implements CreateRoomUseCase {
  private readonly url: string;
  private readonly httpPostClient: HttpClient<CreateRoomResponse>;

  constructor(
    url: string,
    httpPostClient: HttpClient<CreateRoomResponse>,
  ) {
    this.url = url;
    this.httpPostClient = httpPostClient;
  }

  async execute(params: CreateRoomRequest): Promise<CreateRoomResponse> {
    const httpResponse = await this.httpPostClient.request({
      url: this.url,
      method: "post",
      body: params,
    });

    return Right<RoomEntity>(httpResponse?.body?.value!);
  }
}
