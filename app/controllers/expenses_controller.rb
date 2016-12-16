class ExpensesController < ApplicationController
    before_action :authenticate_user!

  	def index
        
        @expenses = Expense.order("date DESC")
  		@expenses = @expenses.where("user_id = ?" , current_user.id)

        if params[:concept].present?
     		expenses_temporal = Array.new
	     		
            @expenses.each do |temp|
	     		if temp.concept.downcase.include? params[:concept].downcase 
	     			expenses_temporal << temp
	     		end
     		end
            @expenses = expenses_temporal
        end

    	if params[:category_id].present?
     		category = Category.find(params[:category_id])
     		expenses_temporal = Array.new
     	
	     	@expenses.each do |temp|     		
	     		if temp.category == category 
	     			expenses_temporal << temp 
	     		end		
     		end
            @expenses = expenses_temporal
    	end
	end
end
#concept = temp.concept.downcase