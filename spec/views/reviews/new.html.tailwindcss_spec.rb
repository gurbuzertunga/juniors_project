require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      text: "MyString",
      creator: "MyString",
      product_id: nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[text]"

      assert_select "input[name=?]", "review[creator]"

      assert_select "input[name=?]", "review[product_id_id]"
    end
  end
end
