class StepsController < ApplicationController
	before_filter :find_guide
	before_filter :find_step, :only => [:show, :edit, :update, :destroy]

	def new
		@step = @guide.steps.build
	end
	def create
		@step = @guide.steps.build(params[:step])
		if @step.save
			flash[:notice] = "Step has been created."
			redirect_to [@guide, @step]
		else
			flash[:alert] = "Step has not been created."
			render :action => "new"
		end
	end
	def show
	end
private
	def find_guide
		@guide = Guide.find(params[:guide_id])
	end
	def find_step
		@step = @guide.steps.find(params[:id])
	end
end
