
Factory.sequence(:commentable_name) {|n| "Generted commentable ##{n}" }

Factory.define :commentable do |c|
  c.name { Factory.next :commentable_name }
end

Factory.define :comment do |c|
  c.content "Non random text"
  c.association :commentable, :factory => :commentable
  c.association :user, :factory => :user
end

