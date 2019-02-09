class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: :business
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => [:home, :terms, :privacy, :websiteprivacy]

  # GET /records
  # GET /records.json
  def index
    @records = current_user.records
     if @records
    respond_to do |format|
        format.html
        format.js
    end
  end


  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])
    @date = @record.date
    @prescription_names = []
     @record.prescriptions.each do |x|
      @prescription_names << x.name
    end
    @tests = []
    @record.tests.each do |x|
      @tests << x.name
    end
    @xray_name = []
    @record.xrays.each do |x|
      @xray_name << x.name
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
        format.html { redirect_to @record, success: 'Record was successfully created.' }
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
        format.html { redirect_to @record, info: 'Record was successfully updated.' }
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
      format.html { redirect_to records_url, danger: 'Record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:query].present? && params[:query2].present? == false && params[:query3].present? == false
      @record = current_user.records
      @records = @record.search_by_name(params[:query])
      @record_name_other = @record.search_by_name_other(params[:query])


    elsif params[:query3].present? == true && params[:query2].present? == true && params[:query].present? == false
    @record = current_user.records
    @record_description = @record.search_by_description(params[:query3])
    @record_description_custom = @record.search_by_description_other(params[:query3])
    @record_prescription_name = @record.search_by_prescription_name(params[:query2])
    @records = []
    if @record_description
      @record_description.each do |record|
        @record_prescription_name.each do |pres|
          if pres == record
            @records << record
          end
        end
      end
    end

    if @record_description_custom
      @record_description_custom.each do |record|
        @record_prescription_name.each do |pres|
          if pres == record
            @records << record
          end
        end
      end
    end


    elsif params[:query2].present? && params[:query].present? == false && params[:query].present? == false
      @record = current_user.records
      @records = @record.search_by_prescription_name(params[:query2])



  elsif params[:query3].present? && params[:query].present? == false && params[:query2].present? == false
    @records = []
    @record = current_user.records
    @records = @record.search_by_description(params[:query3])
    @record_description_other = @record.search_by_description_other(params[:query3])


elsif params[:query].present? && params[:query3].present? && params[:query2].present? == false
      @recor = current_user.records
      @record_name = @recor.search_by_name_and_description(params[:query])
      @record_name_new_other = @recor.search_by_name_and_description_other(params[:query])
      @record_description = @recor.search_by_name_and_description(params[:query3])
      @record_description_new_other = @recor.search_by_name_and_description_other(params[:query3])
      @records = []
       if @record_name
        if @record_description
          @record_name.each do |record|
            @record_description.each do |desc|
              if record == desc
                @records << record
            end
          end
        end
        end
      end

      if @record_name
        if @record_description_new_other
          @record_name.each do |record|
            @record_description_new_other.each do |desc|
              if record == desc
                @records << record
          end
        end
      end
    end
  end

      if @record_name_new_other
        if @record_description
          @record_name_new_other.each do |record|
            @record_description.each do |desc|
              if record == desc
                @records << record
            end
          end
        end
      end
    end

    if @record_name_new_other
        if @record_description_new_other
          @record_name_new_other.each do |record|
            @record_description_new_other.each do |desc|
              if record == desc
                @records << record
            end
          end
        end
      end
    end

  elsif params[:query].present? && params[:query2].present? && params[:query3].present? == false
    @record = current_user.records
    @record_reason = @record.search_by_name(params[:query])
    @record_reason_other = @record.search_by_name_other(params[:query])
    @record_prescription_name = @record.search_by_prescription_name(params[:query2])
    @records = []

    if @record_reason
    @record_reason.each do |record|
      @record_prescription_name.each do |pres|
        if record == pres
          @records << record
        end
      end
    end
  end

  if @record_reason_other
    @record_reason_other.each do |record|
      @record_prescription_name.each do |pres|
        if record == pres
          @records << record
        end
      end
    end
  end

elsif params[:query].present? &&  params[:query3].present? && params[:query2].present?
    @record = current_user.records

    @record_reason = @record.search_by_name(params[:query])
    @record_reason_other = @record.search_by_name_other(params[:query])

    @record_description = @record.search_by_name_and_description(params[:query3])
    @record_description_new_other = @record.search_by_name_and_description_other(params[:query3])

    @record_prescription_name = @record.search_by_prescription_name(params[:query2])

    @records = []

    if @record_reason
      if @record_description
        @record_reason.each do |record|
          @record_description.each do |desc|
            @record_prescription_name.each do |pres|
              if record == desc && record == pres
                @records << record
              end
            end
          end
        end
      end
    end



    if @record_reason
      if @record_description_new_other
        @record_reason.each do |record|
          @record_description_new_other.each do |desc|
            @record_prescription_name.each do |pres|
              if record == desc && record == pres
                @records << record
              end
            end
          end
        end
      end
    end


    if @record_reason_other
      if @record_description
        @record_reason_other.each do |record|
          @record_description.each do |desc|
            @record_prescription_name.each do |pres|
              if record == desc && record == pres
                @records << record
              end
            end
          end
        end
      end
    end


    if @record_reason_other
      if @record_description_new_other
        @record_reason_other.each do |record|
          @record_description_new_other.each do |desc|
            @record_prescription_name.each do |pres|
              if record == desc && record == pres
                @records << record
              end
            end
          end
        end
      end
    end

    end
  end


  def thirty_days
    @userrecords = current_user.records
    @records = @userrecords.where('created_at > ?', 30.days.ago)
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end

  end



  def sixty_days
    @userrecords = current_user.records
    @records = @userrecords.where('created_at > ?', 60.days.ago)
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

def vaccines
    @userrecords = current_user.records
    @records = []
    @userrecords.each do |record|
      if record.name == "Vaccine"
         @records << record
       end
    end
    respond_to do |format|
      format.html
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end


  def business
    # @records = Record.all
    # @ct = state_records("CT")
    # @ct_record_reason = record_reason(@ct)
    # @ct_record_array_reason_other = record_reason_other(@ct)
    # @ct_record_test = record_test(@ct)
    # @ct_record_test_other = record_test_other(@ct)
    @TX = state_records('TX')
    @TX_record_reason = record_reason(@TX)
    @TX_record_array_reason_other = record_reason_other(@TX)
    @TX_record_test = record_test(@TX)
    @TX_record_test_other = record_test_other(@TX)

    @CT = state_records('CT')
    @CT_record_reason = record_reason(@CT)
    @CT_record_array_reason_other = record_reason_other(@CT)
    @CT_record_test = record_test(@CT)
    @CT_record_test_other = record_test_other(@CT)

    @CA = state_records('CA')
    @CA_record_reason = record_reason(@CA)
    @CA_record_array_reason_other = record_reason_other(@CA)
    @CA_record_test = record_test(@CA)
    @CA_record_test_other = record_test_other(@CA)
  end

  def terms
  end

  def privacy
  end

  def websiteprivacy
  end

  def home
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:description, :name, :vaccine, :vaccine_other, :name_other, :doctor, :prescription_name, :date, :rating, :comment, :description_other, :photo, prescription_ids:[], test_ids:[], xray_ids:[])
    end
    def authorize_admin
    redirect_to(root_path) unless current_user && current_user.business?
    #redirects to previous page
  end

  def record_reason(items)
    record_array_reason = []
    items.each do |record|
      if record.name != "Other"
        record_array_reason << record.name
      end
    end
    return record_array_reason
  end

def record_reason_other(items)
    record_array_reason_other = []
    items.each do |record|
      if record.name == "Other"
        record_array_reason_other << record.name_other
      end
    end
    return record_array_reason_other
  end

  def state_records(string)
    state_records_array = []
    Record.all.each do |record|
      if record.user.state == string
        state_records_array << record
      end
    end
    return state_records_array
  end

  def record_test(items)
    tests= []
    items.each do |record|
      if record.description != "None" && record.description != "Other"
        tests << record.description
      end
    end
    return tests
  end
  def record_test_other(items)
    tests_other= []
    items.each do |record|
      if record.description != "None" && record.description == "Other"
        tests_other << record.description_other
      end
    end
    return tests_other
  end

end
