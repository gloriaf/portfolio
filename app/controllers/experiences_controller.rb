class ExperiencesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: [:destroy, :update]
  
  def index
    @user = User.find(params[:user_id])
    @experiences = @user.experiences.paginate(page: params[:page])
  end
  
  def new
    @user = User.find(current_user)
    @experience = Experience.new
    @experience.year=2012
  end

  def create
    @user = User.find(current_user)
    @experience = @user.experiences.build(params[:experience])
    if @experience.save
      flash[:success] = "Experience created!"
      redirect_to user_experiences_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @experience = @user.experiences.find(params[:id])
  end

  def destroy
    @user = User.find(current_user)
    current_user.experiences.find(params[:id]).destroy
    flash[:notice] = "Experience deleted"
    redirect_to user_experiences_path(@user)

  end
  
  def edit
    @user = User.find(current_user)
    @experience = current_user.experiences.find(params[:id])
  end

  def update
    @user = User.find(current_user)
    if @experience.update_attributes(params[:experience])
      flash[:notice] = "The note #{@experience.name} was successfuly updated"
      redirect_to user_experience_path(@user, @experience)
    else
      render :edit
    end
 end
  
  def summary
    @user = User.find(params[:user_id])
    @experiences = @user.experiences.all
    @mail_to = current_user.email
    PortfolioMailer.summary_experience(@user, @experiences, @mail_to).deliver
    redirect_to user_experiences_path(@user)
  end
  
  private

  def correct_user
    @experience = current_user.experiences.find_by_id(params[:id])
    redirect_to root_url if @experience.nil?
  end

end
