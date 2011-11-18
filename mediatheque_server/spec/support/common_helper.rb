include ActiveRecord

module RSpec::CommonHelper
  def mock_model_with_errors(klass, stubs = {})
    model = mock_model(klass, stubs)
    model.stub!(:errors).and_return(ActiveModel::Errors.new(model))
    model
  end
end