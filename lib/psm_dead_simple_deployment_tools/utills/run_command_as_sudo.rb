# frozen_string_literal: true

module PsmDeadSimpleDeploymentTools
  module Utils
    # nodoc
    module RunCommandAsSudo
      def run_command_as_sudo(cmd)
        run_command = RunCommandAsSudo.sudo_installed? ? "sudo #{cmd}" : cmd

        system(run_command)
      end

      class << self
        def sudo_installed?
          return @sudo_installed if defined? @sudo_installed

          @sudo_installed = !`which sudo`.nil?
        end
      end
    end
  end
end
