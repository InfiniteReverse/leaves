#!/usr/bin/env ruby

require 'open3'
require 'mkmf'
require 'colored'
require 'pathname'
require 'active_support/multibyte/unicode'

module VKFlutter
  module Pod
    class UI
      class << self
        def log(msg = '')
          puts msg.to_s
        end

        def command(cmd = '')
          puts cmd.to_s.cyan
        end

        def warning(msg = '')
          puts msg.to_s.yellow
        end

        def success(msg = '')
          puts msg.to_s.green
        end
      end
    end

    class VKError < StandardError
      def message
        "[!] #{super}".red
      end
    end

    class Spec
      module DSL
        def method_missing(name, *args)
          UI.warning("method missing: #{name},#{self.class}")
        end
      end

      include DSL

      attr_accessor :name, :version

      def initialize()
        UI.log('initialize Spec')
        yield self if block_given?
      end

      def self.from_file(file_path)
        UI.log(file_path)
        path = Pathname.new(file_path)
        unless path.exist?
          raise VKError, "No podspec found at path `#{path}`"
        end
        self.from_ruby(path)
      end

      def self.from_ruby(path = '')
        contents ||= File.open(path, mode: 'r:utf-8', &:read)
        UI.log(contents)
        spec = _eval_podspec(contents, path)
        unless spec.is_a?(Spec)
          raise VKError, "Invalid podspec file at path or uri `#{path}`."
        end
        spec
      end

      def self._eval_podspec(string, path)
        begin
          eval(string, nil, path.to_s)
        rescue Exception => e
          raise VKError, "Invalid #{path.basename}, #{e.message}"
        end
      end

    end

    class Config
      def root_path
        dir = `git rev-parse --show-toplevel`.to_s.strip
        current_dir = ActiveSupport::Multibyte::Unicode.normalize(dir)
        @installation_root ||= current_dir
      end

      def app_podspec_path
        return @app_podspec_path if @app_podspec_path
        path = Dir.glob("#{root_path}/.ios/Flutter/*.podspec").first
        raise VKError, "No app podspec found" if path.nil?
      end

      def app_podspec
        @app_podspec ||= Pod::Spec.from_file(app_podspec_path) if app_podspec_path
      end

      def flutter_podspec_path
        return @flutter_podspec_path if @flutter_podspec_path
        path = Dir.glob("#{root_path}/.ios/Flutter/engine/*.podspec").first
        raise VKError, "No app podspec found" if path.nil?
      end

      def flutter_podspec
        @flutter_podspec ||= Pod::Spec.from_file(flutter_podspec_path) if flutter_podspec_path
      end

      def gitlab_private_token
        return @gitlab_private_token if @gitlab_private_token
        # get gitlab private token from keychain
        token = `security find-generic-password -l gitlab_private_token -g -w`.to_s.strip
        puts "get gitlab_private_token from keychain: #{token}"
        raise VKError, "`gitlab_private_token` must be provided in Keychain" if token.size == 0
        @gitlab_private_token ||= token
      end
      # singleton obj

      def self.instance
        @instance ||= new
      end

      class << self
        attr_writer :instance
      end

      module Mixin
        def config
          Config.instance
        end
      end
    end
  end
end

def shell(cmd = nil)
  return if cmd.nil?
  UI.command(cmd)
  Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    while line = stdout.gets
      UI.log(line)
    end
  end
end

def check_sh_available?(cli = nil)
  return if cli.nil?
  find_executable cli
end

def check_if_build_before
  false unless Dir.exist?('.ios')
  true
end

def check_version_exist?(name = nil, version = nil)

end

def upload_to_maven(framework_path = nil)

end

def upload_to_repo(framework_url = nil, spec_path = nil)

end

def upload_app_framework

end

def upload_flutter_framework

end

def integration
  #check flutter env
  # UI.error('No flutter path found in $PATH, please config flutter env.') unless check_sh_available?('flutter')
  # if check_if_build_before
  #   UI.error('Current Version exist on remote repo, please update your spec version') if check_version_exist?(app_name, app_version)
  # end
  # #build ios framework
  # shell('flutter build ios --no-codesign 2>&1')
  # upload_app_framework
  # upload_flutter_framework unless check_version_exist?(flutter_name, flutter_version)
  # UI.success('Success!')
end

# integration

include VKFlutter::Pod::Config::Mixin

puts config.app_podspec