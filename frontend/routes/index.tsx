import { Handlers } from "$fresh/server.ts";
import { makeHttpCreateRoomUseCase } from "../main/factories/usecases/http-create-room-usecase-factory.ts";

interface Data {
  name: string;
  capacity: number;
  location: string;
}

export const handler: Handlers<Data> = {
  async POST(request, context) {
    const formData = await request.formData();
    const usecase = makeHttpCreateRoomUseCase()

    await usecase.execute({
      name: String(formData.get("name")),
      capacity: Number(formData.get("capacity")),
      location: String(formData.get("location"))
    });

    return context.render();
  }
};

export default function Home() {
  return (
    <div class="max-w-screen-md mx-auto mt-8">
      <form method="POST" class="bg-white p-6 rounded shadow-md">
        <div class="mb-4">
          <label for="name" class="block text-lg font-medium">
            Nome
          </label>
          <input
            type="text"
            id="name"
            name="name"
            class="w-full p-2 mt-2 border rounded"
            placeholder="Ex: Conferência"
            required
          />
        </div>
        <div class="mb-4">
          <label for="capacity" class="block text-lg font-medium">
            Capacidade
          </label>
          <input
            type="number"
            id="capacity"
            name="capacity"
            class="w-full p-2 mt-2 border rounded"
            placeholder="Ex: 100"
            required
          />
        </div>
        <div class="mb-4">
          <label for="location" class="block text-lg font-medium">
            Localização
          </label>
          <input
            type="text"
            id="location"
            name="location"
            class="w-full p-2 mt-2 border rounded"
            placeholder="Ex: Caxias do Sul"
            required
          />
        </div>
        <button
          type="submit"
          class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
        >
          Enviar
        </button>
      </form>
    </div>
  );
}
