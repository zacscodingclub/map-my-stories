task :start do
  exec './bin/server'
end

task :deploy do
  exec 'rails assets:precompile && eb deploy'
end
