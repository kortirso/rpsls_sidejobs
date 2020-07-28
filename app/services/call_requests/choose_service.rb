# frozen_string_literal: true

module CallRequests
  class ChooseService
    prepend BasicService

    def call
      fetch_call_ids
      select_pair_of_calls
    end

    private

    def fetch_call_ids
      @call_ids = CallRequest.map(%i[id call_id]).shuffle
    end

    def select_pair_of_calls
      until @call_ids[1].nil?
        call1 = @call_ids.shift
        call2 = @call_ids.shift

        judge_service.send_result([call1[1], call2[1]])
        CallRequest.where(call_id: [call1[0], call2[0]]).delete
      end
    end

    def judge_service
      @judge_service ||= JudgeRpcService::RpcClient.new
    end
  end
end
