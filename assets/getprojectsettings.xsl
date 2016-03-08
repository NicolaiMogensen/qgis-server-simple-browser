<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

    xmlns:wms="http://www.opengis.net/wms"
    xmlns:sld="http://www.opengis.net/sld"
    xmlns:qgs="http://www.qgis.org/wms"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"

    xsi:schemaLocation="http://www.opengis.net/wms http://schemas.opengis.net/wms/1.3.0/capabilities_1_3_0.xsd
    http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/sld_capabilities.xsd
    http://www.qgis.org/wms http://qwc/cgi-bin/qgis_mapserv.fcgi?map=/home/ale/public_html/asti/QGIS-Web-Client/site/projects/asti/asti.qgs&amp;SERVICE=WMS&amp;REQUEST=GetSchemaExtension"

    >
    <xsl:output
        method="html"
        indent="yes"
        encoding="UTF-8"
    />


<xsl:template match="/wms:WMS_Capabilities">
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>QGIS Server Explorer</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .table > tbody > tr > td.level1 {
            padding-left: 1em;
        }
        .table > tbody > tr > td.level2 {
            padding-left: 2em;
        }
        .table > tbody > tr > td.level3 {
            padding-left: 3em;
        }
        .table > tbody > tr > td.level4 {
            padding-left: 4em;
        }
    </style>
  </head>
  <body>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <img width="32" height="32" title="QGIS LOGO" alt="QGIS LOGO" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAHuAAAB7gB8AiLBwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAdnSURBVFiFvZd7cFT1Fcc/v7u7N6/dJJuEGAIhMSh58EjlOQMUeU2RScVSWgu1HR3pFKQ8dKrCWGpbsIgMWB51ZKZFLAwMbcBKR4UWgTaNPAtiCilIEAjJbhKySTab3c3evff++sduniwS29oz8/vjnvP7nfM953fO+Z2LlJL/x7KvoxCIA0RPvpUvmdLfEF+XJpsVH1hgrgGXANkp/9IAZLwhnjJN1gnBQLOJNtmOF0jpu+9/DiBjm3hewksInEKA9KOZ7SQbASqBwH8FQAghAAsQDyREz4eBDiCU9nMySWERVpwAGEi9MWJD3qZSQPt/BCBqOGHD1kljCoqds53p8dMHZCYW6rph+trCzW534HJTQ+Dk8b/UHNq3u3pc2iYqUBkeriEMqAB6JScleOlx//0CIISwPLloRN6ipcW7huQ5JgKcPlHfvOSp4282NQXOrdv48LOlcyaWmrKt9OEZOS/rJUb5MfX6cMNFO2AHQKIbN3CZ4JVS9h+AEML6699NK50+Y/CO5BQ1HaDdF5arlp946+qVlt8ADYufPFx1+p+jynOHFKUbcW3qpbTGmdmtDvNmyGc3PRwTyRQIQbyI3L/sa0P5PM/3vDtrwZzHCg50GgfYvePy9atXWvYCNVJKv6Zx7Z39p9aYwKq/HceiK3hudygz8nNNymz7gruYIt1sAfyx7MQEIIQQ00oHZ40em7M5US20gOiSHTlU8z5QK6XUoyxt7U/K31l/Yq/5j/qbiCYruekpvP7ENOWnr074geElbJSx0QZuwOhvBNSXVk98LTN9TBqYXcy62nb9zIn6o/TIZimlTH2VpTurjirF5NLS3sGW78xAtVp4/IkHxj02L//bQbB0gAfQ+xqKCWDDtimjR44YvUCIOMwepXvuVGMrUA2EOnnOX4mvKnZeTPElhs9eq2bz408zKNUR8SLOIn64fMQqIJtoC74nACGEtaA4Y45qzVAATNldug31wSagXUppAohtIlnYOCyD6B5P0LZs6mymF45BEQldZ4aPTM9wpKrFRN6BewMA1JRk5wTEnSKfN9RKjzCmhTkjTBL0eiw20xJYMWNWVNLtqdWmiOkzcyZ9EQBxKakJD3Z+dOcatLaEWokmkvMX4rdSo0CvJoQJiWfVtUoUtJRaL4UFRc6H7gYgVh9QMwak39f5IYStyyGvV/MCZspyMc6SzEKjHr/USTLcbKqtCJRLEymVsJA9EhcgN9+e/0UiQNCvdyWZIrofMEeKGq8OI0WBMrORBtlCou6irON9dpZMSGtVFEX0zJkufQEDetbyPQBojQ1NtVH/sYjULkGqMy5NHcmbZht28yZJxm0qQh+wyQo1M2fd7wDQzfo7FDa4/R5i9ACIfQUdDY3uC4VF/kJF2BFCRRFJmLIdawIFk4flZHxlUJ4/KS5BTh1d7NRC+nPNza0f1da646TUMGQrfTvujett1wAthq2YALTW5uDJkHF5frxlJEKoWIQTU/p55JH7Myt+6WraevDvDq2ONfvzzzcsf2HaN+fO/dpWUAibN+8wXu/yGwfLrr9Hf1uxlNLY8NrZP9Xd8rSEjCtIGUZgAcDhsMnKyoYMo40teDlQ9XHT/oXfLXvB460KSTTM7v7URR8cvFGracZ5INgvAABXPmmt37fr05d1wys79AuEzVpAMijHLsYWZl/VajmQANc1Kb2ARzebjaB+DsP09IpAvctvbN968S2gvrN59QsAEHr91fP7Ko67yiUaskcL/9a8B+MEeH2RSagzbj1WlCPhldVnjrlq239PZBCJSTEBOMGSUELaivVH3R8eq+klmzJ9ULYjLS6X6KQT0SF7lZium2xYc67y3bLP1gI3pJQxK6AXACGEVRUiOWms+IY+mfesaVR1xIfnL1lxpHr1yo9kMKhLgIzMBOv2t6dtVVUKhBAD9hyc9YzdrnY1fy1k8PyPKiq2bbywBDgHaCJCluho14u6XihbnnAmZLNWqswTClkA0sct0UC2qXFt4ughexavGLl4WFFqpjMt3tLsCflCHbo3KztpcE+1rjq/Pr5w3wLgMJHMF/sPlxafqXAbG145Xy2lDMcEIISw2MBugt2SzkBlICXWFn4sFIpMnT/73XyPyIyXM3lq9oTxE7PG3JeVOMR1q10889yo8XaHzQLga9PMokG75wPlQMfTi4ryl7/40NtjC/Yu0XU+llIGYgLoxRTCFgeqLYulwsZ6M8x2fz3LiHQzK5GxPJ5IHmT8q+77Jx3J3ddw45qvNdgRdgmBljc0pbjBFeiYNOoPjwKnpZS9ajXmUBoNU9gqxM6EwTwrTaoBMzrRhqPLFwUb+Ky67VLJ6IyxnefzhjpSgVSAQEA3f7by1BHgJr0qJ0J3HUqJuOs1NXYpgk/uVseAb8f2iyurP21t7is4f6YxsGzhX//44aGatYA7lo6YV9AlFMJqUXnAmUzd7dvS9zn74oChsx/NnTt4iKOkxRMyqy56rlRdbD5F5GfU3Tf5+gtA2MHm6zthxN5rARKJvPsKkXAHgVDfn5Ge9G/BY5wKWO15tgAAAABJRU5ErkJggg==" />
                 QGIS Server Explorer</h1>
                 <h2><xsl:value-of select="//wms:Service/wms:Title"/></h2>
                 <p><xsl:value-of select="//wms:Service/wms:Abstract"/></p>
                    <div id="layers">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Title</th>
                                    <th>&#160;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:variable name="getmap" select="//wms:GetMap//wms:OnlineResource/@xlink:href" />
                                <xsl:apply-templates select="//wms:Capability">
                                    <xsl:with-param name="getmap" select="$getmap" />
                                </xsl:apply-templates>
                            </tbody>
                        </table>
                    </div>
            </div>
            <footer class="footer">
                <div class="container">
                &#169; 2016 - Alessandro Pasotti - <a href="http://www.itopen.it">ItOpen</a>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  </body>
</html>
</xsl:template>


<xsl:template match="//wms:Capability">
    <xsl:param name="getmap"/>
    <xsl:for-each select="//wms:Layer">
    <!--stick to 4326, inverted axis -->
    <xsl:variable name="CRS" select="wms:BoundingBox[@CRS='EPSG:4326']/@CRS" />
    <xsl:variable name="maxy" select="wms:BoundingBox[@CRS='EPSG:4326']/@maxx" />
    <xsl:variable name="maxx" select="wms:BoundingBox[@CRS='EPSG:4326']/@maxy" />
    <xsl:variable name="miny" select="wms:BoundingBox[@CRS='EPSG:4326']/@minx" />
    <xsl:variable name="minx" select="wms:BoundingBox[@CRS='EPSG:4326']/@miny" />
    <xsl:variable name="layers" select="wms:Name"/>
    <tr>
        <td class="level{count(ancestor::wms:Layer)}"><xsl:value-of select="$layers"/></td>
        <td><xsl:value-of select="wms:Title"/></td>
        <td><a target="_blank" href="{$getmap}&amp;BBOX={$minx},{$miny},{$maxx},{$maxy}&amp;CRS={$CRS}&amp;SERVICE=WMS&amp;REQUEST=GetMap&amp;FORMAT=application/openlayers&amp;LAYERS={$layers}" class="btn btn-default">View</a></td>
    </tr>
    </xsl:for-each>
</xsl:template>



</xsl:stylesheet>
