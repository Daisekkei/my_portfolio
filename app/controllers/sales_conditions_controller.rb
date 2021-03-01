class SalesConditionsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @customers = Customer.all
    @project = Project.find(params[:project_id])
    @sales_condition = SalesCondition.new(sales_condition_params)
    move_to_signed_in
  end

  def create
    # binding.pry
    @project = Project.find(params[:project_id])
    @sales_condition = SalesCondition.new(sales_condition_params)
    @sales_condition.project_id = params[:project_id]
    @customers = Customer.all

    if @sales_condition.save
      redirect_to controller: 'posts', action: 'index'
      flash[:notice] = '登録しました'
    else
      redirect_to controller: 'sales_conditions', action: 'new'
      flash[:alert] = '保存できませんでした'
    end
  end

  def show
    @customers = Customer.all
    @project = Project.find(params[:id])
    params[:sales_condition_id]
    @sales_condition.project_id = params[:project_id]
    @sales_condition = SalesCondition.find(params[:id])
  end

  def edit
    @projects = Project.all
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
      redirect_to controller: 'posts', action: 'index'
      flash[:notice] = 'プロジェクト詳細更新しました'

  end

  def destroy
    @sales_condition = Sales_condition.find(params[:id])
    @project = Project.find(params[:id])
    @sales_condition.project_id = params[:project_id]
    SalesCondition.find(params[:id]).destroy
      redirect_to controller: 'projects', action: 'show'
      flash[:notice] = '詳細プロジェクトを削除しました'
  end



private
  def sales_condition_params
    params.require(:sales_condition).permit(:vendor, :part_number, :prot_date, :mp_date, :sell_price, :buy_price, :quantity_month, :mp_site )
    # 
    # ストロングパラメータの設置のため、ネストされているルーティングの場合、今回は
    # resources :projects do
    #   resources :posts
    #   resources :sales_conditions
    # end
    # params.permit(:)
  end


end
