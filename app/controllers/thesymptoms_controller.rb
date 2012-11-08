class ThesymptomsController < ApplicationController
  def index
    @thesymptoms = thesymptom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thesymptoms }
    end
  end

# GET /symptoms/1
# GET /symptoms/1.json
  def show
    @user = User.find(params[:user_id])
    @thesymptom = thesymptom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thesymptom }
    end
  end

  def new
    @thesymptom = thesymptom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thesymptom }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @thesymptom = @user.thesymptoms.create(params[:id])
    #in the guide, it is suggested that the params goes to params[:thesymptom])
    redirect_to user_path(@user)
  end


  def update
    @thesymptom = thesymptom.find(params[:id])

    respond_to do |format|
      if @thesymptom.update_attributes(params[:id])
        format.html { redirect_to @thesymptom, notice: 'Symptom was successfully updated.' }
        format.json do
          head :no_content
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @thesymptom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = Post.find(params[:user_id])
    @thesymptom = @user.thesymptoms.find(params[:id])
    @thesymptom.destroy
    redirect_to user_path(@user)
  end

end




