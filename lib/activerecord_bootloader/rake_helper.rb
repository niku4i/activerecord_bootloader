module ActiverecordBootloader
  module RakeHelper

    # @return [String] path of project root
    def root_path
      File.dirname(Bundler.default_gemfile.to_path)
    end

  end
end
