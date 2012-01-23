<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="teachings">
	
	<div class="teachings">
		
		<xsl:choose>
			<xsl:when test="$pt3 = 'date' and $pt4 = 'latest'">
				
				<xsl:call-template name="search-results">
					<xsl:with-param name="results" select="//teachings-all-entries-filtered" />
				</xsl:call-template>
				
			</xsl:when>
			<xsl:otherwise>	
			
				<xsl:call-template name="search-results">
					<xsl:with-param name="results" select="//teachings-all-entries-filtered" />
				</xsl:call-template>
				
			</xsl:otherwise>
		</xsl:choose>
		
		
		<h3>Filter</h3>
		
		<div class="section">
		
			<h4>Old Testament</h4>
			
			<p>
				<xsl:for-each select="//static-xml-books-of-the-bible/books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
					
					<a href="#">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</a>
					
					<xsl:if test="position() &lt; last()">, </xsl:if>
					
				</xsl:for-each>
			</p>
		</div>
		
		<div class="section">
		
			<h4>New Testament</h4>
			
			<p>
				<xsl:for-each select="//static-xml-books-of-the-bible/books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
					
					<a href="#">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</a>
					
					<xsl:if test="position() &lt; last()">, </xsl:if>
					
				</xsl:for-each>
			</p>
			
		</div>
		
	</div>

</xsl:template>



<xsl:template name="search-results">
	
	<xsl:param name="results" />
	
	<h3>Results</h3>
	
	<div class="search-results">
	
		<xsl:if test="$results/pagination/@total-entries = 0">
			No entries here, try <a href="{$root}/{$pt1}/{$pt2}/{$pt3}/1/{$pt5}/">page 1</a>.
		</xsl:if>
		
		<xsl:call-template name="element-page-navigation">
			<xsl:with-param name="results" select="$results" />
		</xsl:call-template>
		
		<xsl:for-each select="$results/entry">
	
			<div class="entry">
	
				<h5 class="title">
					<a href="#">
						<xsl:value-of select="msg-title" disable-output-escaping="yes" />
					</a>
				</h5>
				
				<div class="description">
					<xsl:value-of select="msg-description" disable-output-escaping="yes" />
				</div>
				
				<div class="details">
					
					<a href="">
						<xsl:value-of select="book" disable-output-escaping="yes" />
					</a>
					<xsl:text> </xsl:text>
					<xsl:value-of select="msg-chapter" disable-output-escaping="yes" />
						
					<xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
					
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="msg-date" />
						<xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
					</xsl:call-template>
					
					<xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
						
					<a href="http://66.147.244.244/~atheycre/teachings/{msg-number}.lq.mp3">Download MP3</a>
					
				</div>
				
			</div>
				
		</xsl:for-each>	
		
		<xsl:call-template name="element-page-navigation">
			<xsl:with-param name="results" select="$results" />
		</xsl:call-template>
		
	</div>

</xsl:template>



<xsl:template name="element-page-navigation">
	
	<xsl:param name="results" />
	
	<xsl:if test="$results/pagination/@total-entries > 0">
		
		<p>
			Showing 
			<xsl:value-of select="$pt5" disable-output-escaping="yes" /> 
			of 
			<xsl:value-of select="$results/pagination/@total-entries" disable-output-escaping="yes" /> 
			entries
		</p> 
		
		<div class="page-navigation clearfix">
		
			<xsl:call-template name="pagination">
			
				<xsl:with-param name="pagination" select="$results/pagination" />
				<xsl:with-param name="pagination-url" select="concat( $root, '/', $current-page, '/', $pt2, '/', $pt3, '/', '$', '/', $pt5 )" />
				<xsl:with-param name="show-range" select="5" />
				
				<xsl:with-param name="label-previous" select="'← Previous'" />
				<xsl:with-param name="label-next" select="'Next →'" />
				
				<xsl:with-param name="class-pagination" select="'pagination'" />
				<xsl:with-param name="class-page" select="''" />
				<xsl:with-param name="class-next" select="'next'" />
				<xsl:with-param name="class-previous" select="'prev'" />
				<xsl:with-param name="class-selected" select="'active'" />
				<xsl:with-param name="class-disabled" select="'disabled'" />
				<xsl:with-param name="class-ellipsis" select="'disabled'" />
				
			</xsl:call-template>
		
			
			<div class="number-to-display pagination">
				<ul>
					<li class="description disabled">
						<a href="">Show</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 5">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/5/">5</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 10">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/10/">10</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 25">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/25/">25</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 50">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/50/">50</a>
					</li>
					<li class="next">
						<xsl:if test="$pt5 = 100">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/100/">100</a>
					</li>
				</ul>
			</div>
		
		</div>
			
	</xsl:if>
	

	
<!--	<div class="pagination">
	  <ul>
	    <li class="prev disabled"><a href="#">← Previous</a></li>
	    <li class="active"><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li class="next"><a href="#">Next →</a></li>
	  </ul>
	</div>-->

</xsl:template>





</xsl:stylesheet>