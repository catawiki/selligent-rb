# frozen_string_literal: true

module Selligent
  class Client
    # Implements the task endpoints
    #
    # /organizations/:organization/tasks/*
    module Tasks
      # Get a collection of tasks
      #
      # @param options [Hash] Additional options
      # @option options [String] :filter Filter by type
      # @option options [String] :search Search by name, description or tags
      # @option options [Integer] :skip Specify index to start form
      # @option options [Integer] :take Specify number of tasks to take
      def tasks(options = {})
        get "#{base_url}/tasks", options
      end

      # Get task details by name
      #
      # @param name [String] The task name
      def task(name)
        get "#{base_url}/tasks/#{name}"
      end

      # Get task-actions by task name
      #
      # @param task_name [String] The task name
      def task_actions(task_name)
        get "#{base_url}/tasks/#{task_name}/actions"
      end

      # Disable a task
      #
      # @param name [String] The task name
      def disable_task(name)
        post "#{base_url}/tasks/#{name}/actions/disable"
      end

      # Enable a task
      #
      # @param name [String] The task name
      def enable_task(name)
        post "#{base_url}/tasks/#{name}/actions/enable"
      end

      # Run a task
      #
      # @param name [String] The task name
      def run_task(name)
        post "#{base_url}/tasks/#{name}/actions/run"
      end
    end
  end
end
