<?xml version="1.0"?>
<!--
	# Based on the generic RFDS to XHTML presentation conversion (0.2).

	# (c) 2003 Morten Frederiksen
	# License: http://www.gnu.org/licenses/gpl
-->
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:daml="http://www.daml.org/2001/03/daml+oil#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:owl="http://www.w3.org/2002/07/owl#"
        xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
        xmlns:dc="http://purl.org/dc/terms/"
        exclude-result-prefixes="daml rdf rdfs dc #default"
        version="1.0">
    <xsl:output
            method="html"
            indent="yes"
            omit-xml-declaration="yes"
            encoding="utf-8"/>

    <xsl:param name="embed" select="false()"/>
    <xsl:param name="language" select="'en'"/>

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="not($embed)">
                <html>
                    <head>
                        <title>RDF Schema</title>
                        <link rel="stylesheet" href="terms.css"/>
                        <link rel="stylesheet"
                              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                              crossorigin="anonymous"/>
                        <link rel="stylesheet"
                              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
                              integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
                              crossorigin="anonymous"/>
                        <meta name="viewport" content="width=device-width"/>
                        <style type="text/css">
                            <xsl:comment><![CDATA[
a.permalink { visibility: hidden; }
h3:hover > a.permalink { visibility: visible; }
p.meta { font-size: 80%; }
.schema h1+p { margin: 1em 0; }
table.schema { width: 100%; }
.schema h4 { margin: 0; }
.schema h3 { padding-top: 1em; }
.schema th { text-align: left; vertical-align: top; }
.schema td { vertical-align: top; }
.schema .details th { text-align: right; font-size: 80%; font-style: italic; vertical-align: top;}
.schema .details td { font-size: 80%; }
img { border: none; }
#toc {padding-top: 2em;}
div.navbar-brand: { padding-top: none !important; padding-left: none !important; }
div.navbar-nav > a { font-size: 1.7rem !important; }
				]]></xsl:comment>
                        </style>
                    </head>

                    <body class="site">
                        <header class="site-header">
                            <nav>
                                <div class="sticky-nav">
                                    <div class="container-nav">
                                        <div class="nav-container">
                                            <div class="navbar-brand">
                                                <a href="http://cldf.clld.org">
                                                    <img width="150"
                                                         src="http://cldf.clld.org/logos/logo_straight.png"
                                                         alt="CLDF"/>
                                                </a>
                                            </div>
                                            <div class="navbar-nav nav-mobile">
                                                <a class="nav-item nav-link btn btn-nav"
                                                   href="/">Home
                                                </a>
                                                <a class="nav-item nav-link btn btn-nav"
                                                   href="https://github.com/glottobank/cldf">
                                                    Specification
                                                </a>
                                                <a class="nav-item nav-link btn btn-nav"
                                                   href="v1.0/terms.rdf">Ontology
                                                </a>
                                                <a class="nav-item nav-link btn btn-nav"
                                                   href="https://github.com/glottobank/cldf/tree/master/examples">
                                                    Examples
                                                </a>
                                            </div>
                                            <div class="navbar-nav nav-main">
                                                <a class="nav-item nav-link active"
                                                   href="/">Home
                                                </a>
                                                <a href="https://github.com/glottobank/cldf"
                                                   class="nav-item nav-link">Specification
                                                </a>
                                                <a href="v1.0/terms.rdf"
                                                   class="nav-item nav-link">Ontology
                                                </a>
                                                <a class="nav-item nav-link"
                                                   href="https://github.com/glottobank/cldf/tree/master/examples">
                                                    Examples
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </header>
                        <main class="site-content">


                            <div class="container-fluid pad-top" id="top">
                                <div class="row-fluid">
                                    <div id="toc" class="col-md-2">
                                        <div data-spy="affix" data-offset-top="10"
                                             style="margin-top: 2em;" class="panel-group"
                                             id="accordion" role="tablist"
                                             aria-multiselectable="true">
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab"
                                                     id="headingOne">
                                                    <h4 class="panel-title">
                                                        <a role="button"
                                                           data-toggle="collapse"
                                                           data-parent="#accordion"
                                                           href="#collapseOne"
                                                           aria-expanded="true"
                                                           aria-controls="collapseOne">
                                                            Modules
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne"
                                                     class="panel-collapse collapse in"
                                                     role="tabpanel"
                                                     aria-labelledby="headingOne">
                                                    <div class="panel-body">
                                                        <ul class="list-unstyled">
                                                            <xsl:for-each
                                                                    select="//rdfs:Class[@dc:type='module']">
                                                                <li>
                                                                    <a href="#{substring-after(@rdf:about, '#')}">
                                                                        <xsl:value-of
                                                                                select="rdfs:label/text()"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab"
                                                     id="headingTwo">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" role="button"
                                                           data-toggle="collapse"
                                                           data-parent="#accordion"
                                                           href="#collapseTwo"
                                                           aria-expanded="false"
                                                           aria-controls="collapseTwo">
                                                            Components
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo"
                                                     class="panel-collapse collapse"
                                                     role="tabpanel"
                                                     aria-labelledby="headingTwo">
                                                    <div class="panel-body">
                                                        <ul class="list-unstyled">
                                                            <xsl:for-each
                                                                    select="//rdfs:Class[@dc:type='table']">
                                                                <li>
                                                                    <a href="#{substring-after(@rdf:about, '#')}">
                                                                        <xsl:value-of
                                                                                select="rdfs:label/text()"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab"
                                                     id="headingThree">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" role="button"
                                                           data-toggle="collapse"
                                                           data-parent="#accordion"
                                                           href="#collapseThree"
                                                           aria-expanded="false"
                                                           aria-controls="collapseThree">
                                                            Properties
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseThree"
                                                     class="panel-collapse collapse"
                                                     role="tabpanel"
                                                     aria-labelledby="headingThree">
                                                    <div class="panel-body">
                                                        <ul class="list-unstyled">
                                                            <xsl:for-each
                                                                    select="//rdf:Property[@dc:type!='reference-property']">
                                                                <li>
                                                                    <a href="#{substring-after(@rdf:about, '#')}">
                                                                        <xsl:value-of
                                                                                select="rdfs:label/text()"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab"
                                                     id="headingFour">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" role="button"
                                                           data-toggle="collapse"
                                                           data-parent="#accordion"
                                                           href="#collapseFour"
                                                           aria-expanded="false"
                                                           aria-controls="collapseFour">
                                                            Reference Properties
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseFour"
                                                     class="panel-collapse collapse"
                                                     role="tabpanel"
                                                     aria-labelledby="headingFour">
                                                    <div class="panel-body">
                                                        <ul class="list-unstyled">
                                                            <xsl:for-each
                                                                    select="//rdf:Property[@dc:type='reference-property']">
                                                                <li>
                                                                    <a href="#{substring-after(@rdf:about, '#')}">
                                                                        <xsl:value-of
                                                                                select="rdfs:label/text()"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <xsl:apply-templates select="//rdf:RDF[1]"/>
                                    </div>
                                </div>
                            </div>
                            <script src="javascripts/scale.fix.js"></script>
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
                                    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
                                    crossorigin="anonymous">
                            </script>
                        </main>
                        <footer class="site-footer">
                            <!-- expanded_footer -->

                            <div class="footer">
                                <div class="container flex-footer">
                                    <div class="f-links f-item">
                                        <h2>CLDF Specification</h2>
                                        <ul class="footer-links">
                                            <li>
                                                <a href="https://github.com/glottobank/cldf/zipball/master">
                                                    Download
                                                    <strong>ZIP File</strong>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="https://github.com/glottobank/cldf/tarball/master">
                                                    Download
                                                    <strong>TAR Ball</strong>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="https://github.com/glottobank/cldf">
                                                    View On
                                                    <strong>GitHub</strong>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="f-about f-item">
                                        <h2>About</h2>
                                        <p>
                                            CLDF is an initiative by the Glottobank
                                            consortium with support from the
                                            Max Planck Institute for the Science of Human
                                            History and the ERC project
                                            Computer-Assisted Language Comparison.
                                        </p>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 33%; text-align: left; padding-top: 10px;">
                                                    <a href="http://calc.digling.org"
                                                       style="border: none;">
                                                        <img src="http://cldf.clld.org/logos/European_Research_Council_logo.svg"
                                                             alt="erc-logo"
                                                             style="width:100px;"/>
                                                    </a>
                                                </td>
                                                <td style="width: 33%; text-align: center;">
                                                    <a href="http://glottobank.org"
                                                       style="border: none;">
                                                        <img src="http://cldf.clld.org/logos/glottobank.png"
                                                             alt="" style="width:100px;"/>
                                                    </a>
                                                </td>
                                                <td style="width: 33%; text-align: right; padding-top: 10px;">
                                                    <a href="http://www.shh.mpg.de/"
                                                       style="border: none;">
                                                        <img src="http://cldf.clld.org/logos/max-planck-logo.svg"
                                                             alt="mpi-logo"
                                                             style="width:100px;"/>
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="f-contact f-item">
                                        <!-- Contact Us -->
                                        <h2>Contact Info</h2>
                                        <span class="footer-address">Robert Forkel</span>
                                        <br/>
                                        <span class="footer-address"
                                              style="font-family: monospace">
                                            forkel@shh.mpg.de
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </body>
                </html>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="//rdf:RDF[1]"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="not(//rdf:RDF)">
            <xsl:message terminate="yes">RDF not found</xsl:message>
        </xsl:if>
    </xsl:template>

    <xsl:template match="rdf:RDF">
        <xsl:variable name="ns">
            <xsl:apply-templates mode="schema-namespace" select="owl:Ontology[1]"/>#
        </xsl:variable>
        <div class="schema">
            <xsl:apply-templates mode="schema-title" select="owl:Ontology"/>
        </div>
        <xsl:apply-templates mode="schema" select=".">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template mode="description" match="rdf:RDF/*">
        <xsl:apply-templates mode="schema-title" select="."/>
        <xsl:if test="dc:description|dc:abstract">
            <p>
                <xsl:apply-templates mode="value" select="dc:description|dc:abstract"/>
            </p>
        </xsl:if>
        <xsl:apply-templates mode="meta" select="*"/>
    </xsl:template>

    <xsl:template mode="schema-title" match="*">
        <h1>
            <xsl:choose>
                <xsl:when test="not(dc:title)">
                    <xsl:text>RDF Schema</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates mode="value" select="dc:title"/>
                </xsl:otherwise>
            </xsl:choose>
        </h1>
    </xsl:template>

    <xsl:template mode="meta" priority="0.9" match="dc:title|dc:description|dc:abstract"/>

    <xsl:template mode="meta" priority="0.1" match="*">
        <p class="meta">
            <em>
                <xsl:value-of select="local-name()"/>
                <xsl:value-of select="': '"/>
            </em>
            <xsl:apply-templates mode="meta"
                                 select="*|@rdf:resource|@resource|@rdf:value|@value|text()"/>
        </p>
    </xsl:template>

    <xsl:template mode="schema-namespace" match="*">
        <xsl:choose>
            <xsl:when
                    test="string-length(@rdf:about)!=0 and @rdf:about!='#' or string-length(@about)!=0 and @about!='#'">
                <xsl:value-of select="@rdf:about|@about"/>
            </xsl:when>
            <xsl:when test="string-length(@xml:base)!=0">
                <xsl:value-of select="@xml:base"/>
            </xsl:when>
            <xsl:when test="string-length(../@xml:base)!=0">
                <xsl:value-of select="../@xml:base"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'?'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template mode="schema" match="rdf:RDF">
        <xsl:param name="ns" select="'./'"/>
        <dl class="dl-horizontal">
            <dt>Namespace:</dt>
            <dd>
                <xsl:value-of select="$ns"/>
            </dd>
            <dt>Version info:</dt>
            <dd>
                <xsl:value-of select="owl:Ontology/owl:versionInfo/text()"/>
            </dd>
        </dl>
        <h2 id="modules">
            <xsl:text>Modules</xsl:text>
            <a href="#top" title="go to top of the page" style="vertical-align: bottom">
                &#x21eb;
            </a>
        </h2>
        <xsl:apply-templates mode="type" select="rdfs:Class[@dc:type='module']">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
        <h2 id="components">
            <xsl:text>Components</xsl:text>
            <a href="#top" title="go to top of the page" style="vertical-align: bottom">
                &#x21eb;
            </a>
        </h2>
        <xsl:apply-templates mode="type" select="rdfs:Class[@dc:type='table']">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
        <h2 id="properties">
            <xsl:text>Properties</xsl:text>
            <a href="#top" title="go to top of the page" style="vertical-align: bottom">
                &#x21eb;
            </a>
        </h2>
        <xsl:apply-templates mode="type"
                             select="rdf:Property[@dc:type!='reference-property']">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
        <h2 id="reference-properties">
            <xsl:text>Reference Properties</xsl:text>
            <a href="#top" title="go to top of the page" style="vertical-align: bottom">
                &#x21eb;
            </a>
        </h2>
        <xsl:apply-templates mode="type"
                             select="rdf:Property[@dc:type='reference-property']">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template mode="type" match="*">
        <xsl:param name="ns" select="'./'"/>
        <xsl:variable name="id">
            <xsl:value-of select="substring-after(@rdf:about,normalize-space($ns))"/>
        </xsl:variable>
        <div class="row"
             style="border-bottom: 1px dashed gray; margin-bottom: 10px; padding-bottom: 10px;">
            <div class="col-md-7">
                <h3 id="{$id}">
                    <xsl:choose>
                        <xsl:when test="rdfs:label|@rdfs:label">
                            <xsl:apply-templates mode="value"
                                                 select="rdfs:label|@rdfs:label"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$id"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <a href="#top" title="go to top of the page"
                       style="vertical-align: bottom">
                        &#x21eb;
                    </a>
                    <a class="permalink" href="#{substring-after(@rdf:about, '#')}"
                       title="Permalink to this headline">¶
                    </a>
                </h3>
                <h4>
                    <span class="label label-primary">
                        <xsl:value-of select="@rdf:about"/>
                    </span>
                </h4>
                <div>
                    <xsl:apply-templates mode="value"
                                         select="rdfs:comment|@rdfs:comment"/>
                </div>
            </div>
            <div class="col-md-5">
                <div class="well well-small"
                     style="margin-top: 10px; padding-bottom: 5px !important;">
                    <dl class="dl-horizontal">
                        <xsl:apply-templates mode="details" select="*">
                            <xsl:with-param name="ns" select="$ns"/>
                        </xsl:apply-templates>
                    </dl>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template mode="details" match="rdfs:label|rdfs:comment|rdf:type[
		@rdf:resource='http://www.w3.org/1999/02/22-rdf-syntax-ns#Property'
		or @resource='http://www.w3.org/1999/02/22-rdf-syntax-ns#Property'
		or @rdf:resource='http://www.daml.org/2001/03/daml+oil#Property'
		or @resource='http://www.daml.org/2001/03/daml+oil#Property'
		or @rdf:resource='http://www.daml.org/2001/03/daml+oil#Class'
		or @resource='http://www.daml.org/2001/03/daml+oil#Class'
		or @rdf:resource='http://www.w3.org/2000/01/rdf-schema#Class'
		or @resource='http://www.w3.org/2000/01/rdf-schema#Class']">
    </xsl:template>

    <xsl:template mode="details" match="*">
        <xsl:param name="ns" select="'./'"/>
        <dt>
            <a href="{namespace-uri()}{local-name()}">
                <xsl:value-of select="name()"/>
            </a>
            <xsl:value-of select="':'"/>
        </dt>
        <dd>
            <xsl:apply-templates mode="value" select=".">
                <xsl:with-param name="ns" select="$ns"/>
            </xsl:apply-templates>
        </dd>
    </xsl:template>

    <xsl:template mode="value" match="*[@rdf:resource|@resource]">
        <xsl:param name="ns" select="'./'"/>
        <xsl:if test="@rdf:resource and not(starts-with(@rdf:resource,$ns)) or @resource and not(starts-with(@resource,$ns))">
            <xsl:apply-templates mode="rdfs" select=".">
                <xsl:with-param name="ns" select="$ns"/>
            </xsl:apply-templates>
        </xsl:if>
        <xsl:variable name="res">
            <xsl:apply-templates mode="uri" select="@rdf:resource|@resource">
                <xsl:with-param name="ns" select="$ns"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:if test="local-name() = 'source'">
            <a href="{$res}">
                <xsl:value-of select="substring-after($res, '=')"/>
            </a>
        </xsl:if>
        <xsl:if test="local-name() != 'source'">
            <a href="{$res}">
                <xsl:value-of select="$res"/>
            </a>
        </xsl:if>
    </xsl:template>

    <xsl:template mode="value" match="@*">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template mode="value" match="*">
        <xsl:variable name="nsname" select="concat(namespace-uri(),local-name())"/>
        <xsl:choose>
            <xsl:when test="@rdf:parseType = 'Literal'">
                <xsl:copy-of select="./*"/>
            </xsl:when>
            <xsl:when test="count(../*[concat(namespace-uri(),local-name())=$nsname])=1">
                <xsl:value-of select=".|@rdf:value|@value"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select=".|@rdf:value|@value"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template mode="rdfs" match="*">
        <xsl:param name="ns" select="'./'"/>
        <a>
            <xsl:attribute name="href">
                <xsl:call-template name="ampify">
                    <xsl:with-param name="text">
                        <xsl:apply-templates mode="rdfs-uri" select=".">
                            <xsl:with-param name="ns" select="$ns"/>
                        </xsl:apply-templates>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:attribute>
        </a>
        <xsl:value-of select="' '"/>
    </xsl:template>

    <xsl:template mode="rdfs-uri"
                  match="rdfs:subPropertyOf[@rdf:resource or @resource]|rdfs:subClassOf[@rdf:resource or @resource]|rdfs:domain[@rdf:resource or @resource]|rdfs:range[@rdf:resource or @resource]">
        <xsl:param name="ns" select="'./'"/>
        <xsl:apply-templates mode="rdfs-uri-split" select="@rdf:resource|@resource">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template mode="rdfs-uri" match="*">
        <xsl:param name="ns" select="'./'"/>
        <xsl:apply-templates mode="uri" select="@rdf:resource|@resource">
            <xsl:with-param name="ns" select="$ns"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template mode="rdfs-uri-split" match="@*">
        <xsl:param name="ns" select="'./'"/>
        <xsl:choose>
            <xsl:when test="starts-with(.,'#')">
                <xsl:value-of select="concat($ns,.)"/>
            </xsl:when>
            <xsl:when test="contains(.,'#')">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="basepath">
                    <xsl:call-template name="basepath">
                        <xsl:with-param name="path" select="."/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$basepath"/>
                <xsl:value-of select="'#'"/>
                <xsl:value-of select="substring-after(.,$basepath)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template mode="uri" match="@*">
        <xsl:param name="ns" select="'./'"/>
        <xsl:choose>
            <xsl:when test="starts-with(.,'http:')">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="starts-with(.,'.')">
                <xsl:call-template name="basepath">
                    <xsl:with-param name="path" select="$ns"/>
                </xsl:call-template>
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ns"/>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="basepath">
        <xsl:param name="path" select="''"/>
        <xsl:choose>
            <xsl:when test="contains($path,'/')">
                <xsl:value-of select="substring-before($path,'/')"/>
                <xsl:value-of select="'/'"/>
                <xsl:call-template name="basepath">
                    <xsl:with-param name="path" select="substring-after($path,'/')"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="ampify">
        <xsl:param name="text" select="''"/>
        <xsl:choose>
            <xsl:when test="contains($text,'&amp;')">
                <xsl:call-template name="plusify">
                    <xsl:with-param name="text" select="substring-before($text,'&amp;')"/>
                </xsl:call-template>
                <xsl:value-of select="'%26'"/>
                <xsl:call-template name="ampify">
                    <xsl:with-param name="text" select="substring-after($text,'&amp;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="plusify">
                    <xsl:with-param name="text" select="$text"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="plusify">
        <xsl:param name="text" select="''"/>
        <xsl:choose>
            <xsl:when test="contains($text,'+')">
                <xsl:value-of select="substring-before($text,'+')"/>
                <xsl:value-of select="'%2B'"/>
                <xsl:call-template name="plusify">
                    <xsl:with-param name="text" select="substring-after($text,'+')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
