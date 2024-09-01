import { HttpCreateRoomUseCase } from "../../../application/usecases/http-create-room-usecase.ts";
import { CreateRoomUseCase } from "../../../domain/usecases/create-room-usecase.ts";
import { makeApiUrl } from "../http/api-url-factory.ts";
import { makeAxiosHttpClient } from "../http/axios-http-client-factory.ts";

export const makeHttpCreateRoomUseCase = (): CreateRoomUseCase =>
  new HttpCreateRoomUseCase(makeApiUrl('/rooms'), makeAxiosHttpClient())