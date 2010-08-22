
# Load Commentable's tables
ActiveRecord::Migrator.migrate(Commentables.root.join("db/migrate"), nil)

