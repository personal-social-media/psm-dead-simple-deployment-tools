# frozen_string_literal: true

require "spec_helper"

RSpec.describe PsmDeadSimpleDeploymentTools::Files do # rubocop:disable Metrics/BlockLength
  include described_class

  describe "#write" do
    let(:file_path) { "tmp/test-write.txt" }
    let(:file_content) { File.read(file_path) }

    context "with text content" do
      it "creates a new file with content" do
        write("tmp/test-write.txt") do
          "content"
        end

        expect(File.exist?("tmp/test-write.txt")).to be_truthy
        expect(file_content).to eq("content")
      end
    end

    context "with template file" do
      before do
        @this = "this"
      end

      it "creates a new file with content" do
        write("tmp/test-write.txt", "spec/support/spec_support/sample-erb.txt")

        expect(File.exist?("tmp/test-write.txt")).to be_truthy
        expect(file_content).to eq("REPLACE this")
      end
    end
  end

  describe "#append" do
    let(:file_path) { "tmp/test-append.txt" }
    let(:file_content) { File.read(file_path) }

    before do
      File.open(file_path, "w") { |f| f.write("sample content") }
    end

    context "with text content" do
      it "creates a new file with content" do
        append("tmp/test-append.txt") do
          "new content"
        end

        expect(File.exist?("tmp/test-append.txt")).to be_truthy
        expect(file_content).to eq("sample content\nnew content")
      end
    end

    context "with template file" do
      before do
        @this = "this"
      end

      it "creates a new file with content" do
        append("tmp/test-append.txt", "spec/support/spec_support/sample-erb.txt")

        expect(File.exist?("tmp/test-append.txt")).to be_truthy
        expect(file_content).to eq("sample content\nREPLACE this")
      end
    end
  end

  describe "#replace" do
    let(:file_path) { "tmp/test-replace.txt" }
    let(:file_content) { File.read(file_path) }

    before do
      File.open(file_path, "w") { |f| f.write("REPLACE THIS") }
    end

    context "with text content" do
      it "creates a new file with content" do
        replace("tmp/test-replace.txt", "THIS") do
          "REPLACED"
        end

        expect(File.exist?("tmp/test-replace.txt")).to be_truthy
        expect(file_content).to eq("REPLACE REPLACED")
      end
    end

    context "with template file" do
      before do
        @this = "this"
      end

      it "creates a new file with content" do
        replace("tmp/test-replace.txt", /THIS/, "spec/support/spec_support/sample-erb.txt")

        expect(File.exist?("tmp/test-append.txt")).to be_truthy
        expect(file_content).to eq("REPLACE REPLACE this")
      end
    end
  end
end
