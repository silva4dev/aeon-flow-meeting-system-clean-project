# frozen_string_literal: true

module App
  class Server < Hanami::API
    list_tasks = [
      { id: 1, title: "Buy almonds" },
      { id: 2, title: "Buy Nuts" }
    ]

    scope "api" do
      scope "v1" do
        get "/tasks" do
          json list_tasks
        end

        post "/task" do
          binding.break

          task = params
          list_tasks << task
          json task
        end

        get "/task/:id" do
          id = params[:id].to_i
          task = list_tasks.find { |t| t[:id] == id }

          if task.nil?
            status 404
            json(error: "not_found", message: "Entry #{params[:id]} not found")
          else
            json task
          end
        end

        put "/task/:id" do
          id = params[:id].to_i
          index = list_tasks.index { |t| t[:id] == id }

          if index.nil?
            status 404
            json(error: "not_found", message: "Entry #{params[:id]} not found")
          else
            updated_task = params
            list_tasks[index] = updated_task
            json updated_task
          end
        end

        delete "/task/:id" do
          id = params[:id].to_i
          index = list_tasks.index { |t| t[:id] == id }

          if index.nil?
            status 404
            json(error: "not_found", message: "Entry #{params[:id]} not found")
          else
            list_tasks.delete_at(index)
            json(message: "Task deleted")
          end
        end
      end
    end
  end
end
