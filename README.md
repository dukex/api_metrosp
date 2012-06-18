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

   lines GET /lines(.:format)      
    line GET /lines/:id(.:format)    
stations GET /stations(.:format)     
 station GET /stations/:id(.:format) 
  status GET /status(.:format)       
   statu GET /status/:id(.:format)   

## TODO
    line GET /lines/:id/status(.:format)  