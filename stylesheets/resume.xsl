<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <style>
          /* http://meyerweb.com/eric/tools/css/reset/ 
             v2.0 | 20110126
             License: none (public domain)
          */

          html, body, div, span, applet, object, iframe,
          h1, h2, h3, h4, h5, h6, p, blockquote, pre,
          a, abbr, acronym, address, big, cite, code,
          del, dfn, em, img, ins, kbd, q, s, samp,
          small, strike, strong, sub, sup, tt, var,
          b, u, i, center,
          dl, dt, dd, ol, ul, li,
          fieldset, form, label, legend,
          table, caption, tbody, tfoot, thead, tr, th, td,
          article, aside, canvas, details, embed, 
          figure, figcaption, footer, header, hgroup, 
          menu, nav, output, ruby, section, summary,
          time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
          }
          /* HTML5 display-role reset for older browsers */
          article, aside, details, figcaption, figure, 
          footer, header, hgroup, menu, nav, section {
            display: block;
          }
          body {
            line-height: 1;
          }
          ol, ul {
            list-style: none;
          }
          blockquote, q {
            quotes: none;
          }
          blockquote:before, blockquote:after,
          q:before, q:after {
            content: '';
            content: none;
          }
          table {
            border-collapse: collapse;
            border-spacing: 0;
          }
        </style>
        <style>
          body {
            margin-top:2px;
            text-align: center;
            font-family: Helvetica;
            font-size: .8em;
          }

          body > div {
            text-align: left;
            margin: 0 auto;
            width: 650px;
          }

          img {
            float: right;
            vertical-align: bottom;
            height: 100px;
            width: 100px;
            margin: 10px;
            border: solid black .5px;
          }

          h1 {
              font-size: 1em;
          }

          #name {
            font-size: 1.50em;
          }

          .contact {
              margin: 2px;
          }

          .contact > h1 {
            display: inline;
          }

          section {
            margin: 7px;
            clear: all;
          }

          section > h1 {
            display: block;
            background: black;
            color: white;
            margin-left: -15px;
            padding: .15em;
          }

          header {
            margin-left: 10px;
          }

          section {
            margin-left: 25px;
          }

          section > * {
            margin: 5px;
          }

          #associations-awards > div {
              clear: both;
          }

          #associations-awards > div > * {
            display: block;
            margin-bottom: 2px;
          }

          #associations-awards > div > h1 {
              float: left;
          }

          #associations-awards > div > p {
              text-align: left;
              float: right;
          }

          .cert {
            margin-bottom: 10px;
          }

          .cert > div {
            border-bottom: 1px solid black;
          }

          .cert > div > h1 {
            width: 400px;
            display: inline-block;
          }

          .cert > p {
              text-align: left;
              margin-top: 2px;
            margin-left: 20px;
          }

          .contact h1 {
            width: 60px;
            display: inline-block;
          }

          .employer {
            margin-top : 5px;
            margin-bottom: 12px;
          }

          .employer > div {
              margin-bottom: 2px;
          }

          .employer > div:first-child {
            border-bottom: 1px solid black;
          }

          .employer > div:first-child > h1 {
            display: inline-block;
            width: 300px;
            margin-left: 0px;
          }

          .employer > div > h1 {
            display: inline-block;
            width: 50px;
            margin-left: 20px;
          }

          .employer > div > .date {
            display: inline-block;
            width: 100px;
          }

          .employer p {
            margin: 5px;
          }

          #skills {
            min-height: 5em;
          }

          .skill {
            width: 33%;
            float: left;
            display: inline-block;
          }
        </style>
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
      <xsl:apply-templates select="tasks" />
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

  <xsl:template match="tasks">
    <xsl:apply-templates select="task" />
  </xsl:template>

  <xsl:template match="task">
    <p>
      <xsl:value-of select="." />
    </p>
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