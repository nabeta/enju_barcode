class BarcodesController < ApplicationController
  load_and_authorize_resource

  # GET /barcodes
  # GET /barcodes.json
  def index
    @barcodes = Barcode.page(params[:page])
    @start_rows = params[:start_rows]
    @start_cols = params[:start_cols]

    if params[:mode] == 'barcode'
      render :action => 'barcode', :layout => false
      return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @barcodes }
    end
  end

  # GET /barcodes/1
  # GET /barcodes/1.json
  def show
    @barcode = Barcode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @barcode }
      format.svg { send_data @barcode.data, :type => 'image/svg+json', :disposition => 'inline' }
    end
  end

  # GET /barcodes/new
  # GET /barcodes/new.json
  def new
    @barcode = Barcode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @barcode }
    end
  end

  # GET /barcodes/1/edit
  def edit
    @barcode = Barcode.find(params[:id])
  end

  # POST /barcodes
  # POST /barcodes.json
  def create
    @barcode = Barcode.new(params[:barcode])

    respond_to do |format|
      if @barcode.save
        flash[:notice] = t('controller.successfully_created', :model => t('activerecord.models.barcode'))
        format.html { redirect_to(@barcode) }
        format.json { render :json => @barcode, :status => :created, :location => @barcode }
      else
        format.html { render :action => "new" }
        format.json { render :json => @barcode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /barcodes/1
  # PUT /barcodes/1.json
  def update
    @barcode = Barcode.find(params[:id])

    respond_to do |format|
      if @barcode.update_attributes(params[:barcode])
        flash[:notice] = t('controller.successfully_updated', :model => t('activerecord.models.barcode'))
        format.html { redirect_to(@barcode) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @barcode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /barcodes/1
  # DELETE /barcodes/1.json
  def destroy
    @barcode = Barcode.find(params[:id])
    @barcode.destroy

    respond_to do |format|
      format.html { redirect_to(barcodes_url) }
      format.json { head :ok }
    end
  end
end
