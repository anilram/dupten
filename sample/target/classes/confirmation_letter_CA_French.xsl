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
                    	
                    	<fo:block font-weight="bold" text-align="center" padding-top="4mm" padding-bottom="4mm" >Form of Confirmation: Canadian PAD Agreement</fo:block>

                    	<fo:block text-align-last="justify">
 							 À:
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
								 <fo:inline padding-right= "1mm">
 									<xsl:value-of select="paddetails/postal_code" /> 
								 </fo:inline></fo:block>
						</fo:block>
                   	<fo:block text-align="center" padding-bottom="4mm" >Re:  Confirmation de l'accord de débit préautorisé (« <fo:inline font-weight="bold">accord DPA</fo:inline> ») — Inscription</fo:block>
					<fo:block padding-bottom="4mm">Nous vous remercions de vous être inscrit aux débits préautorisés auprès de EBSCO Canada Ltd («<fo:inline font-weight="bold">EBSCO</fo:inline>»). Nous avons accepté votre accord DPA et nous vous écrivons pour confirmer les détails suivants :</fo:block>
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
 								<xsl:value-of select="paddetails/transit_number" /> - <xsl:value-of select="paddetails/financial_institution_number" />
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
									Sporadique
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">7.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Date de début du paiement</fo:inline>:
						    	<fo:inline>
 									L'accord DPA est en vigueur <xsl:value-of select="paddetails/confirmation_period" /> jours après la date de cette confirmation.
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">8.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Type de débit preautorisé</fo:inline>:
						    	<fo:inline>DPA d'entreprise
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
							L'accord de DPA de votre payeur peut être annulé à condition que l'avis soit reçu 7 jours avant le prochain DAP prévu. Si l'un des détails ci-dessus est erroné, veuillez communiquer immédiatement avec nous à  <fo:inline font-weight='bold'>finance@EBSCO.com</fo:inline>.Si les détails sont corrects, vous n'avez pas besoin de faire quoi que ce soit de plus et vos débits préautorisés seront traités et débuteront à la date de paiement indiquée ci-dessus.
							</fo:block>
                        <fo:block padding-bottom="4mm" font-weight='bold'>
							EBSCO peut céder à tout moment la totalité ou une partie de ses droits et obligations en vertu du présent accord DPA.   Vous ne pouvez pas assigner le présent accord DPA ou l'un de vos droits ou obligations en vertu du présent accord DPA.  Tous les droits EBSCO en vertu du présent accord DPA s'appliqueront au bénéfice de ses successeurs et cessionnaires.
						 </fo:block>
                        <fo:block padding-bottom="4mm">
							Vous avez certains droits de recours si un débit n'est pas conforme aux présentes modalités. Par exemple, vous avez le droit de recevoir un remboursement pour tout DPA qui n'est pas autorisé ou qui n'est pas conforme au présent accord DPA. Pour obtenir plus de renseignements sur vos droits de recours, communiquez avec votre institution financière ou visitez <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca.</fo:basic-link>
						</fo:block>
                        <fo:block padding-bottom="4mm">Cordialement,  </fo:block>
                        <fo:block padding-bottom="4mm">EBSCO Canada LTD </fo:block>
                        <fo:block id="end">
                        </fo:block>
                        <fo:block page-break-after="always"></fo:block>
                       	<fo:block font-weight="bold" text-align="center" padding-bottom="4mm" text-decoration = "underline">CONDITIONS D'UTILISATION DE DÉBITS PRÉAUTORISÉS (« DPA ») D'ENTREPRISE</fo:block>
                        <fo:list-block padding-bottom="4mm">
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">1.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Autorisation :</fo:inline> Cette entente de débit préalable à l'entreprise (« <fo:inline font-weight='bold'>Accord DPA</fo:inline>») est entre vous et <fo:inline font-weight='bold'>EBSCO Canada LTD</fo:inline> (également «<fo:inline font-weight='bold'>EBSCO</fo:inline>», «<fo:inline font-weight='bold'>nous</fo:inline>» ou «<fo:inline font-weight='bold'>us</fo:inline> »). Vous autorisez EBSCO à effectuer des prélèvements préautorisés à partir du compte bancaire que vous identifiez de temps à autre (le « <fo:inline font-weight='bold'>Compte</fo:inline>») avec l'institution financière que vous nous indiquez sur le site Web HighRadius, https://www.highradius.com (le « <fo:inline font-weight='bold'>Website</fo:inline> »), dans le but d'effectuer un paiement du montant que vous indiquez de temps à autre à l'écran « <fo:inline font-weight='bold'>Open Bills</fo:inline> » du site Web (le «<fo:inline font-weight='bold'>montant DPA</fo:inline> »).  Vous acceptez de nous aviser immédiatement si vos informations de compte changent et que cette autorisation se poursuivra à l'égard de tout nouveau compte que vous nous identifiez.	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>	
						
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">2.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Catégorie DPA :</fo:inline> Cette entente DPA est un « DPA d'entreprise », tel qu'il est défini dans la Règle H1 de l'Association canadienne des paiements (« <fo:inline font-weight='bold'>Règle H1</fo:inline> »).
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">3.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Montant :</fo:inline> Le montant du DPA sera variable en fonction du montant que vous indiquez de temps à autre à l'écran https://www.highradius.com du site Web. Si votre institution financière renvoie un DPA en raison de fonds insuffisants, vous acceptez que nous représentions, sur une base unique, le DPA dans les trente (30) jours suivant la date du DPA retourné.  Le montant représenté sera le montant du DPA initial. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">4.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Fréquence :</fo:inline> Les DPA seront sporadiques en fonction du montant du DPA. Cette entente du DPA autorise les « DPA sporadiques » au sens de la Règle H1.  Par conséquent, nous sommes tenu d'obtenir une « autorisation » de votre part (au sens de la Règle H1) en vertu de la Règle H1 pour chaque DPA sporadique en vertu du présent accord DPA avant que le montant du DPA ne soit échangé et effacé. Votre utilisation du site Web pour traiter chaque montant DPA (en cliquant sur <fo:inline font-weight='bold'> "Soumettre"</fo:inline> ) constituera une autorisation valide et régulière pour chaque DPA sporadique et constituera la livraison de votre autorisation à votre institution financière de débiter votre compte pour le montant DPA.  	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">5.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight= 'bold'>Renonciation à la notification préalable et à la confirmation :</fo:inline> Votre utilisation du site Web pour traiter un montant DPA détermine le moment où le DPA est traité et vous renoncez donc à toute notification préalable de DPA.  Nous acceptons mutuellement de réduire la période de confirmation requise du premier DPA délivré en vertu du présent accord DPA à trois (3) jours civils. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">6.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
								<fo:block padding-bottom="4mm">
									<fo:inline font-weight='bold'>Votre droit d'annuler le DPA :</fo:inline> Votre autorisation en vertu de cet accord DPA restera en vigueur jusqu'à ce que nous ayons reçu la notification de l'annulation de votre part de cet accord DPA.  Vous pouvez résilier votre accord DPA à tout moment en fournissant un avis d'au moins sept (7) jours.
								</fo:block>
								<fo:block padding-bottom="4mm">
									Pour obtenir un formulaire d'annulation d'échantillon ou pour plus d'informations sur votre droit d'annuler votre accord DPA, vous pouvez communiquer avec votre institution financière ou consulter le site Web <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca.</fo:basic-link>
								</fo:block>
								<fo:block>
									L'annulation de l'accord DPA ne met fin à aucun de vos devoirs ou de vos obligations qui existent entre vous et nous, y compris votre obligation de payer les sommes dues de temps à autre sur votre compte avec nous. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">7.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Recours ou remboursement :</fo:inline> Vous avez certains droits de recours si un débit n'est pas conforme au présent accord DPA. Par exemple, vous avez le droit de recevoir un remboursement pour tout prélèvement qui n'est pas autorisé ou qui n'est pas conforme au présent accord DPA. Pour obtenir plus de renseignements sur vos droits de recours, communiquez avec votre institution financière ou visitez <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca</fo:basic-link>
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">8.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Validation par l'institution financière :</fo:inline> Vous reconnaissez que votre institution financière n'est pas tenue de vérifier que la transaction est débitée conformément aux termes du présent accord DPA.  
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">9.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Modifications apportées à votre information : </fo:inline> Il est de votre responsabilité de veiller à ce que l'information contenue dans le site Web soit exacte.  Vous acceptez de nous communiquer tout de suite tout changement à votre nom, à votre adresse ou à votre numéro de téléphone, ainsi que toute modification apportée à votre institution financière ou à votre compte. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">10.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Autorisation de livraison :</fo:inline> Vous reconnaissez que la livraison de cet accord PAD à EBSCO Canada LTD constitue la livraison de ce contrat à nous et par vous à votre institution financière.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">11.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Consentement :</fo:inline> Je déclare que toutes les personnes dont les signatures sont obligatoires pour le compte ont lu le présent accord DPA. En outre, je déclare, le cas échéant, que j'ai le pouvoir de signifier par voie électronique mon engagement au présent accord DPA et d'ajouter ou de modifier le compte sur le site Web et le mot de passe, le code de sécurité ou autre équivalent de signatures et que cette ou ces autorisations confirment ma conformité à la règle H1. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
<!--						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">13.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Consent:</fo:inline> I represent that all persons whose signatures are required to sign on the Account have read this PAD Agreement. In addition, I represent, where applicable, that I have the authority to electronically agree to commit to this PAD Agreement and to add or change the Account on the Website and the password, security code or other signature equivalent and that such authorization(s) confirms with the requirements of Rule H1. 
								</fo:block> 
					    	</fo:list-item-body >
						</fo:list-item> -->
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">12.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Assignation et application :</fo:inline> EBSCO peut céder à tout moment la totalité ou une partie de ses droits et obligations en vertu du présent accord DPA.   Vous ne pouvez pas assigner le présent accord DPA ou l'un de vos droits ou obligations en vertu du présent accord DPA.  Tous les droits EBSCO en vertu du présent accord DPA s'appliqueront au bénéfice de ses successeurs et cessionnaires.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">13.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block padding-bottom="4mm">
									<fo:inline font-weight='bold'>Communiquer avec nous :</fo:inline> Pour toute question concernant cet accord DPA, vous pouvez communiquer avec nous à l'adresse et au numéro de téléphone suivants : 
								</fo:block>
								<fo:block>EBSCO Canada LTD</fo:block>
								<fo:block>110 Copper Creek Drive, Suite 305</fo:block>
								<fo:block white-space="pre">Markham ON  L6B 0P9</fo:block>
								<fo:block>Téléphone: 205.981.4676</fo:block>
								<fo:block>
									Adresse électronique : <fo:basic-link external-destination="url('mailto:finance@ebsco.com')" color="blue" text-decoration="underline">finance@EBSCO.com </fo:basic-link>
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">14.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Droit applicable :</fo:inline>  Cet accord DPA sera régi et interprété conformément aux lois applicables de la province de l'Ontario et aux lois fédérales qui s'y appliquent. Vous acceptez de vous soumettre et d'être lié aux lois et aux tribunaux de la province de l'Ontario en cas de litiges découlant du présent accord DPA. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">15.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Divulgation :</fo:inline> Vous consentez à la divulgation de toute information qui peut être contenue dans cet accord DPA ou tout DPA à l'institution financière qui détient le compte de EBSCO à être crédité avec le DPA dans la mesure où cette divulgation de l'information est directement liée et nécessaire à la bonne application de la règle H1.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">16.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
										<fo:inline font-weight='bold'>Applicable à la province de Québec seulement :</fo:inline> Les parties souhaitent expressément que cet accord Pad et tous les documents connexes soient rédigés et exécutés en anglais. Les parties souhaitent expressément que cet accord Convention de prélèvement automatique et tous les documents connexes soient rédigés et exécutés en anglais.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
												   
						</fo:list-block>
                    </fo:flow>
                </fo:page-sequence>
            </fo:root>
    </xsl:template>
</xsl:stylesheet>