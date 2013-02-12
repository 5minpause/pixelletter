# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/pixelletter/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/pixelletter/request/(.+)\.rb$})     { |m| "spec/request/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

