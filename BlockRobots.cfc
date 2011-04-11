<cfcomponent mixin="controller" output="false">
	
	<!----------------------------------------------------->
	
	<cffunction name="init" hint="Constructor.">
	
		<cfset this.version = "1.0,1.0.1,1.0.2,1.0.3,1.0.4,1.0.5,1.1,1.1.1,1.1.2,1.1.3">
		<cfreturn this>
	
	</cffunction>
	
	<!----------------------------------------------------->
	
	<cffunction name="blockRobots" returntype="string" hint="Blocks robots if environment is not production or if `true` is passed to either argument for this function.">
		<cfargument name="blockIndexing" type="boolean" required="false" default="false" hint="Whether or not to block robots from indexing.">
		<cfargument name="blockFollowing" type="boolean" required="false" default="false" hint="Whether or not to block robots from following links on the calling page.">
		
		<cfset var loc = {}>
		
		<!--- Decide what to nofollow in meta tag --->
		<cfset loc.blockText = "">
		<cfif
			arguments.blockIndexing
			or get("environment") is not "production"
		>
			<cfset loc.blockText = "noindex">
		</cfif>
		<cfif
			arguments.blockFollowing
			or get("environment") is not "production"
		>
			<cfset loc.blockText = ListAppend(loc.blockText, "nofollow")>
		</cfif>
		
		<!--- If we're blocking anything, return robots instructions --->
		<cfif Len(loc.blockText) gt 0>
			<cfreturn '<meta name="robots" content="#loc.blockText#" />'>
		<cfelse>
			<cfreturn "">
		</cfif>
	
	</cffunction>
	
	<!----------------------------------------------------->
	
</cfcomponent>