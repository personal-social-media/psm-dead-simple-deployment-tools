# frozen_string_literal: true

require "spec_helper"

RSpec.describe PsmDeadSimpleDeploymentTools::Packages do
  include described_class

  describe "#install_packages" do
    it "installs vim" do
      install_packages "vim"

      expect(system("which vim")).to be_truthy
    end
  end

  describe "#install_packages" do
    it "installs vim", skip: ENV["CI"].nil? do
      remove_packages "vim"

      expect(system("which vim")).to be_falsey
    end
  end
end
