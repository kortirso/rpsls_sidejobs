# frozen_string_literal: true

FactoryBot.define do
  factory :call_request do
    sequence(:call_id) { |n| n }
  end
end
