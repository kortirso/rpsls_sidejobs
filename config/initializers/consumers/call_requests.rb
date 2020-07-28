# frozen_string_literal: true

channel = RabbitMq.consumer_channel
queue = channel.queue('call_requests', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, _properties, payload|
  payload = JSON.parse(payload)
  CallRequests::CreateService.call(call_id: payload.fetch('call_id'))

  channel.ack(delivery_info.delivery_tag)
end
