# frozen_string_literal: true

RSpec.describe CallRequests::CreateService do
  subject { described_class }

  let(:call_request_params) { { call_id: 1 } }

  it 'creates a call requests' do
    expect { subject.call(call_request_params) }.to change { CallRequest.count }.by(1)
  end
end
