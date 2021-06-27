# frozen_string_literal: true

RSpec.configure do |c|
  c.before(:suite) do
    FileUtils.mkdir_p("tmp")
  end

  c.after(:suite) do
    FileUtils.rm_rf(Dir.glob("tmp/*"))
  end
end
