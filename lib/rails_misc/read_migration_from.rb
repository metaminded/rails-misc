module MigrationHelpers

  def read_migration_from(filespec, name='default')
    if filespec.start_with?("/")
      s = File.new(filespec).read
    else
      s = File.new(File.join(Rails.root, "app", filespec)).read
    end
    s = s.split(/^__END__$/)[1]
    raise "no `__END__` found in file" unless s
    blocks = s.split /^__+\s*/
    mm = {'default' => blocks[0]}
    blocks[1..-1].each do |b|
      bb = b.split("\n").map{|l|l.strip.presence}.compact
      mm[bb[0]] = bb[1..-1].join("\n")
    end
    mm[name.to_s] or raise("No migration named `#{name}` found in `#{filespec}`.")
  end

  def execute_migration_from(filespec, name='default')
    execute read_migration_from(filespec, name)
  end

  def migration_from(filespec, name='default')
    instance_eval read_migration_from(filespec, name)
  end
end

ActiveRecord::Migration.send :include, MigrationHelpers
