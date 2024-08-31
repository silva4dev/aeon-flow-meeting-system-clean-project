import { Either, UseCase } from "../../@shared/index.ts";
import { RoomEntity } from "../entities/room-entity.ts";

export type CreateRoomRequest = {
  name: string;
  capicity: number;
  location: string;
};

export type CreateRoomResponse = Either<null, RoomEntity>;

export interface CreateRoomUseCase
  extends UseCase<CreateRoomRequest, CreateRoomResponse> {}
