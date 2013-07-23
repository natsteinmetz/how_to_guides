require 'spec_helper'

feature 'Deleting steps' do
	let!(:guide) {Factory(:guide)}
	let!(:step) {Factory(:step, :guide => guide)}

	before do
		visit '/'
		click_link "Show"
		click_link step.name
	end

	scenario "Deleting a step" do
		click_link "Delete Step"
		page.should have_content("Step has been deleted.")
		page.current_url.should == guide_url(guide)
	end
end

