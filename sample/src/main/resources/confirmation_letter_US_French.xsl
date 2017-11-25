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
                <fo:page-sequence master-reference="allPages" >
                	 <fo:static-content flow-name="xsl-region-before"
						font-size="11pt">
                        <!-- START :: special footer -->
                        <fo:retrieve-marker retrieve-class-name="header"
							retrieve-position="first-starting-within-page" />
                        <!-- END :: special footer -->
                        <!-- START :: common footer on every page -->
	                          <fo:block  text-align-last="relative" text-align="center">
                        			<fo:inline text-align="center"> - <fo:inline > <fo:page-number/></fo:inline> -</fo:inline>
	                          </fo:block>
                	 </fo:static-content>
                    <fo:flow flow-name="xsl-region-body" font-size="11pt" margin-left="1cm" margin-right="1cm">
                    	
                    	<fo:block font-weight="bold" text-align="center" padding-top="4mm" padding-bottom="4mm" >Formulaire de confirmation : Accord DPA</fo:block>

                    	<fo:block text-align-last="justify">
 							 À :
  						<fo:leader leader-pattern="space" />
 							 Date: 	<xsl:value-of select="paddetails/today_date" />

						</fo:block>
                        <!-- START :: YOUR REAL CONTENT GOES HERE  -->
<!--                         <fo:block padding-bottom="8mm"> -->
<!-- 								 <fo:block>William E. Coutts Company, Limited</fo:block> -->
<!-- 								 <fo:block>DBA Hallmark Canada</fo:block> -->
<!-- 								 <fo:block>Credit Department #316</fo:block> -->
<!-- 								 <fo:block>P.O. Box 419535</fo:block> -->
<!-- 								 <fo:block>Kansas City MO 64141-6535</fo:block> -->
<!-- 						</fo:block> -->
						<fo:block padding-bottom="4mm">
								 <fo:block >
									<xsl:value-of select="paddetails/customer_name" />
								 </fo:block>
								 <fo:block>
 									<xsl:value-of select="paddetails/address" />
								 </fo:block>
								 <fo:block>
								 <fo:inline padding-right = "1mm">
 									<xsl:value-of select="paddetails/city" />
 								</fo:inline>
								 <fo:inline padding-right = "1mm">
 									<xsl:value-of select="paddetails/province" /> 
 								 </fo:inline>	
								 <fo:inline padding-right = "1mm">
 									<xsl:value-of select="paddetails/postal_code" />
								 </fo:inline></fo:block>
						</fo:block>
                   	<fo:block text-align="center" padding-bottom="4mm" >Re:  Confirmation de l'accord de débit préautorisé (« <fo:inline font-weight="bold">accord DPA</fo:inline> ») — Inscription</fo:block>
					<fo:block padding-bottom="4mm">Nous vous remercions de vous être inscrit aux débits préautorisés auprès de EBSCO Canada Ltd («<fo:inline font-weight="bold">EBSCO</fo:inline>»). Nous avons accepté votre accord DPA et nous vous écrivons pour confirmer les détails suivants :  </fo:block>
								<!-- list start -->
						<fo:list-block padding-bottom="4mm">
						<fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">1.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block> <fo:inline font-weight='bold'>Nom du compte</fo:inline>:
						    	<fo:inline>
								<xsl:value-of select="paddetails/holder_name" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						</fo:list-item>							   
						 <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">2.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Nom de l'institution financière</fo:inline>:
						    	<fo:inline>
 								<xsl:value-of select="paddetails/financial_institution" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">3.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Numéro d'acheminement de l'institution financière</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_routing_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">4.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Numéro de compte</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">5.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Montant du paiement</fo:inline>:
						    	<fo:inline>
 									Variable
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">6.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Fréquence de paiement</fo:inline>:
						    	<fo:inline>
									Sporadic
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">7.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Date de début du paiement</fo:inline>:
						    	<fo:inline>
						    	 	 L'accord DPA est en vigueur <xsl:value-of select="paddetails/confirmation_period" />  jours après la date de cette confirmation.
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">8.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Type de débit preautorisé</fo:inline>:
						    	<fo:inline>
									DPA d'entreprise
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item>
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">9.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Déclaration concernant la notification préalable</fo:inline>:
						    	<fo:inline>
 								Vous acceptez de réduire la période de confirmation requise du premier DPA délivré en vertu du présent accord DPA à trois (3) jours. 
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						</fo:list-block>
						<fo:block padding-bottom="4mm">
							L'accord de DPA de votre payeur peut être annulé à condition que l'avis soit reçu 7 jours avant le prochain DAP prévu. Si l'un des détails ci-dessus est erroné, veuillez communiquer immédiatement avec nous à  <fo:inline font-weight='bold'>finance@EBSCO.com</fo:inline>. Si les détails sont corrects, vous n'avez pas besoin de faire quoi que ce soit de plus et vos débits préautorisés seront traités et débuteront à la date de paiement indiquée ci-dessus.  </fo:block>
                        <fo:block padding-bottom="4mm" font-weight='bold'>
							EBSCO peut céder à tout moment la totalité ou une partie de ses droits et obligations en vertu du présent accord DPA.   Vous ne pouvez pas assigner le présent accord DPA ou l'un de vos droits ou obligations en vertu du présent accord DPA.  Tous les droits EBSCO en vertu du présent accord DPA s'appliqueront au bénéfice de ses successeurs et cessionnaires.
                        </fo:block>
                        <fo:block padding-bottom="4mm">
							Vous avez certains droits de recours si un débit n'est pas conforme aux présentes modalités. Par exemple, vous avez le droit de recevoir un remboursement pour tout DPA qui n'est pas autorisé ou qui n'est pas conforme au présent accord DPA. Pour obtenir plus de renseignements sur vos droits de recours, communiquez avec votre institution financière ou visitez <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca.</fo:basic-link>
						</fo:block>
                        <fo:block>Cordialement,  </fo:block>
                        <fo:block padding-bottom="4mm">EBSCO Industries, Inc. </fo:block>
                        <fo:block id="end">
                        </fo:block>
                        <fo:block page-break-after="always"></fo:block>
                       	<fo:block font-weight="bold" text-align="center" padding-bottom="4mm" >Conditions générales Automated Clearing House (« Accord ACH »)</fo:block>
                        <fo:block padding-bottom="4mm">
                       		En tant qu'entité juridique qui cherchez à effectuer le paiement (« vous » ou « votre ») à EBSCO industries, Inc. («EBSCO»), vous reconnaissez et acceptez que vous n'êtes pas tenu de payer EBSCO en effectuant un paiement par Internet, service qui est fourni par HighRadius Corporation (« HighRadius »), un fournisseur de services tiers.  En utilisant cette option de paiement, vous acceptez d'être lié par les conditions indiquées ci-dessous. 
                        </fo:block>
                        <fo:list-block padding-bottom="4mm" provisional-distance-between-starts="1.6cm" provisional-label-separation="1.6cm">
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">1)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									Vous autorisez expressément HighRadius à utiliser l'établissement financier et le numéro de compte fournis dans la présente pour effectuer un transfert ACH dans le seul but de transmettre le paiement à EBSCO.  En tant que tel, HighRadius utilisera uniquement les renseignements fournis dans la présente.  Ni HighRadius ni EBSCO ne sont responsables de toute perte qui peut survenir en raison d'une erreur ou d'une fraude liée à ces informations.  Vous serez cependant responsable de toute perte qui peut survenir en raison du recours par HighRadius ou EBSCO aux renseignements fournis dans le présent document.    
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>	
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">2)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									Tous les paiements continueront d'être régis par les modalités du ou des accords de EBSCO avec vous.  Cet accord ne diminuera pas les droits et obligations respectifs de ces accords entre EBSCO et vous, mais pourra les élargir.  Par souci de clarté, EBSCO maintient expressément toutes ses prérogatives conformément au droit ou à son équité à l'égard de cette transaction.    
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">3)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									EBSCO est responsable de la réception du paiement une fois son institution financière en contrôle de la transaction.  Avant cela, vous portez tous les risques en utilisant ce mode de paiement et EBSCO n'aura aucune responsabilité que ce soit.  
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">4)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									Vous déclarez et acceptez qu'il peut découler une période de six (6) jours avant que ne soit effectuée votre première transaction de paiement pour configurer l'option de paiement Internet avec votre banque.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">5)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
					    	<fo:block>
									Vous déclarez et garantissez que vous êtes autorisé à effectuer des paiements et à exécuter des retraits de l'établissement financier et du numéro de compte indiqués dans le présent document.  Vous déclarez et garantissez que vous disposez de fonds suffisants dans votre compte bancaire pour effectuer la transaction mentionnée dans le présent document.  Vous déclarez et garantissez que vous êtes une entité basée aux États-Unis.  Si votre institution financière renvoie votre paiement en tant que sans provision, vous déclarez et acceptez que vous payerez tous les frais applicables en sus du montant initial dû. 
							</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">6)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">

								<fo:block padding-bottom="4mm">
										Vous déclarez et acceptez que vous effectuerez votre paiement un (1)   ou plusieurs jours avant la date que vous avez choisie pour que la ou les transactions soient validées sur votre compte dans le but de fournir à EBSCO suffisamment de temps pour traiter votre demande.  
								</fo:block>

					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">7)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									EBSCO peut céder à tout moment la totalité ou une partie de ses droits et obligations en vertu du présent accord ACH.  Vous ne pouvez pas céder le présent accord ACH ou vos droits ou obligations en vertu de l'accord ACH.  Tous les droits de EBSCO en vertu du présent accord ACH veillent au bénéfice de ses successeurs et cessionnaires.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">8)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									VOUS DÉCLAREZ ET ACCEPTEZ QUE LA SÉCURITÉ ET LA CONFIDENTIALITÉ DES DONNÉES QUE VOUS FOURNISSEZ ICI SONT GÉRÉES ET ENTRETENUES UNIQUEMENT PAR HIGHRADIUS CORPORATION.  VOUS RENONCEZ EXPRESSÉMENT À VOTRE DROIT À TOUTE RÉCLAMATION PAR EBSCO CONCERNANT LA SÉCURITÉ DE VOS DONNÉES ET VOTRE CONFIDENTIALITÉ EN LIEN AVEC VOTRE UTILISATION DE CETTE OPTION DE PAIEMENT INTERNET.  SI VOUS SOUHAITEZ EN SAVOIR DAVANTAGE SUR LES PRATIQUES DE CONFIDENTIALITÉ ET DE SÉCURISATION DES DONNÉES DE HIGHRADIUS, VEUILLEZ CONSULTER <fo:basic-link external-destination="url('WWW.HIGHRADIUS.COM')" color="blue" text-decoration="underline">WWW.HIGHRADIUS.COM</fo:basic-link>
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">9)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									<fo:inline text-decoration='underline'>AVERTISSEMENT SUR LES PRÉCAUTIONS DE SÉCURITÉ : </fo:inline> AUCUNE DONNÉE TRANSMISE PAR INTERNET NE PEUT ÊTRE PROTÉGÉE DANS SON INTÉGRALITÉ. EN CONSÉQUENCE, MALGRÉ NOS EFFORTS POUR PROTÉGER LES RENSEIGNEMENTS DE VOTRE ENTREPRISE, EBSCO NE PEUT GARANTIR OU ASSURER LA SÉCURITÉ DE TOUT RENSEIGNEMENT QUE VOUS TRANSMETTEZ À HIGHRADIUS, OU À PARTIR DES SERVICES EN LIGNE DE HIGHRADIUS ET, PAR CONSÉQUENT, VOUS NOUS TRANSMETTEZ TOUS CES RENSEIGNEMENTS À VOS RISQUES ET PÉRILS.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						</fo:list-block>
                    </fo:flow>
                </fo:page-sequence>
            </fo:root>
    </xsl:template>
</xsl:stylesheet>