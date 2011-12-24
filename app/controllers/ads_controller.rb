class AdsController < ApplicationController

	# Get request from a corporation
  def new
  	unless current_corporation
  		flash[:error] = "Only actual corporations can make ads. Consider becoming a large corporation"
  		redirect_to "/"
  		return
    end
    @ad = Ad.new(:corporation)

  end

  # Post from corporation account
  def create
  	# Step 1: Confirm a corporation is doing this
  	#corp = Corporation.find_for_authentication( params[:ad][:corporation] )
  	#if corp.nil?
    unless current_corporation
  		flash[:error] = "Only actual corporations can make ads. Consider becoming a large corporation"
  		redirect_to "/"
  		return
  	end

  	# Step 2: Initialize an ad objection
    #corp = current_corporation
    #@ad = corp.ads.new(params[:ad])
    @ad = Ad.new(params[:ad])
    @ad.corporation_id = current_corporation.id


  	# Step 3: Try to save it
  	unless @ad.save
  		# We've encountered an error while trying to save the ad; handle this error
  		flash.now[:error] = "Ad not saved correctly. Handle this error better."
  		render 'new'
  		return
  	end

  	# Step 4: Handle successful saving by redirection
    @adstat = Adstat.new(:ad_id => @ad.id, :views => 0)
    @adstat.save
  	flash[:success] = "Successfully created a new ad"
    redirect_to crop_ad_path(@ad)
  end


  # Get from anyone
  def show
    @ad = Ad.find(params[:id])
    @adstat = Adstat.find_by_ad_id(params[:id])
    @adstat.views += 1
    @adstat.save
  end

	# Get request from anyone
  def index
    @ads = Ad.find(:all)
  end

	# Delete request from a corporation
  def destroy
	  # Step 1: Confirming we have permission to do this
  	
  	# Step 2: Attempt the deletion
  	
  	# Step 3: Handle a successful deletion update
  	
  	# Step 4: Handle a failed deletion attempt
  end

	# Get request from corporation
  def edit
  end

	# Put request from corporation
  def update
   @ad = Ad.find(params[:id])
  @corporation = Corporation.find(@ad.corporation_id)
  if @ad.update_attributes(params[:ad])
    if params[:commit] == "Crop"
      flash[:notice] = "Successfully updated Ad."
      redirect_to @ad
    else
      render :action => "crop"
    end
  else
    render :action => 'crop'
  end

  end
  
  def crop
    @ad = Ad.find(params[:id])

  end
  
  def interact
  
  end

end
