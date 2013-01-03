# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/Users/rathod/ozoneit/finance_data_management_system/finacial_data_management_system/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
 every 2.minutes do
   runner "cron_test.rb"
 end

# Learn more: http://github.com/javan/whenever
