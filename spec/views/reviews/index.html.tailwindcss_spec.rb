require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        text: "Text",
        creator: "Creator",
        product_id: nil
      ),
      Review.create!(
        text: "Text",
        creator: "Creator",
        product_id: nil
      )
    ])
  end

  it "renders a list of reviews" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Text".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Creator".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
