# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'logger'

require 'nokogiri'
require 'obs_deploy/version'
require 'obs_deploy/check_diff'
require 'obs_deploy/zypper'
require 'obs_deploy/systemctl'
require 'obs_deploy/apache_sysconfig'
require 'tempfile'

module ObsDeploy
  class Error < StandardError; end
end
