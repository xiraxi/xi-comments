
Factory.sequence(:commentable_name) {|n| "Generted commentable ##{n}" }

Factory.define :commentable do |c|
  c.name { Factory.next :commentable_name }
end
