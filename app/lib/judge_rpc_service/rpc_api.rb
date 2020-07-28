# frozen_string_literal: true

module JudgeRpcService
  module RpcApi
    def send_result(result)
      publish(result.to_json, type: 'judge_result')
    end
  end
end
