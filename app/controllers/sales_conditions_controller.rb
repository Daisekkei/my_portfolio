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
    @customers = Customer.all
    project = Project.find_by(id:params[:project_id])
    @sales_condition = SalesCondition.create(sales_condition_params)
    @sales_condition.project_id = params[:project_id]
    if @sales_condition.save
      redirect_to project
      flash[:notice] = '登録しました'
    else
      redirect_to controller: 'sales_conditions', action: 'new'
      flash[:alert] = '保存できませんでした'
    end
  end


  def show
    @customers = Customer.all
    @project = Project.find(params[:project_id])
    
    # params[:sales_condition_id]
    @sales_condition = SalesCondition.find(params[:id])
  end


  def edit
    @projects = Project.all
    @customers = Customer.all
    @project = Project.find_by(params[:id])
    @sales_condition = SalesCondition.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @sales_condition = SalesCondition.find(params[:id])
    @sales_condition.update(sales_condition_params)
    if @sales_condition.save
      redirect_to @project
      flash[:notice] = 'プロジェクト詳細更新しました'
    else
      redirect_to @project
      flash[:alert] = '保存できませんでした'
    end
  end   


  def destroy
    @project = Project.find(params[:project_id])
    SalesCondition.find(params[:id]).destroy
    redirect_to @project
      flash[:notice] = '詳細プロジェクトを削除しました'
  end



  private
  def sales_condition_params
    params.require(:sales_condition).permit(:vendor, :project_id, :part_number, :prot_date, :mp_date, :sell_price, :buy_price, :quantity_month, :mp_site)
    # 
    # ストロングパラメータの設置のため、ネストされているルーティングの場合、今回は
    # resources :projects do
    #   resources :posts
    #   resources :sales_conditions
    # end
    # params.permit(:)
  end


end
