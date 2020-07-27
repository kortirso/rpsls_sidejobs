# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:call_requests) do
      primary_key :id, :type=>:Bignum
      Integer :call_id, :null=>false
      DateTime :created_at, :default=>Sequel::CURRENT_TIMESTAMP, :size=>6, :null=>false
      DateTime :updated_at, :default=>Sequel::CURRENT_TIMESTAMP, :size=>6, :null=>false
    end
    
    create_table(:schema_migrations) do
      String :filename, :text=>true, :null=>false
      
      primary_key [:filename]
    end
  end
end
