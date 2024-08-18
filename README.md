# Aplicação de Gestão de Reservas de Salas de Reunião

## Requisitos Funcionais

1. **Criação de Salas de Reunião**
   - O usuário deve ser capaz de criar novas salas de reunião com título, capacidade e localização.

2. **Atualização de Salas de Reunião**
   - O usuário deve ser capaz de atualizar as informações de uma sala de reunião existente.

3. **Visualização de Salas de Reunião**
   - O usuário deve visualizar uma lista de todas as salas de reunião e detalhes de uma sala específica.

4. **Criação de Reservas**
   - O usuário deve ser capaz de reservar uma sala de reunião para uma data e hora específica, com a possibilidade de adicionar uma descrição e um responsável.

5. **Atualização de Reservas**
   - O usuário deve ser capaz de atualizar as informações de uma reserva existente.

6. **Visualização de Reservas**
   - O usuário deve visualizar todas as reservas para uma sala de reunião e detalhes de cada reserva.

7. **Exclusão de Reservas**
   - O usuário deve ser capaz de cancelar reservas existentes.

8. **Filtragem e Busca**
   - O usuário deve poder filtrar reservas por sala, data e status (confirmada, pendente, cancelada).
   - O usuário deve poder buscar reservas e salas pelo nome.

## Requisitos Não Funcionais

1. **Performance**
   - A aplicação deve responder a consultas e buscas em menos de 2 segundos.

2. **Escalabilidade**
   - A aplicação deve ser capaz de escalar horizontalmente para suportar um aumento no número de salas e reservas.

3. **Segurança**
   - Dados das reservas e salas devem ser protegidos contra acesso não autorizado.
   - Autenticação e autorização devem ser implementadas para garantir que apenas usuários autorizados possam criar, atualizar ou cancelar reservas.

4. **Usabilidade**
   - A interface do usuário deve ser intuitiva e responsiva para dispositivos móveis e desktop.

5. **Manutenibilidade**
   - O código deve ser modular e seguir princípios de Clean Code para facilitar a manutenção e extensibilidade.

## Regras de Negócio

1. **Disponibilidade da Sala**
   - Uma sala de reunião não pode ser reservada para mais de um evento ao mesmo tempo.

2. **Validação de Dados**
   - O nome da sala deve ter entre 1 e 100 caracteres.
   - A capacidade da sala deve ser um número positivo.
   - A data e hora da reserva devem estar no futuro.

3. **Cancelamento de Reserva**
   - Reservas podem ser canceladas com pelo menos 24 horas de antecedência.

## Estrutura das Tabelas do Banco de Dados

### Tabela `rooms`

| Coluna       | Tipo          | Descrição                                     |
|--------------|---------------|-----------------------------------------------|
| `id`         | INT           | Identificador único da sala (chave primária)  |
| `name`       | VARCHAR(100)  | Nome da sala                                 |
| `capacity`   | INT           | Capacidade da sala                           |
| `location`   | VARCHAR(255)  | Localização da sala                          |

### Tabela `reservations`

| Coluna         | Tipo                                      | Descrição                                     |
|----------------|-------------------------------------------|-----------------------------------------------|
| `id`           | INT                                       | Identificador único da reserva (chave primária) |
| `room_id`      | INT                                       | Identificador da sala (chave estrangeira)    |
| `start_time`   | DATETIME                                  | Data e hora de início da reserva              |
| `end_time`     | DATETIME                                  | Data e hora de término da reserva             |
| `description`  | TEXT                                      | Descrição da reserva                         |
| `responsible`  | VARCHAR(100)                              | Nome do responsável pela reserva              |
| `status`       | ENUM('confirmed', 'pending', 'cancelled') | Status da reserva                            |

## Endpoints da API

### Salas de Reunião

- **GET /rooms**
  - **Descrição:** Lista todas as salas de reunião.
  - **Parâmetros:** Nenhum

- **POST /rooms**
  - **Descrição:** Cria uma nova sala de reunião.
  - **Parâmetros:** `name`, `capacity`, `location`

- **GET /rooms/{id}**
  - **Descrição:** Obtém detalhes de uma sala de reunião específica.
  - **Parâmetros:** Nenhum

- **PUT /rooms/{id}**
  - **Descrição:** Atualiza uma sala de reunião existente.
  - **Parâmetros:** `name`, `capacity`, `location`

- **DELETE /rooms/{id}**
  - **Descrição:** Exclui uma sala de reunião específica.
  - **Parâmetros:** Nenhum

### Reservas

- **GET /rooms/{room_id}/reservations**
  - **Descrição:** Lista todas as reservas para uma sala de reunião específica.
  - **Parâmetros:** `status`, `start_time`, `end_time`

- **POST /rooms/{room_id}/reservations**
  - **Descrição:** Cria uma nova reserva para uma sala de reunião.
  - **Parâmetros:** `start_time`, `end_time`, `description`, `responsible`

- **GET /rooms/{room_id}/reservations/{id}**
  - **Descrição:** Obtém detalhes de uma reserva específica.
  - **Parâmetros:** Nenhum

- **PUT /rooms/{room_id}/reservations/{id}**
  - **Descrição:** Atualiza uma reserva existente.
  - **Parâmetros:** `start_time`, `end_time`, `description`, `responsible`, `status`

- **DELETE /rooms/{room_id}/reservations/{id}**
  - **Descrição:** Cancela uma reserva específica.
  - **Parâmetros:** Nenhum
