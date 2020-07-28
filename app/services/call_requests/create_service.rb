# frozen_string_literal: true

module CallRequests
  class CreateService
    prepend BasicService

    option :call_id

    def call
      CallRequest.create(call_id: call_id)
    end
  end
end
