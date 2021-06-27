# frozen_string_literal: true

module PsmDeadSimpleDeploymentTools
  module Utils
    # nodoc
    class ErbUtil
      class Error < StandardError; end
      attr_reader :file_path, :ctx_binding

      def initialize(file_path, binding)
        @file_path = file_path
        @ctx_binding = binding
      end

      def result
        raise Error, "template path not found: #{file_path}" unless File.exist?(file_path)

        template_content = File.read(file_path)
        ERB.new(template_content).result(ctx_binding)
      end
    end
  end
end
