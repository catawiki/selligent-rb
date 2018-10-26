# frozen_string_literal: true

module Selligent
  class Client
    # Implements the content endpoints
    #
    # /organizations/:organization/content/*
    module Content
      # Create simple (HTML only) single language email message content
      #
      # The model has the following shape:
      #
      # {
      #   "properties": {
      #     "name": "Message name",
      #     "description": "description",
      #     "api_name": "message_name",
      #     "tags": [
      #       "tag1",
      #       "tag2"
      #     ],
      #     "languages": [
      #       "en"
      #     ],
      #     "default_language": "en",
      #     "empty_language": "en",
      #     "audience_api_name": "my_audience"
      #   },
      #   "headers": {
      #     "en": [
      #       {
      #         "from_domain": "example.net",
      #         "from_alias": "info",
      #         "reply_email": "reply@example.net",
      #         "reply_alias": "Your reply alias",
      #         "to_alias": "John Doe",
      #         "preheader": "Put your preheader text here",
      #         "subject": "Put your subject here"
      #       }
      #     ]
      #   },
      #   "content": {
      #     "text": "Hello World!",
      #     "html": "<html><body>h1>Hello World!</h1></body></html>"
      #   }
      # }
      #
      # @param model [Hash] The model
      # @param params [Hash] The query parameters
      # @option params [Boolean] :publish Indicate whether content should be published
      def create_email(model, params = {})
        post("#{base_url}/content/message", model) do |req|
          req.params.merge!(params)
        end
      end

      # Create mobile push message content
      #
      # The model has the following shape:
      #
      # {
      #   "properties": {
      #     "name": "Message name",
      #     "description": "description",
      #     "api_name": "message_name",
      #     "tags": [
      #       "tag1",
      #       "tag2"
      #     ],
      #     "languages": [
      #       "en"
      #     ],
      #     "default_language": "en",
      #     "empty_language": "en",
      #     "audience_api_name": "my_audience"
      #   },
      #   "mobile_message_properties": {
      #     "distribution_type": "MobilePush",
      #     "custom_in_app_content": true,
      #     "in_app_content_type": "Text",
      #     "expiration_date": "2018-10-26T10:11:32.4188693+02:00"
      #   },
      #   "content": {
      #     "en": {
      #       "mobile_push": {
      #         "title": "MP Title en",
      #         "content": "MP Content en"
      #       },
      #       "in_app": {
      #         "title": "IA Title en",
      #         "content": {
      #           "text": "IA Content en",
      #           "url": "http://example.com"
      #         }
      #       }
      #     }
      #   }
      # }
      #
      # @param model [Hash] The model
      # @param params [Hash] The query parameters
      # @option params [Boolean] :publish Indicate whether content should be published
      def create_push_message(model, params = {})
        post("#{base_url}/content/mobile", model) do |req|
          req.params.merge!(params)
        end
      end

      # Create simple page content
      #
      # The model has the following shape:
      #
      # {
      #   "properties": {
      #     "name": "Message name",
      #     "description": "description",
      #     "api_name": "message_name",
      #     "tags": [
      #       "tag1",
      #       "tag2"
      #     ],
      #     "languages": [
      #       "en"
      #     ],
      #     "default_language": "en",
      #     "empty_language": "en",
      #     "audience_api_name": "my_audience"
      #   },
      #   "content": {
      #     "html": "<html><body><h1>Hello World!</h1></body></html>"
      #   }
      # }
      #
      # @param model [Hash] The model
      # @param params [Hash] The query parameters
      # @option params [Boolean] :publish Indicate whether content should be published
      def create_page(model, params = {})
        post("#{base_url}/content/page", model) do |req|
          req.params.merge!(params)
        end
      end

      # Create SMS content
      #
      # The model has the following shape:
      #
      # {
      #   "properties": {
      #     "name": "Message name",
      #     "description": "description",
      #     "api_name": "message_name",
      #     "tags": [
      #       "tag1",
      #       "tag2"
      #     ],
      #     "languages": [
      #       "en"
      #     ],
      #     "default_language": "en",
      #     "empty_language": "en",
      #     "audience_api_name": "my_audience"
      #   },
      #   "content": {
      #     "en": {
      #       "text": "Text"
      #     }
      #   }
      # }
      #
      # @param model [Hash] The model
      # @param params [Hash] The query parameters
      # @option params [Boolean] :publish Indicate whether content should be published
      def create_sms(model, params = {})
        post("#{base_url}/content/sms", model) do |req|
          req.params.merge!(params)
        end
      end
    end
  end
end
