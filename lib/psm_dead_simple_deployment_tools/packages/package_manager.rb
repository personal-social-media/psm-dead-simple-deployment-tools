# frozen_string_literal: true

module PsmDeadSimpleDeploymentTools
  # include PsmDeadSimpleDeploymentTools::Packages
  # in order to manipulate files
  module Packages
    # nodoc
    class PackageManager
      class UnknownPackageManager < StandardError; end
      extend Forwardable
      def_delegators :os_package_manager, :install_packages, :remove_packages

      private

      def os_package_manager
        return @os_package_manager if defined? @os_package_manager

        return @os_package_manager = AptManager.new if system("which apt")

        raise UnknownPackageManager, "unknown package manager"
      end
    end
  end
end
