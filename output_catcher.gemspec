spec = Gem::Specification.new do |spec| 
  spec.name = 'output_catcher' 
  spec.summary = 'OutputCatcher makes it easy to capture the $stderr and $stdout streams.' 
  spec.description = "OutputCatcher is available as a Rails plugin and as a gem.
  It provides a way to capture the standard out($stdout) or standard error($stderr) of your code without pain 
  and suppresses the output of the 'err' or 'out' stream."
  spec.author = 'Matthias Hennemeyer' 
  spec.email = 'mhennemeyer@gmail.com' 
  spec.homepage = 'http://workunitgroup.com/2008/5/26/output-catcher-for-ruby-and-rails' 
  spec.files = ["LICENSE", "README", "lib/output_catcher.rb"] 
  spec.version = '1.0.1'
end