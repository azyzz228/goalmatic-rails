class ActivitiesController < ApplicationController
  before_action :set_challenge
  before_action :set_activity, only: %i[ show edit update destroy ]

  def index
    @activities = @challenge.activities 
  end

  def show
  end

  def new
    @activity = @challenge.activities.build
  end

  def edit
  end

  def create
    @activity = @challenge.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to challenge_activity_url(@challenge, @activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to challenge_activity_url(@challenge, @activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(@activity).to_sym) }
      format.html { redirect_to challenge_url(@challenge), notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      # puts(params)
      @activity = @challenge.activities.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:note, :amount, :challenge_id)
    end
end
