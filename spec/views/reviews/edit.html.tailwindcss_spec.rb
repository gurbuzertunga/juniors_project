require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  let(:review) {
    Review.create!(
      text: "MyString",
      creator: "MyString",
      product_id: nil
    )
  }

  before(:each) do
    assign(:review, review)
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(review), "post" do

      assert_select "input[name=?]", "review[text]"

      assert_select "input[name=?]", "review[creator]"

      assert_select "input[name=?]", "review[product_id_id]"
    end
  end
end
