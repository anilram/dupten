<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no"
		indent="yes"></xsl:output>
    <xsl:template match="padagreement">
            <fo:root
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
                <fo:layout-master-set>
                    <fo:simple-page-master master-name="singlePage" margin="1cm">
                        <fo:region-body margin-top="1cm" margin-bottom="1cm"
							background-color="#FFFFFF" />
                        <fo:region-before extent="1cm" background-color="#FFFFFF" />
                        <fo:region-after extent="3cm" background-color="#FFFFFF"
							display-align="after" />
                    </fo:simple-page-master>
                    <fo:simple-page-master master-name="firstPage"
						margin="1cm">
                        <fo:region-body margin-top="0cm" margin-bottom="1cm"
							background-color="#FFFFFF" />
                        <fo:region-before extent="1cm" background-color="#FFFFFF" />
                        <fo:region-after extent="1cm" background-color="#FFFFFF"
							display-align="after" />
                    </fo:simple-page-master>
                    <fo:simple-page-master master-name="middlePage"
						margin="1cm">
                        <fo:region-body margin-top="2cm" margin-bottom="2cm"
							background-color="#FFFFFF" />
                        <fo:region-before extent="1cm" background-color="#FFFFFF" />
                        <fo:region-after extent="1cm" background-color="#FFFFFF"
							display-align="after" />
                    </fo:simple-page-master>
                    <fo:simple-page-master master-name="lastPage"
						margin="1cm">
                        <fo:region-body margin-top="2cm" margin-bottom="1cm"
							background-color="#FFFFFF" />
                        <fo:region-before extent="1cm" background-color="#FFFFFF" />
                        <fo:region-after extent="3cm" background-color="#FFFFFF"
							display-align="after" />
                    </fo:simple-page-master>
                    <fo:page-sequence-master master-name="allPages"> 
                        <fo:repeatable-page-master-alternatives>
                            <fo:conditional-page-master-reference
								page-position="only" master-reference="singlePage" />
                            <fo:conditional-page-master-reference
								page-position="first" master-reference="firstPage" />
                            <fo:conditional-page-master-reference
								page-position="rest" master-reference="middlePage" />
                            <fo:conditional-page-master-reference
								page-position="last" master-reference="lastPage" />
                        </fo:repeatable-page-master-alternatives>
                    </fo:page-sequence-master>
                </fo:layout-master-set>
               
                <!-- START :: page-sequence :: allPages -->
                <fo:page-sequence master-reference="allPages">
                    <fo:static-content flow-name="xsl-region-after"
						font-size="11pt">
                        <!-- START :: special footer -->
                        <fo:retrieve-marker retrieve-class-name="footer"
							retrieve-position="first-starting-within-page" />
                        <!-- END :: special footer -->
                        <!-- START :: common footer on every page -->
	                          <fo:block  text-align-last="relative" text-align="center">
                        			<fo:inline text-align="center"> Page <fo:inline font-weight='bold'> <fo:page-number/></fo:inline> of <fo:inline font-weight='bold'> <fo:page-number-citation ref-id="end"/> </fo:inline></fo:inline>
	                          </fo:block>
                    </fo:static-content>
                    <!-- END :: footer -->
                    <!-- START :: document body -->
                    <fo:flow flow-name="xsl-region-body" font-size="11pt" margin-left="1cm" margin-right="1cm">
                        <!-- START :: YOUR REAL CONTENT GOES HERE  -->
                        <fo:block intrusion-displace="block" padding-top="16mm" padding-bottom="15mm">
						   <fo:block absolute-position="absolute"  margin-left="140mm">
						   		<fo:external-graphic width="5in">
													<xsl:attribute name="src">
                                                        <xsl:value-of
														select="companylogo"></xsl:value-of>
                                                    </xsl:attribute>
												</fo:external-graphic>
						   </fo:block>
							   <fo:block-container absolute-position="absolute">
							       <fo:block padding-top="16mm">
							       <fo:block>William E. Coutts Company, Limited</fo:block>
									<fo:block>DBA Hallmark Canada</fo:block>
									<fo:block>Credit Department #316</fo:block>
									<fo:block>P.O. Box 419535</fo:block>
							       </fo:block>
							   </fo:block-container>
						</fo:block>
<!--                         <fo:block padding-bottom="8mm"> -->
<!-- 								 <fo:block>William E. Coutts Company, Limited</fo:block> -->
<!-- 								 <fo:block>DBA Hallmark Canada</fo:block> -->
<!-- 								 <fo:block>Credit Department #316</fo:block> -->
<!-- 								 <fo:block>P.O. Box 419535</fo:block> -->
<!-- 								 <fo:block>Kansas City MO 64141-6535</fo:block> -->
<!-- 						</fo:block> -->
						<fo:block padding-bottom="4mm">
								 <fo:block>
									<xsl:value-of select="paddetails/customer_name" />
								 </fo:block>
								 <fo:block>
 									<xsl:value-of select="paddetails/address" />
								 </fo:block>
								 <fo:block>
 									<xsl:value-of select="paddetails/city" />
								 </fo:block>
								 <fo:block>
 									<xsl:value-of select="paddetails/province" />
 									<fo:inline>
										,
								 	</fo:inline>
								 <fo:inline>
 									<xsl:value-of select="paddetails/postal_code" />
								 </fo:inline></fo:block>
						</fo:block>
						<fo:block padding-bottom="4mm">
								 <fo:block>
									Letter Date:<xsl:value-of select="paddetails/today_date" />
								 </fo:block>
								 <fo:block>
 									Payer Number:<xsl:value-of select="paddetails/account_customer_number" />
								 </fo:block>
						</fo:block>
						<fo:block padding-bottom="4mm">Madame, Monsieur,</fo:block>
						<fo:block padding-bottom="4mm" font-weight="bold" >Objet : Confirmation de débit préautorisé (DPA)</fo:block>
						<fo:block padding-bottom="4mm">La présente est une confirmation du changement de compte bancaire soumis sur le site de paiement et de présentation des factures électroniques (PPFÉ) de 3M aux fins de planification des paiements de facture. Ce compte bancaire ne sera débité qu’à la date de paiement de facture prévue que vous avez soumise sur le site Web de PPFÉ de 3M.</fo:block>
						<fo:block padding-bottom="4mm">
							Veuillez noter que le compte bancaire pourrait ne pas être accessible sur le site de PPFÉ de 3M pour une période d’un à trois jours suivant la date de soumission.
						</fo:block>
								<!-- list start -->
						<fo:list-block provisional-distance-between-starts="1.6cm" provisional-label-separation="1.6cm" padding-bottom="4mm">
						<fo:list-item>
						    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-family="Symbol">&#8226;</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="body-start()"><fo:block><fo:inline font-weight='bold'>Nom du client</fo:inline>:
						    	<fo:inline>
								<xsl:value-of select="paddetails/customer_name" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>						   
						 <fo:list-item>
						    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-family="Symbol">&#8226;</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="body-start()"><fo:block><fo:inline font-weight='bold'>Nom de la banque</fo:inline>:
						    	<fo:inline>
 								<xsl:value-of select="paddetails/financial_institition" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item>
						    	<fo:list-item-label start-indent = "2cm"  end-indent="label-end()"><fo:block font-family="Symbol">&#8226;</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="body-start()"><fo:block><fo:inline font-weight='bold'>Numéro de compte bancaire</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item>
						    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-family="Symbol">&#8226;</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="body-start()"><fo:block><fo:inline font-weight='bold'>Numéro d’acheminement</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_routing_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						     <fo:list-item>
						    	<fo:list-item-label start-indent = "2cm"  end-indent="label-end()"><fo:block font-family="Symbol">&#8226;</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="body-start()"><fo:block><fo:inline font-weight='bold'>Créé par</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/payment_start_date" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						</fo:list-block>
						
						<fo:block padding-bottom="4mm">
							Cordialement,
                        </fo:block>
                        <fo:block padding-bottom="4mm">
							3M
                        </fo:block>
                        <fo:block id="end">
                        </fo:block>
                    </fo:flow>
                </fo:page-sequence>
            </fo:root>
    </xsl:template>
</xsl:stylesheet>
