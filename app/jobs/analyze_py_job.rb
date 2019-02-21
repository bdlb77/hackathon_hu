class AnalyzePyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = `python lib/assets/ols_regression.py`
    p result
  end
end
