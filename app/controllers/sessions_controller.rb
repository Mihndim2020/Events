class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]

  # GET /sessions or /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1 or /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    # @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions or /sessions.json
  def create
    user = User.find_by_username(params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Username is invalid"
      render 'new'
      
    end
    # @session = Session.new(session_params)

    # respond_to do |format|
    #   if @session.save
    #     format.html { redirect_to @session, notice: "Session was successfully created." }
    #     format.json { render :show, status: :created, location: @session }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @session.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /sessions/1 or /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: "Session was successfully updated." }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"

    # @session.destroy
    # respond_to do |format|
    #   format.html { redirect_to sessions_url, notice: "Session was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.fetch(:session, {})
    end
end
