<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:import href="../utilities/master.xsl"/>


<xsl:template match="data">
	
	
	<h1>Welcome</h1>

	<xsl:choose>
		<xsl:when test="$member-is-logged-in">
		
			<p>You are logged in. (<a href="?member-action=logout&amp;redirect={$current-url}">Logout</a>)</p>
		
		</xsl:when>
		<xsl:otherwise>
		
			<form method="post" autocomplete="off" action="">
			
				<fieldset>
				
					<legend>Login to <xsl:value-of select="$website-name" /></legend>
					
					<div class="clearfix">
						<label for="login-email">Email</label>
						<div class="input">
							<input class="xlarge login-email" id="login-email" name="fields[email]" type="text" />
							<span class="help-block">
								Don’t have an account? <a href="{$root}/member/new/">Register now »</a>
							</span>
						</div>
					</div>
					
					<div class="clearfix">
						<label for="login-password">Password</label>
						<div class="input">
							<input class="xlarge login-password" id="login-password" name="fields[password]" type="password" />
							<span class="help-block">
								<a href="{$root}/member/forgot-password/">Forgot password?</a>
							</span>
						</div>
					</div>
					
					<div class="actions">
						<input type="submit" class="btn primary large" name="member-action[login]" value="Login" />
					</div>
					
				</fieldset>
				
			</form>
			
		</xsl:otherwise>
	</xsl:choose>
	       

</xsl:template>





</xsl:stylesheet>