module ProjectsHelper

  def current_project
    @current_project ||= Project.find_by(id: session[:project_id])
  end

end
