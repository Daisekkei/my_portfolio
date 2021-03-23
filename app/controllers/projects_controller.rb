class ProjectsController < ApplicationController

  
  def index
    @projects = Project.all
  end

  def new
    @customers = Customer.all
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @customers = Customer.all
    if @project.save
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = 'プロジェクト登録しました'
    else
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = '保存できませんでした'
    end
  end

  
  def show
    
    @customers = Customer.all
    @project = Project.find(params[:id])
    @sales_conditions = @project.sales_conditions
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
      flash[:notice] = 'プロジェクト更新しました'
     
  end

  def destroy
    Project.find(params[:id]).destroy
      redirect_to controller: 'posts', action: 'index' 
      flash[:notice] = '顧客削除しました'
  end



  private
  def project_params
    params.require(:project).permit(:id, :project_name, :board_name, :customer_id)
  end


end
