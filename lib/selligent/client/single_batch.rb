# frozen_string_literal: true

module Selligent
  class Client
    # Implenents the Single Batch endpoints
    #
    # /organizations/:organization/journeys/singlebatch/*
    module SingleBatch
      # Get all journeys of type Single Batch
      def single_batches
        get "#{base_url}/journeys/singlebatch"
      end

      # Create a Single Batch journey
      #
      # The model has the following shape:
      #
      # {
      #   "message": {
      #     "api_name": "api_name"
      #   },
      #   "journey": {
      #     "name": "journey_name",
      #     "launch_state": "Schedule",
      #     "scheduling": {
      #       "launch_date": "2018-10-26T08:11:32.7469864Z"
      #     },
      #     "campaign_analytics_tag": "cpg_tag",
      #     "message_analytics_tag": "msg_tag",
      #     "api_name": "test_new_api_layout"
      #   }
      # }
      #
      # @param model [Hash] The model
      def create_single_batch(model)
        post "#{base_url}/journeys/singlebatch", model
      end

      # Get information on a Single Batch journey
      #
      # @param name [String] The single batch name
      def single_batch(name)
        get "#{base_url}/journeys/singlebatch/#{name}"
      end

      # Cancel launching of a single batch
      #
      # @param name [String] The single batch name
      def cancel_single_batch(name)
        post "#{base_url}/journeys/singlebatch/#{name}/cancel"
      end

      # Launch a single batch
      #
      # The launch request has the following shape:
      #
      # {
      #   "launch_state": "schedule",
      #   "scheduling": {
      #     "launch_date": "2018-10-26T08:11:32.7938595Z"
      #   }
      # }
      #
      # @param name [String] The single batch name
      # @param request [Hash] The launch request
      def launch_single_batch(name, request)
        post "#{base_url}/journeys/singlebatch/#{name}/launch", request
      end

      # Trigger execution of a single batch journey
      #
      # The model has the following shape:
      #
      # {
      #   "journey": {
      #     "launch_state": "Schedule",
      #     "scheduling": {
      #       "launch_date": "2018-10-26T08:11:32.7626108Z"
      #     }
      #   }
      # }
      #
      # @param name [String] The single batch name
      # @param model [Hash] The model
      def trigger_single_batch(name, model)
        post "#{base_url}/journeys/singlebatch/#{name}/trigger", model
      end

      # Send single batch with email message
      #
      # The model has the following shape:
      #
      # {
      #   "message_model": {
      #     "properties": {
      #       "name": "Message name",
      #       "description": "description",
      #       "api_name": "message_name",
      #       "tags": [
      #         "tag1",
      #         "tag2"
      #       ],
      #       "languages": [
      #         "en"
      #       ],
      #       "default_language": "en",
      #       "empty_language": "en",
      #       "audience_api_name": "my_audience"
      #     },
      #     "headers": {
      #       "en": [
      #         {
      #           "from_domain": "example.net",
      #           "from_alias": "info",
      #           "reply_email": "reply@example.net",
      #           "reply_alias": "Your reply alias",
      #           "to_alias": "John Doe",
      #           "preheader": "Put your preheader text here",
      #           "subject": "Put your subject here"
      #         }
      #       ]
      #     },
      #     "content": {
      #       "text": "Hello World!",
      #       "html": "<html><body><h1>Hello World!</h1></body></html>"
      #     }
      #   },
      #   "journey_model": {
      #     "name": "journey_name",
      #     "launch_state": "Schedule",
      #     "scheduling": {
      #       "launch_date": "2018-10-26T08:11:32.8094853Z"
      #     },
      #     "campaign_analytics_tag": "cpg_tag",
      #     "message_analytics_tag": "msg_tag",
      #     "api_name": "test_new_api_layout"
      #   }
      # }
      #
      # @param model [Hash] The request model
      def send_single_batch_email(model)
        post "#{base_url}/journeys/singlebatch/message", model
      end

      # Send single batch mobile push message
      #
      # The model has the following shape:
      #
      # {
      #   "journey_model": {
      #     "name": "journey_name",
      #     "launch_state": "Schedule",
      #     "scheduling": {
      #       "launch_date": "2018-10-26T08:11:32.8407333Z"
      #     },
      #     "campaign_analytics_tag": "cpg_tag",
      #     "message_analytics_tag": "msg_tag",
      #     "api_name": "test_new_api_layout"
      #   },
      #   "mobile_message_model": {
      #     "properties": {
      #       "name": "Message name",
      #       "description": "description",
      #       "api_name": "message_name",
      #       "tags": [
      #         "tag1",
      #         "tag2"
      #       ],
      #       "languages": [
      #         "en"
      #       ],
      #       "default_language": "en",
      #       "empty_language": "en",
      #       "audience_api_name": "my_audience"
      #     },
      #     "mobile_properties": {
      #       "distribution_type": "MobilePush",
      #       "custom_in_app_content": true,
      #       "in_app_content_type": "Text",
      #       "expiration_date": "2018-10-26T10:11:32.8407333+02:00"
      #     },
      #     "content": {
      #       "en": {
      #         "mobile_push": {
      #           "title": "MP Title en",
      #           "content": "MP Content en"
      #         },
      #         "in_app": {
      #           "title": "IA Title en",
      #           "content": {
      #             "text": "IA Content en",
      #             "url": "http://example.com"
      #           }
      #         }
      #       }
      #     }
      #   }
      # }
      #
      # @param model [Hash] The request model
      def send_single_batch_push(model)
        post "#{base_url}/journeys/singlebatch/mobile", model
      end

      # Send single batch sms
      #
      # The model has the following shape:
      #
      # {
      #   "sms_model": {
      #     "properties": {
      #       "name": "Message name",
      #       "description": "description",
      #       "api_name": "message_name",
      #       "tags": [
      #         "tag1",
      #         "tag2"
      #       ],
      #       "languages": [
      #         "en"
      #       ],
      #       "default_language": "en",
      #       "empty_language": "en",
      #       "audience_api_name": "my_audience"
      #     },
      #     "content": {
      #       "en": {
      #         "text": "Text"
      #       }
      #     }
      #   },
      #   "journey_model": {
      #     "name": "journey_name",
      #     "launch_state": "Schedule",
      #     "scheduling": {
      #       "launch_date": "2018-10-26T08:11:32.8719844Z"
      #     },
      #     "campaign_analytics_tag": "cpg_tag",
      #     "message_analytics_tag": "msg_tag",
      #     "api_name": "test_new_api_layout"
      #   }
      # }
      #
      # @param model [Hash] The request model
      def send_single_batch_sms(model)
        post "#{base_url}/journeys/singlebatch/sms", model
      end
    end
  end
end
