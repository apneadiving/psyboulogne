class InquiriesController < ApplicationController

 # before_filter :find_page, :only => [:create, :new]

  # def thank_you
  #   @page = Page.find_by_link_url("/contact/thank_you", :include => [:parts, :slugs])
  # end

  # def new
  #   @inquiry = Inquiry.new
  # end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      if @inquiry.ham?
        begin
          InquiryMailer.notification(@inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
        end

        # begin
        #   InquiryMailer.confirmation(@inquiry, request).deliver
        # rescue
        #   logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
        # end if InquirySetting.send_confirmation?
      end
      flash[:notice] = "Merci pour votre message"
      
    else
      error_message = []
      error_message << "Vous devez fournir votre une adresse email valide." if @inquiry.errors.keys.include? :email 
      error_message << "Vous devez ecrire un message." if @inquiry.errors.keys.include? :message 
        
      flash[:email] = @inquiry.email
      flash[:message] = @inquiry.message
      flash[:error] = error_message.join "<br/>"
    end
    redirect_to root_url
  end

protected

  # def find_page
  #   @page = Page.find_by_link_url('/contact', :include => [:parts, :slugs])
  # end

end