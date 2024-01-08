%dw 2.0
import modules::JSONLoggerModule
import withMaxSize from dw::core::Strings
import * from dw::core::Arrays

var isDebugOn = Mule::p('secure::json.logger.debug.on')
var payloadMaxLength = Mule::p('secure::json.logger.payload.max.length')
var payloadMaxElements = Mule::p('secure::json.logger.payload.max.elements')

fun build(payload) = {
	payload:
   		(
   			if (isDebugOn == "true")
   				if (payload is String)
   					JSONLoggerModule::stringifyAnyWithMetadata(payload) as String withMaxSize payloadMaxLength
   				else if (payload is Array)
   					JSONLoggerModule::stringifyAnyWithMetadata(write(slice(payload, 0, payloadMaxElements), "application/java"))
   				else
   					JSONLoggerModule::stringifyAnyWithMetadata(write(payload, "application/java"))
    		else  
    			''
    	)
}