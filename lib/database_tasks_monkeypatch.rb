require "active_record/tasks/database_tasks"

module ActiveRecord
  module Tasks
    module DatabaseTasks
      private

      alias original_initialize_database initialize_database

      def initialize_database(db_config)
        with_temporary_pool(db_config) do
          unless migration_connection_pool.schema_migration.table_exists?
            migration_connection_pool.schema_migration.create_table
          end
        rescue ActiveRecord::NoDatabaseError
          # Let the original method take over
        end

        original_initialize_database(db_config)
      end
    end
  end
end
