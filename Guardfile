
notification :off

guard :process, name: 'DefaultAppServer', command: 'thin -p 3000' do
  watch(%r{^config/(.+).rb$})
  watch(%r{^helpers/(.+)\.rb$})
  watch(%r{^lib/(.+)\.rb$})
  watch(%r{^models/(.+)\.rb$})
  watch(%r{^routes/(.+)\.rb$})
  
  watch('config.ru')
  watch('Gemfile.lock')
  watch('nca.rb')
end
