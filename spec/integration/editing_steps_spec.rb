require 'spec_helper'

feature "Editing steps" do
	let!(:guide) {Factory(:guide)}
	let!(:step) {Factory(:step, :guide => guide)}

	before do
		visit '/'
		click_link "Show"
		click_link step.name
		click_link "Edit Step"
	end

	scenario "Updating a step" do
		fill_in "Name", :with => "Make it really shiny!"
		click_button "Update Step"
		page.should have_content "Step has been updated."
		page.should have_content "Make it really shiny!"
		page.should_not have_content step.name
	end

	scenario "Updating a step with invalid information" do
		fill_in "Name", :with => ""
		click_button "Update Step"
		page.should have_content("Step has not been updated.")
	end
end

