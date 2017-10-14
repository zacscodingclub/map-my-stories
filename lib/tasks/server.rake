task :start do
  exec './bin/server'
end

task :deploy do
  exec 'eb deploy'
end
