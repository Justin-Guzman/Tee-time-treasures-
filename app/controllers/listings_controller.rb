class ListingsController < ApplicationController
  def index
    matching_listings = Listing.all

    @list_of_listings = matching_listings.order({ :created_at => :desc })

    render({ :template => "listings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_listings = Listing.where({ :id => the_id })

    @the_listing = matching_listings.at(0)

    render({ :template => "listings/show.html.erb" })
  end

  def create
    the_listing = Listing.new
    the_listing.title = params.fetch("query_title")
    the_listing.description = params.fetch("query_description")
    the_listing.price = params.fetch("query_price")
    the_listing.image = params.fetch("query_image")
    the_listing.status = params.fetch("query_status")
    the_listing.category_id = params.fetch("query_category_id")
    the_listing.seller_id = params.fetch("query_seller_id")
    the_listing.buyer_id = params.fetch("query_buyer_id")

    if the_listing.valid?
      the_listing.save
      redirect_to("/listings", { :notice => "Listing created successfully." })
    else
      redirect_to("/listings", { :alert => the_listing.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_listing = Listing.where({ :id => the_id }).at(0)

    the_listing.title = params.fetch("query_title")
    the_listing.description = params.fetch("query_description")
    the_listing.price = params.fetch("query_price")
    the_listing.image = params.fetch("query_image")
    the_listing.status = params.fetch("query_status")
    the_listing.category_id = params.fetch("query_category_id")
    the_listing.seller_id = params.fetch("query_seller_id")
    the_listing.buyer_id = params.fetch("query_buyer_id")

    if the_listing.valid?
      the_listing.save
      redirect_to("/listings/#{the_listing.id}", { :notice => "Listing updated successfully."} )
    else
      redirect_to("/listings/#{the_listing.id}", { :alert => the_listing.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_listing = Listing.where({ :id => the_id }).at(0)

    the_listing.destroy

    redirect_to("/listings", { :notice => "Listing deleted successfully."} )
  end
end
