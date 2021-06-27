# frozen_string_literal: true

module PsmDeadSimpleDeploymentTools
  # include PsmDeadSimpleDeploymentTools::Packages
  # in order to manipulate files
  module Packages
    # nodoc
    class AptManager
      include Utils::RunCommandAsSudo
      def install_packages(*packages)
        update_repositories

        run_command_as_sudo("apt-get install -y #{packages.join(" ")}")
      end

      def remove_packages(*packages)
        run_command_as_sudo("apt-get remove -y #{packages.join(" ")}")
      end

      private

      def update_repositories
        run_command_as_sudo("apt-get update")
      end
    end
  end
end
