namespace :db do
  desc 'Fill database.'
  task :init  => :environment do
    Energylog.fill
  end
end
