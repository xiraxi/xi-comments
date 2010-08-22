
# Only for testing
if Rails.env.test?
  # Load Commentables engine
  require File.expand_path("../../../test/commentables/lib/commentables", __FILE__)
  Commentables.new.run_initializers(Rails.application)
end
