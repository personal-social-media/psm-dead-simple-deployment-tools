# frozen_string_literal: true

module PsmDeadSimpleDeploymentTools
  # include PsmDeadSimpleDeploymentTools::Packages
  # in order to manipulate files
  module Packages
    # Only supports apt package manager
    def install_packages(*packages)
      PackageManager.new.install_packages(*packages)
    end

    def remove_packages(*packages)
      PackageManager.new.remove_packages(*packages)
    end
  end
end
