class SymptomsController < ApplicationController
  # GET /symptoms
  # GET /symptoms.json
  def index
    @user = User.find(params[:user_id])
    @symptoms = @user.symptoms
  end


  # GET /symptoms/1
  # GET /symptoms/1.json

  def show
    @user = User.find(params[:user_id])
    @symptom = @user.symptoms.find(params[:id])
  end



  # GET /symptoms/new
  # GET /symptoms/new.json
  def new
    @user = User.find(params[:user_id])
    @symptom = @user.symptoms.build
  end


  # GET /symptoms/1/edit
  def edit
    @user = User.find(params[:user_id])
    @symptom = @user.symptoms.find(params[:id])
  end

  # POST /symptoms
  # POST /symptoms.json
  def create
    @user = User.find(params[:user_id])
    @symptom = @user.symptoms.build(params[:symptom])
    if @symptom.save
      redirect_to user_symptom_url(@user, @symptom)
    else
      render :action => "new"
    end
  end


  # PUT /symptoms/1
  # PUT /symptoms/1.json
  def update
    @symptom = Symptom.find(params[:id])

    respond_to do |format|
      if @symptom.update_attributes(params[:symptom])
        format.html { redirect_to @symptom, notice: 'Symptom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /symptoms/1
  # DELETE /symptoms/1.json
  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy
  end
end





