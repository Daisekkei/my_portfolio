class SalesConditionsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @customers = Customer.all
    @project = Project.find(params[:project_id])
    @sales_condition = SalesCondition.new

  end

  def create
    @project = Project.find(params[:project_id])
    @sales_condition = Sales_condition.new(sales_condition_params)
    @sales_condition.project_id = current_project.id
    @customers = Customer.all
    pry.binding
    
    if @sales_condition.save
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = '登録しました'
    else
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = '保存できませんでした'
    end
  end

  def show
    @customers = Customer.all
    @sales_condition = Sales_condition.find(params[:id])
  end

  def edit
    @projects = Project.all
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = '顧客名更新しました'
     
  end

  def destroy
    Project.find(params[:id]).destroy
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = '顧客削除しました'
  end



  private
  def sales_condition_params
    params.require(:sales_condition_params).permit(:part_number, :Prot, :mp_date, :project_id, :sell_price, :buy_price, :quantity_month, :mp_site, :vendor)
  end


end
