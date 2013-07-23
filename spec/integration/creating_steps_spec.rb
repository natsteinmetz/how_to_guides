require 'spec_helper'
feature "Creating Steps" do
	before do
		Factory(:guide, :name => "Test Guide")
		visit '/'
		click_link "Show"
		click_link "New Step"
	end
	scenario "Creating a step" do
		fill_in "Name", :with => "Step Number 1"
		fill_in "Number", :with => "1"
		click_button "Create Step"
		page.should have_content("Step has been created.")
	end
	scenario "Creating a step without valid attributes fails" do
		click_button "Create Step"
		page.should have_content("Step has not been created.")
		page.should have_content("Name can't be blank")
		page.should have_content("Number can't be blank")
	end
end

