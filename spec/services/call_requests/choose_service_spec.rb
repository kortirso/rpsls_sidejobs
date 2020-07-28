# frozen_string_literal: true

RSpec.describe CallRequests::ChooseService do
  subject { described_class }

  let(:judge_service) { double }

  before do
    create_list(:call_request, 3)

    allow(JudgeRpcService::RpcClient).to receive(:new).and_return(judge_service)
    allow(judge_service).to receive(:send_result)
  end

  it 'calls judge_service' do
    subject.call

    expect(judge_service).to have_received(:send_result)
  end

  it 'and deletes pair of call requests' do
    expect { subject.call }.to change { CallRequest.count }.from(3).to(1)
  end
end
