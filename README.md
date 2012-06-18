# API Metro SP(metro.sp.gov.br)

-- Working in progress

## Install
	bundle install
	bundle exec rails server

## Tasks to sync data
	rake data:line          # Get Line Data
	rake data:line_status   # Get Line Status
	rake data:station       # Get Station data

## Current Work
	/lines(.:format)      
    	/lines/:id(.:format)    
	/stations(.:format)     
 	/stations/:id(.:format) 
  	/status(.:format)       
   	/status/:id(.:format)   

## TODO
	/lines/:id/status(.:format)  