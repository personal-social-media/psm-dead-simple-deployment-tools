# frozen_string_literal: true

module PsmDeadSimpleDeploymentTools
  # include PsmDeadSimpleDeploymentTools::Files
  # in order to manipulate files
  module Files
    class FileNotFound < StandardError; end

    class InvalidType < StandardError; end

    def write(path, template_path = nil)
      content = if block_given?
                  yield
                else
                  Utils::ErbUtil.new(template_path, binding).result
                end

      return :no_change if File.exist?(path) && File.read(path) == content

      File.open(path, "w") do |f|
        f.write(content)
      end

      :new
    end

    def append(path, template_path = nil, new_line: true) # rubocop:disable Metrics/MethodLength
      raise FileNotFound, "file not found: #{path}" unless File.exist?(path)

      text = if block_given?
               yield
             else
               Utils::ErbUtil.new(template_path, binding).result
             end

      content = File.read(path)
      return :no_change if content.include?(text)

      File.open(path, "a") do |f|
        f << "\n" if new_line

        f << text
      end

      :new
    end

    def replace(path, match, template_path = nil) # rubocop:disable Metrics/MethodLength
      raise FileNotFound, "file not found: #{path}" unless File.exist?(path)

      text = if block_given?
               yield
             else
               Utils::ErbUtil.new(template_path, binding).result
             end

      content = File.read(path)
      case match
      when String
        return :no_change unless content.include?(match)
      when Regexp
        return :no_change unless match.match?(content)
      else
        raise InvalidType, "match must be String or Regexp"
      end

      new_content = content.gsub(match, text)

      File.open(path, "w") do |f|
        f.write(new_content)
      end

      :new
    end
  end
end
