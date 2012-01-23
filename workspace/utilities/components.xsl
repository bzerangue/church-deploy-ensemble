<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component">
	
	<xsl:param name="xpath" />
	
	<xsl:if test="count($xpath/item)">
		
		<div class="column {name($xpath)}">
		
			<xsl:for-each select="$xpath/item/label/@handle">
			
				<xsl:if  test=". = 'downloads'">
					<xsl:call-template name="component-downloads">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
			
				<xsl:if  test=". = 'events'">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
			
				<xsl:if test=". = 'images'">
					<xsl:call-template name="component-images">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
				
				<xsl:if  test=". = 'locations'">
					<xsl:call-template name="component-locations">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
				
				<xsl:if  test=". = 'members'">
					<xsl:call-template name="component-members">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
				
				<xsl:if test=". = 'text'">
					<xsl:call-template name="component-text">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
				
				<xsl:if test=". = 'verses'">
					<xsl:call-template name="component-verses">
						<xsl:with-param name="position" select="name($xpath)" />
					</xsl:call-template>
				</xsl:if>
			
			</xsl:for-each>
			
		</div>
	
	</xsl:if>
	
</xsl:template>



<xsl:template name="component-downloads">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //downloads-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'downloads'" />
			</xsl:call-template>
			
			<h3 class="header">Downloads</h3>
			
			<xsl:for-each select="//downloads-entries-by-tag/entry">
	
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<div>
						
						<xsl:attribute name="class">
							
							<xsl:text>icon</xsl:text>
							
						</xsl:attribute>
					
					</div>
					
					<a class="description">
						
						<xsl:attribute name="href">
							
							<xsl:value-of select="$workspace" />
							<xsl:value-of select="file/@path" />
							<xsl:text>/</xsl:text>
							<xsl:value-of select="file/filename" />
							
						</xsl:attribute>
						
						<span class="name">
							<xsl:value-of select="name" disable-output-escaping="yes" />
						</span>
						
						<span class="meta">
							
							<span class="filename">
								<xsl:value-of select="file/filename" disable-output-escaping="yes" />
							</span>
							
							<span class="filesize">
								<xsl:value-of select="file/@size" disable-output-escaping="yes" />
							</span>
							
							<span class="filetype">
								<xsl:value-of select="file/@type" disable-output-escaping="yes" />
							</span>
							
							<span class="creation-date">
								<xsl:value-of select="file/meta/@creation" disable-output-escaping="yes" />
							</span>
							
						</span>
						
					</a>
					
				</div>
				
			</xsl:for-each>
			
		</div>

	</xsl:if>

</xsl:template>



<xsl:template name="component-events">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //events-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'event'" />
			</xsl:call-template>
			
			<h3 class="header">Upcoming Events</h3>
			
			<xsl:for-each select="//events-entries-by-tag/entry">
	
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<div class="date">
						
						<span class="month">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="'%m-;'" />
							</xsl:call-template>
						</span>
						
						<span class="day">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="'%d;'" />
							</xsl:call-template>
						</span>
					
					</div>
					
					<div class="info">
					
						<span class="description">
							<xsl:value-of select="name" disable-output-escaping="yes" />
						</span>
						
						<span class="location">
						
							<xsl:variable name="location-id" select="location/item/@id" />
								
							<xsl:for-each select="//events-entries-by-tag-locations/entry[ @id = $location-id ]">
								<xsl:choose>
									<xsl:when test="string-length(name-casual)">
										<xsl:value-of select="name-casual" disable-output-escaping="yes" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="name-formal" disable-output-escaping="yes" />
									</xsl:otherwise>
								</xsl:choose>
								
							</xsl:for-each>
							
						</span>
						
					</div>
					
				</div>
				
			</xsl:for-each>
			
		</div>

	</xsl:if>

</xsl:template>



<xsl:template name="component-images">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //images-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'images'" />
			</xsl:call-template>
			
			<xsl:for-each select="//images-entries-by-tag/entry">
									
				<div>
					
					<xsl:call-template name="class-rows">
						<xsl:with-param name="class" select="' image'" />
					</xsl:call-template>
										
					<xsl:attribute name="style">
						
						<xsl:text>background-image: url('</xsl:text>
						
						<xsl:value-of select="$root" />
						
						<xsl:text>/image/2/920/</xsl:text>
						
						<xsl:choose>
							<xsl:when test="string-length(height)">
								<xsl:value-of select="height" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>400</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						
						<xsl:text>/</xsl:text>
						
						<xsl:choose>
							<xsl:when test="position = 'Top left'"     >1</xsl:when>
							<xsl:when test="position = 'Top center'"   >2</xsl:when>
							<xsl:when test="position = 'Top right'"    >3</xsl:when>
							<xsl:when test="position = 'Middle left'"  >4</xsl:when>
							<xsl:when test="position = 'Middle center'">5</xsl:when>
							<xsl:when test="position = 'Middle right'" >6</xsl:when>
							<xsl:when test="position = 'Bottom left'"  >7</xsl:when>
							<xsl:when test="position = 'Bottom center'">8</xsl:when>
							<xsl:when test="position = 'Bottom right'" >9</xsl:when>
							<xsl:otherwise>5</xsl:otherwise>
						</xsl:choose>
						
						<xsl:text>/0</xsl:text>
						
						<xsl:value-of select="image/@path" />
						
						<xsl:text>/</xsl:text>
						
						<xsl:value-of select="image/filename" />
						
						<xsl:text>'); height: </xsl:text>
						
						<xsl:if test="string-length(height)">
							<xsl:value-of select="height" />
						</xsl:if>
						
						<xsl:text>px</xsl:text>
						
					</xsl:attribute>
					
					<div class="caption">
						<xsl:value-of select="caption" disable-output-escaping="yes" />
					</div>
				
				</div>
				
			</xsl:for-each>
		
		</div>
	
	</xsl:if>
	
</xsl:template>



<xsl:template name="component-locations">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //locations-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'locations'" />
			</xsl:call-template>
			
			<h3 class="header">Locations</h3>
			
			<xsl:for-each select="//locations-entries-by-tag/entry">
				
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<xsl:if test="string-length(longitude) and string-length(latitude)">
						
						<div class="map">
						
							<iframe class="google-map" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q={latitude},{longitude}&amp;aq=&amp;sll={latitude},{longitude}&amp;sspn=0.021183,0.032616&amp;vpsrc=0&amp;safe=on&amp;ie=UTF8&amp;t=m&amp;z=14&amp;ll={latitude},{longitude}&amp;output=embed"></iframe>
							
							<p><a target="_blank" href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q={latitude},{longitude}&amp;aq=&amp;sll={latitude},{longitude}&amp;sspn=0.021183,0.032616&amp;vpsrc=0&amp;safe=on&amp;ie=UTF8&amp;t=m&amp;z=14&amp;ll={latitude},{longitude}" style="color:#0000FF;text-align:left">View on Google »</a></p>
											
						</div>
						
					</xsl:if>
			
				</div>
			
			</xsl:for-each>
		
		</div>
		
	</xsl:if>
	
</xsl:template>



<xsl:template name="component-members">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //members-entries-by-tag/entry )">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'member'" />
			</xsl:call-template>
			
			<h3 class="header">Leader Contact</h3>
						
			<xsl:for-each select="//members-entries-by-tag/entry">
				
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<div class="image">
					
						<xsl:attribute name="style">
							
							<xsl:text>background-image: url('</xsl:text>
							<xsl:value-of select="$root" />
							
							<xsl:choose>
								<xsl:when test="$position = 'column-center'">
									<xsl:text>/image/2/129/151/2/0</xsl:text>
								</xsl:when>
								<xsl:when test="$position = 'column-right'">
									<xsl:text>/image/2/75/75/2/0</xsl:text>
								</xsl:when>
							</xsl:choose>
							
							<xsl:value-of select="photo/@path" />
							<xsl:text>/</xsl:text>
							<xsl:value-of select="photo/filename" />
							<xsl:text>');</xsl:text>
							
						</xsl:attribute>
						
						<div class="caption">
							<xsl:value-of select="first-name" disable-output-escaping="yes" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="last-name" disable-output-escaping="yes" />
						</div>
						
					</div>
					
					<div class="info">
						
						<h3 class="name">
							<xsl:value-of select="first-name" disable-output-escaping="yes" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="last-name" disable-output-escaping="yes" />
						</h3>
						
						<h4>
							<xsl:value-of select="job-title" disable-output-escaping="yes" />
						</h4>
						
						<xsl:choose>
							<xsl:when test="$position = 'column-center'">
								<xsl:value-of select="about" disable-output-escaping="yes" />
							</xsl:when>
							<xsl:when test="$position = 'column-right'">
								<p class="email">
									<a href="mailto:{email}">
										<xsl:value-of select="email" disable-output-escaping="yes" />
									</a>
								</p>
							</xsl:when>
						</xsl:choose>
						
					</div>
					
				</div>
				
			</xsl:for-each>
			
		</div>
	
	</xsl:if>
	
</xsl:template>



<xsl:template name="component-text">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //text-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'text'" />
			</xsl:call-template>
			
			<xsl:for-each select="//text-entries-by-tag/entry">
				
				<div>
					
					<xsl:call-template name="class-rows" />
			
					<xsl:value-of select="content" disable-output-escaping="yes" />
				
				</div>
			
			</xsl:for-each>
			
		</div>
	
	</xsl:if>
	
</xsl:template>



<xsl:template name="component-verses">
	
	<xsl:param name="position" />
	
	<xsl:if test="//verses-entries-by-tag/entry">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'verses'" />
			</xsl:call-template>
			
			<xsl:for-each select="//members-entries-by-tag/entry">
			
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<xsl:value-of select="//dynamic-xml-apibibliacom/text" />
					
					<span class="verse">
						<xsl:value-of select="//verses-entries-by-tag/entry/passage" />
					</span>
					
				</div>
			
			</xsl:for-each>
		
		</div>
			
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>