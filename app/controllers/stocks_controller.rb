class StocksController <ApplicationController
   def search
    if params[:stock].present?
        @stock=Stock.new_lookup(params[:stock])
        if @stock
            respond_to do |format|
                format.js { render partial: 'users/result'}
            end   
        else
          respond_to do
            flash.now[:alert] = "please enter valid symbol"
            format.js { render partial: 'users/result' }
          end    
        end
    else
      respond_to do
        flash.now[:alert] = "please enter some valid symbol"
        format.js { render partial: 'users/result' }
      end 
    end
   end
  
   def update
    stock=Stock.find_by(id: params[:id])
    p=Stock.new_lookup(stock[:ticker])
    stock.last_price=p.last_price
    stock.save
    #render partial: 'stocks/row'
   end  
end
