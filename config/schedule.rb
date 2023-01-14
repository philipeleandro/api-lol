env :PATH, ENV['PATH']
set :output, "log/cron.log"

every '0 15 1,7,15,28 * *' do
  rake "champion_data:populate"
end
