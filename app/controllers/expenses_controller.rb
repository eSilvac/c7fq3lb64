class ExpensesController < ApplicationController
  	def index
  		if params[:category_id] == nil || params[:category_id] == ""
     		expenses_temporal = Expense.all
     		@expenses = Array.new
     		if params[:concept] == nil || params[:concept] == ""
     			@expenses = expenses_temporal
     		else
	     		expenses_temporal.each do |temp|
	     			concept = temp.concept.downcase
	     			if concept.include? params[:concept].downcase
	     				@expenses << temp
	     			end
	     		end
     		end
    	else
     		category = Category.find(params[:category_id])
     		expenses_temporal = category.expenses
     		@expenses = Array.new
     	
     		if params[:concept] == nil || params[:concept] ==""
     			@expenses = expenses_temporal
     		else
	     		expenses_temporal.each do |temp|
	     			concept = temp.concept.downcase
	     			if concept.include? params[:concept].downcase
	     				@expenses << temp
	     			end		
	     		end
     		end
    	end
	end
end
