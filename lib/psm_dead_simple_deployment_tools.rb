# frozen_string_literal: true

require "fileutils"
require "erb"
require "forwardable"

require_relative "psm_dead_simple_deployment_tools/version"
require_relative "psm_dead_simple_deployment_tools/utills/erb_util"
require_relative "psm_dead_simple_deployment_tools/utills/run_command_as_sudo"
require_relative "psm_dead_simple_deployment_tools/files"
require_relative "psm_dead_simple_deployment_tools/packages"
require_relative "psm_dead_simple_deployment_tools/packages/package_manager"
require_relative "psm_dead_simple_deployment_tools/packages/apt_manager"

module PsmDeadSimpleDeploymentTools
  class Error < StandardError; end
  # Your code goes here...
end
