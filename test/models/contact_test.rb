require "test_helper"

class ContactTest < ActiveSupport::TestCase

  # runs before every test method
  def setup
    Contact.destroy_all
    Company.destroy_all
  end

  test "contact without company_id should not save" do
    contact = Contact.new
    contact["first_name"] = "Tim"
    contact["last_name"] = "Cook"
    contact.save

    # contact should NOT have been saved (no company_id)
    assert_equal 0, Contact.all.count
  end

  test "contact with company_id should save" do
    apple = Company.new
    apple["name"] = "Apple"
    apple.save

    contact = Contact.new
    contact["first_name"] = "Tim"
    contact["last_name"] = "Cook"
    contact["company_id"] = apple["id"]
    contact.save

    assert_equal 1, Contact.all.count
  end

end