# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require_relative "lib/database_tasks_monkeypatch" if ENV["APPLY_FIX"] == "true"

Rails.application.load_tasks
