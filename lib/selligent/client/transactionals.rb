# frozen_string_literal: true

module Selligent
  class Client
    # Implements the transactional endpoints
    #
    # /organizations/:organization/journeys/transactional/*
    module Transactionals
      # Returns a list of the transactional journeys defined on the organization.
      def transactionals
        get "/organizations/#{Selligent.config.organization}/journeys/transactional"
      end

      # Returns information on the transactional journey with the given api name.
      #
      # @param api_name [String] The api name
      def transactional(api_name)
        get "/organizations/#{Selligent.config.organization}/journeys/transactional/#{api_name}"
      end

      # Sends (multiple) transactional messages (email, mobile push, sms)
      #
      # The model has the following shape:
      #
      # {
      #   items: [
      #     recipient: "info@example.com",
      #     language: "EN',
      #     data: {},
      #     dtsdata: [
      #       {
      #         data_selection: "DTS1",
      #         content: [
      #           {
      #             id: "AB"
      #           },
      #           {
      #             id: "CD"
      #           }
      #         ]
      #       }
      #     ]
      #   ]
      # }
      #
      # @param api_name [String] The name of the execution that should be sent
      # @param model [Hash] The model containing the data that should be sent
      # @option model [Array] :items The send requests
      def send_transactional(api_name, model)
        post "/organizations/#{Selligent.config.organization}/journeys/transactional/#{api_name}/send", model
      end

      # Create and/or update a user profile and then trigger the transactional message
      # with the given api-name on the given organization.
      #
      # The model has the following shape:
      #
      # {
      #   items: [
      #     {
      #       recipient: "fff",
      #       language: "EN",
      #       profile: [
      #         {
      #           scope: "MASTER",
      #           fields: {
      #             "Name": "John",
      #             "LastName": "Smith"
      #           }
      #         }
      #       ],
      #       data: {},
      #       dtsdata: [
      #         {
      #           data_selection: "DTS1",
      #           content: [
      #             {
      #               id: "AB"
      #             },
      #             {
      #               id: "CD"
      #             }
      #           ]
      #         }
      #       ]
      #     }
      #   ]
      # }
      #
      # @param api_name [String] The name of the execution that should be sent
      # @param model [Hash] The model containing the data that should be sent
      # @option model [Array] :items The request bodies
      def update_profile_and_send_transactional(api_name, model)
        post "/organizations/#{Selligent.config.organization}/journeys/transactional/#{api_name}/updateProfileAndSend", model
      end

      # Returns a list of transactional-status-objects for the messages that correspond to
      # the list of guids that is submitted, for the transactional journeys defined on the
      # given organization.
      #
      # @param ids [Array<String>] The message identifiers
      def transactionals_status(ids)
        post "/organizations/#{Selligent.config.organization}/journeys/transactional/status", ids
      end

      # Returns a transactional-status-object for the transactional journey with the given
      # id on the given organization.
      #
      # @param id [String] The message id
      def transactional_status(id)
        get "/organizations/#{organization}/journeys/transactional/status/#{id}"
      end
    end
  end
end
