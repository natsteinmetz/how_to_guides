require 'spec_helper'
feature "Viewing steps" do
	before do
		test_guide = Factory(:guide, :name => "Test Guide")
		Factory(:step,
						:guide => test_guide,
						:name => "Make it shiny!",
						:number => "1")
		visit '/' 
	end
	scenario "Viewing steps for a given guide" do
		click_link "Show"
		page.should have_content("Make it shiny!")

		click_link "Make it shiny!"
		save_and_open_page
		page.should have_content("1")
		page.should have_content("Make it shiny!")
	end
end

