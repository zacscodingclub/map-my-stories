task :start do
  exec './bin/server'
end

task :deploy do
  exec 'rails assets:precompile'
  exec 'eb deploy'
end
