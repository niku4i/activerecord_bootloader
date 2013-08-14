require 'active_record'

# I'm not sure that requiring active_support here, 
# but this prevents "undefined method `camelize' for "create_nodes":String"
# when run rake db:migrate.
require 'active_support/core_ext' 
require 'fileutils'

require_relative 'rake_helper'

include ::ActiverecordBootloader::RakeHelper

namespace :db do
  desc "migrate your database"
  task :migrate do
    ActiveRecord::Migrator.migrate(
      'db/migrate', 
      ENV["VERSION"] ? ENV["VERSION"].to_i : nil
    )
  end

  desc 'load seed data'
  task :seed do
    seed_file = File.join(root_path, 'db', 'seeds.rb')
    load(seed_file) if File.exist?(seed_file)
  end

  desc "create an ActiveRecord migration in ./db/migrate"
  task :create_migration do
    name = ENV['NAME']
    abort("no NAME specified. use `rake db:create_migration NAME=create_users`") if !name

    migrations_dir = File.join("db", "migrate")
    version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S") 
    filename = "#{version}_#{name}.rb"
    migration_name = name.gsub(/_(.)/) { $1.upcase }.gsub(/^(.)/) { $1.upcase }

    FileUtils.mkdir_p(migrations_dir)

    open(File.join(migrations_dir, filename), 'w') do |f|
      f << (<<-EOS).gsub("      ", "")
      class #{migration_name} < ActiveRecord::Migration
        def self.up
        end

        def self.down
        end
      end
      EOS
    end
  end
end
