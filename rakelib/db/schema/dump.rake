# frozen_string_literal: true

# require 'active_record'

namespace :db do
  namespace :schema do
    desc 'Dump database schema'
    task dump: [:settings] do |_t, _args|
      require 'sequel'
      Sequel.connect(Settings.db.to_hash) do |db|
        db.extension :schema_dumper
        dump = db.dump_schema_migration(indexes: true, foreign_keys: true, index_names: true)

        File.open('db/schema.rb', 'w:utf-8') do |file|
          file.write("# frozen_string_literal: true\n\n")
          file.write(dump)
        end
      end
      puts '*** db:schema:dump executed ***'
    end
  end
end
