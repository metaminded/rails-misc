class ActiveRecord::Base
  MATCHCODE_PATTERN = /^([a-z]|[0-9]|-|\/|\.|_)+$/
  def self.act_as_matchcoded(matchcode=:matchcode)
    validates_format_of matchcode, :with => MATCHCODE_PATTERN, :allow_nil => true
    validates_uniqueness_of matchcode, :allow_nil => true
    self.define_singleton_method :[] do |m|
      self.send("find_by_#{matchcode}", m)
    end
  end
end
