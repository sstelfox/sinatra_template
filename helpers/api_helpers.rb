
module ApiResponseHelper
  # Helper that handles wrapping all API data requests in a standard format
  # that includes status and error messages (if there were any).
  #
  # @param data [Hash] Singular or multiple data objects the client
  #   requested, should include a JSON schema attribute to allow for response
  #   validation.
  # @param response_code [Fixnum] HTTP Status code to return
  # @param errors [Array<String>] List of errors that occured while processing
  #   the request.
  def response_wrapper(data = {}, response_code = 200, errors = [])
    time_taken = nil

    if block_given?
      time_start = Time.now

      begin
        new_data, new_response_code, new_errors = yield

        data.deep_merge!(new_data) if new_data
        errors = errors + Array(new_errors)
        response_code = new_response_code || response_code
      rescue Exception => e
        logger.error("Error occurred #{e.inspect}")
        response_code = 500
        errors << e.message
      end

      time_end = Time.now
      time_taken = (time_end - time_start)
    end

    response = { status: response_code, data: data }
    response[:errors] = errors unless errors.empty?
    response[:execution_time] = time_taken unless time_taken.nil?

    # Use halt to prevent all further processing
    halt(response_code, response.to_json)
  end

  # This helper allows you to quickly extract data provided through the request
  # body in JSON format and ensure that it is valid. In the event the user
  # provides invalid JSON this will stop further processing of the request and
  # return a 400 bad request status message.
  #
  # @return [Hash<String => String>] User provided data
  def extract_json_body
    JSON.parse(request.body.read)
  rescue JSON::ParserError
    response_wrapper do
      [nil, 400, "You need to provide valid JSON."]
    end
  end
end

