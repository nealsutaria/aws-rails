class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = current_user.records
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])
    @pick_time= @record.pick_time
    @prescription_names = []
     @record.prescriptions.each do |x|
      @prescription_names << x.name
    end
    @tests = []
    @record.tests.each do |x|
      @tests << x.name
    end
  end

  # GET /records/new
  def new
    @user = current_user
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @user = User.find(current_user.id)
    @record = Record.new(record_params)
    @record.user = @user

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:query].present? && params[:query2].present? == false
      @record = current_user.records
      @records= @record.search_by_name(params[:query])
    elsif params[:query3].present? == true && params[:query2].present? == true && params[:query].present? == false
    @record = current_user.records
    @prescriptions = Prescription.search_by_name(params[:query2])
    @records = []
    @record_description_other = []
    @record_description = @record.search_by_description(params[:query3])
    @record_description_other_other = @record.search_by_description_other(params[:query3])
      if @record_description
        @record_description.each do |record|
        if record.prescriptions == @prescriptions
          @records << record
        end
      end
    else
      @record_description_other_other.each do |record|
        if record.prescriptions == @prescriptions
          @record_description_other << record
        end
      end
    end
    elsif params[:query2].present? && params[:query].present? == false
      @record = current_user.records
      @prescriptions = Prescription.search_by_name(params[:query2])
      @records = []
      @record.each do |record|
        if record.prescriptions == @prescriptions
          @records << record
        end
      end

    elsif params[:query].present? && params[:query2].present?
      @recor = current_user.records
      @record= @recor.search_by_name(params[:query])
      @prescriptions = Prescription.search_by_name(params[:query2])
      @records = []
      @record.each do |record|
        if record.prescriptions == @prescriptions
          @records << record
        end
      end
  elsif params[:query3].present? && params[:query].present? == false && params[:query2].present? == false
    @records = []
    @record = current_user.records
    @records = @record.search_by_description(params[:query3])
    @record_description_other = @record.search_by_description_other(params[:query3])
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:description, :name, :name_other, :doctor, :prescription_name, :pick_time, :description_other, prescription_ids:[], test_ids:[])
    end
end
