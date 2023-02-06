# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :openapi do
  namespace :generate do
    task :html2 do
      sh "openapi-generator generate -i public/openapi.yml -g html2 -t public/openapi-template/html2 -o public/openapi"
    end
  end
end
