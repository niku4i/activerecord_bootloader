require "activerecord_bootloader/version"
require 'active_record'

module ActiverecordBootloader
  module_function
  
  # @options Hash
  # e.g. connect to MySQL
  #
  # { 
  #    adapter: 'mysql2',
  #       host: 'localhost',
  #   username: 'me',
  #   password: 'secret',
  #   database: 'myapp',
  # }
  #
  # @return ActiveRecord::Base
  def load_database(options)
    @@database = nil
    @@options = options
    database
  end

  def database
    if @@database
      @@database
    else
      ActiveRecord::Base.establish_connection(@@options)
      ActiveRecord::Base
    end
  end

end
