# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:call_requests) do
      primary_key :id, type: :Bignum

      Integer :call_id, unique: false, null: false

      column :created_at, 'timestamp(6) without time zone', null: false, default: Sequel.lit('now()')
      column :updated_at, 'timestamp(6) without time zone', null: false, default: Sequel.lit('now()')
    end
  end

  down do
    drop_table(:call_requests, cascade: true)
  end
end
