<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="stylesheets/reset.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/resume.css" />
      </head>
      <body>
        <div>
          <xsl:apply-templates select="resume" />
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="resume">
      <xsl:apply-templates select="person" />
      <xsl:apply-templates select="skills" />
      <xsl:apply-templates select="education" />
      <xsl:apply-templates select="employers" />
      <section id="associations-awards">
        <h1>Associations and Awards</h1>
        <xsl:apply-templates select="associations" />
        <xsl:apply-templates select="awards" />
      </section>
  </xsl:template>
  
  <xsl:template match="person">
    <header role="banner" id="contact">
      <xsl:apply-templates select="qr" />
      <xsl:apply-templates select="name" />
      <xsl:apply-templates select="address" />
      <xsl:apply-templates select="contact" />
    </header>
    <section id="info">
      <xsl:apply-templates select="objective" />
      <xsl:apply-templates select="bio" />
    </section>
  </xsl:template>

  <xsl:template match="qr">
    <img>
      <xsl:attribute name="src">
        <xsl:value-of select="concat('http://',.,'.qrcode')" />
      </xsl:attribute>
    </img>
  </xsl:template>
  
  <xsl:template match="name">
    <div id="name">
      <xsl:value-of select="concat(firstName, ' ')" />
      <xsl:if test="middleInitial != ''">
        <xsl:value-of select="concat(middleInitial, ' ')" />
      </xsl:if>
      <xsl:value-of select="lastName" />
    </div>
  </xsl:template>
  
  <xsl:template match="address">
    <div>
      <xsl:apply-templates select="street" /><br />
      <xsl:value-of select="concat(city,', ',state,' ',zip)" />
    </div>
  </xsl:template>
  
  <xsl:template match="contact">
    <div class="contact">
      <h1><xsl:value-of select="@type" />: </h1> <xsl:value-of select="." />
    </div>
  </xsl:template>
  
  <xsl:template match="objective">
    <h1>
      <xsl:value-of select="." />
    </h1>
  </xsl:template>

  <xsl:template match="bio">
    <p>
      <xsl:value-of select="." />
    </p>  
  </xsl:template>
  
  <xsl:template match="employers">
    <section id="employers">
      <h1>Previous Work Experience</h1>
      <xsl:apply-templates select="employer" />
    </section>
  </xsl:template>

  <xsl:template match="skills">
    <section id="skills">
      <h1>Technical Skills</h1>
      <ul>
        <xsl:apply-templates select="skill" />
      </ul>
    </section>
  </xsl:template>
  
  <xsl:template match="skill">
    <li class="skill"><xsl:value-of select="." /></li>
  </xsl:template>
  
  <xsl:template match="employer">
    <div class="employer">
      <div><h1><xsl:value-of select="concat(name,':  ')" /></h1> <xsl:value-of select="position" /></div>
      <div>
        <xsl:choose>
          <xsl:when test="end">
            <h1>From: </h1> 
          </xsl:when>
          <xsl:otherwise>
            <h1>Since: </h1>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="start" />
        <xsl:if test="end"> 
          <h1>To: </h1> 
          <xsl:apply-templates select="end" />
        </xsl:if>
      </div>
      <p>
        <xsl:value-of select="task" />
      </p>
    </div>
  </xsl:template>
  
  <xsl:template match="start">
    <xsl:apply-templates select="date" />
  </xsl:template>
  
  <xsl:template match="end">
    <xsl:apply-templates select="date" />
  </xsl:template>
  
  <xsl:template match="date">
    <div class="date"><xsl:value-of select="month" /> - <xsl:value-of select="year" /></div>
  </xsl:template>
  
  <xsl:template match="education">
    <section id="education">
      <h1>Education</h1>
      <xsl:apply-templates select="location" />
      <xsl:apply-templates select="goals" />
    </section>
  </xsl:template>
  
  <xsl:template match="location">
    <div id="location">
      <xsl:value-of select="school" />
      <xsl:apply-templates select="address" />
    </div>
  </xsl:template>
  
  <xsl:template match="goals">
    <div id="goals">
      <xsl:apply-templates select="cert" />
    </div>
  </xsl:template>
  
  <xsl:template match="cert">
    <div class="cert">
      <div>
        <h1><xsl:value-of select="@name" /></h1><xsl:value-of select="@date" />
      </div>
      <p>
        <xsl:value-of select="description" />
      </p>
    </div>
  </xsl:template>
  
  <xsl:template match="associations">
    <xsl:apply-templates select="association" />
  </xsl:template>
  
  <xsl:template match="association">
    <div><h1><xsl:value-of select="name" />: </h1> <p><xsl:value-of select="description" /></p></div>
  </xsl:template>
  
  <xsl:template match="awards">
    <xsl:apply-templates select="award" />
  </xsl:template>
  
  <xsl:template match="award">
    <div><h1><xsl:value-of select="name" />: </h1> <p><xsl:value-of select="description" /></p></div>
  </xsl:template>
  
</xsl:stylesheet>