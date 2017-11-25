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
 							 To:
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
                   	<fo:block text-align="center" padding-bottom="4mm" >Re: Confirmation of Pre-Authorized Debit Agreement ("<fo:inline font-weight="bold">PAD Agreement</fo:inline>") Sign-up</fo:block>
					<fo:block padding-bottom="4mm">Thank you for signing up for Pre-Authorized Debits with EBSCO Canada LTD ("<fo:inline font-weight="bold">EBSCO</fo:inline>"). We have accepted your PAD Agreement and are writing to confirm the following details: </fo:block>
								<!-- list start -->
						<fo:list-block padding-bottom="4mm">
						<fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">1.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block> <fo:inline font-weight='bold'>Account Holder Name</fo:inline>:
						    	<fo:inline>
								<xsl:value-of select="paddetails/holder_name" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						</fo:list-item>							   
						 <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">2.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Financial Institution Name</fo:inline>:
						    	<fo:inline>
 								<xsl:value-of select="paddetails/financial_institution" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">3.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Financial Institution Number</fo:inline>:
						    	<fo:inline>
 								<xsl:value-of select="paddetails/financial_institution_number" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">4.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Transit Number</fo:inline>:
						    	<fo:inline>
 								<xsl:value-of select="paddetails/transit_number" />
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">5.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Account Number</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">6.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Amount of Payment</fo:inline>:
						    	<fo:inline>
 									Variable
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">7.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Frequency of Payment</fo:inline>:
						    	<fo:inline>
									Sporadic
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">8.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Payment Start Date</fo:inline>:
						    	<fo:inline>
 									The PAD Agreement is effective <xsl:value-of select="paddetails/confirmation_period" /> calendar days after the date of this confirmation.
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">9.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Type of Pre-Authorized Debit</fo:inline>:
						    	<fo:inline>Business PAD
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item>
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">10.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Statement with regard to Pre-notification</fo:inline>:
						    	<fo:inline>
 									You have agree to reduce the required confirmation period of the first PAD issued under the PAD Agreement to three calendar days. 
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						</fo:list-block>
						<fo:block padding-bottom="4mm">
							Your Payor's PAD Agreement may be cancelled provided notice is received <fo:inline font-weight='bold'>7 days</fo:inline> before the next scheduled PAD. If any of the above details are incorrect, please contact us immediately at <fo:inline font-weight='bold'>finance@EBSCO.com</fo:inline>. If the details are correct, you do not need to do anything further and your Pre-Authorized Debits will be processed and start on the Payment Start Date indicated above.
							</fo:block>
                        <fo:block padding-bottom="4mm" font-weight='bold'>
							EBSCO may assign at any time all or a portion of its rights and obligations under the PAD Agreement.   You may not assign the PAD Agreement or any of your rights or obligations under the PAD Agreement.  All of EBSCO's rights under the PAD Agreement shall enure to the benefit of its successors and assigns.
						 </fo:block>
                        <fo:block padding-bottom="4mm">
							You have certain recourse rights if any debit does not comply with these terms. For example, you have the right to receive a reimbursement for any PAD that is not authorized or is not consistent with this PAD Agreement. To obtain more information on your recourse rights, contact your financial institution or visit <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca</fo:basic-link>.
						</fo:block>
                        <fo:block padding-bottom="4mm">Thank you,  </fo:block>
                        <fo:block padding-bottom="4mm">EBSCO Canada LTD </fo:block>
                        <fo:block id="end">
                        </fo:block>
                        <fo:block page-break-after="always"></fo:block>
                       	<fo:block font-weight="bold" text-align="center" padding-bottom="4mm" text-decoration = "underline">BUSINESS PRE-AUTHORIZED DEBIT (“PAD") TERMS AND CONDITIONS</fo:block>
                        <fo:list-block padding-bottom="4mm">
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">1.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Authorization:</fo:inline> This business pre-authorized debit agreement ("<fo:inline font-weight='bold'>PAD Agreement</fo:inline>") is between you and <fo:inline font-weight='bold'>EBSCO Canada LTD</fo:inline> (also referred to as "<fo:inline font-weight='bold'>EBSCO</fo:inline>", "<fo:inline font-weight='bold'>we</fo:inline>" or "<fo:inline font-weight='bold'>us</fo:inline>"). You authorize EBSCO to make pre-authorized debits from the bank account that you identify from time to time (the "<fo:inline font-weight='bold'>Account</fo:inline>") with the financial institution that you designate to us on this HighRadius Website, https://www.highradius.com (the "<fo:inline font-weight='bold'>Website</fo:inline>") for the purpose of making the payment amount you specify from time to time on the "<fo:inline font-weight='bold'>Open Bills</fo:inline>" screen of the Website (the "<fo:inline font-weight='bold'>PAD Amount</fo:inline>").  You agree to notify us immediately if your Account information changes and this authorization will continue in respect of any new Account that you identify to us.	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>	
						
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">2.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>PAD Category:</fo:inline> This PAD Agreement is a "Business PAD", as such term is defined in the Canadian Payment Association Rule H1 ("<fo:inline font-weight='bold'>Rule H1</fo:inline>").
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">3.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Amount:</fo:inline> The PAD Amount will be variable based on the amount you specify from time to time on the https://www.highradius.com screen of the Website. If your financial institution returns a PAD because of insufficient funds, you agree that we may re-present, on a one-time basis only, the PAD within thirty (30) calendar days of the returned PAD date.  The amount re-presented will be the amount of the original PAD. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">4.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Frequency:</fo:inline> PADs will be sporadic based on the PAD Amount. This PAD Agreement authorizes "Sporadic PADs" within the meaning of Rule H1.  Accordingly, we are required to obtain due "Authorization" (within the meaning of Rule H1) from you in accordance with Rule H1 for each and every Sporadic PAD under this PAD Agreement prior to the PAD Amount being exchanged and cleared. Your use of the Website to process each PAD Amount (by clicking the <fo:inline font-weight='bold'> "Submit"</fo:inline> button) will constitute valid and due Authorization for each Sporadic PAD and will constitute delivery of your authorization to your financial institution to debit your Account for the PAD Amount. 	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">5.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight= 'bold'>Waiver of Pre-Notification and Confirmation:</fo:inline> Your use of the Website to process a PAD Amount determines when the PAD is processed and therefore you agree to waive any pre-notification of the PAD.  We mutually agree to reduce the required confirmation period of the first PAD issued under this PAD Agreement to three (3) calendar days.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">6.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
								<fo:block padding-bottom="4mm">
									<fo:inline font-weight='bold'>Your Right to Cancel the PAD:</fo:inline> Your authorization under this PAD Agreement will remain in effect until we have received notification from you of your cancellation of this PAD Agreement.  You may cancel your PAD Agreement at any time by providing at least seven (7) calendar days notice.
								</fo:block>
								<fo:block padding-bottom="4mm">
									To obtain a sample cancellation form or for more information on your right to cancel your PAD Agreement, you may contact your financial institution or visit <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca</fo:basic-link>.
								</fo:block>
								<fo:block>
									Cancelling the PAD Agreement does not terminate any of your duties or obligations that exist between you and us, including your obligation to pay the amounts outstanding from time to time on your account with us.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">7.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Recourse / Reimbursement:</fo:inline> You have certain recourse rights if any debit does not comply with this PAD Agreement. For example, you have the right to receive reimbursement for any debit that is not authorized or is not consistent with this PAD Agreement. To obtain more information on your recourse rights, contact your financial institution or visit <fo:basic-link external-destination="url('https://www.payments.ca')" color="blue" text-decoration="underline">www.payments.ca</fo:basic-link>.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">8.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Validation by Financial Institution:</fo:inline> You acknowledge your financial institution is not required to verify that the transaction is debited in accordance with the terms of this PAD Agreement. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">9.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Changes to Your Information:</fo:inline> It is your responsibility to ensure the information in the Website is accurate.  You agree to tell us right away of any change in your name, address or telephone numbers, and any change in your financial institution or Account information.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">10.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Delivery Authorization:</fo:inline> You acknowledge that delivery of this PAD Agreement to EBSCO Canada LTD constitutes delivery of it to us and by you to your financial institution.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">11.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Consent:</fo:inline> I represent that all persons whose signatures are required to sign on the Account have read this PAD Agreement. In addition, I represent, where applicable, that I have the authority to electronically agree to commit to this PAD Agreement and to add or change the Account on the Website and the password, security code or other signature equivalent and that such authorization(s) conforms with the requirements of Rule H1. 
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
									<fo:inline font-weight='bold'>Assignment and Enurement:</fo:inline> EBSCO may assign at any time all or a portion of its rights and obligations under this PAD Agreement.   You may not assign this PAD Agreement or any of your rights or obligations under this PAD Agreement.  All of EBSCO's rights under this PAD Agreement shall enure to the benefit of its successors and assigns.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">13.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block padding-bottom="4mm">
									<fo:inline font-weight='bold'>Contacting us:</fo:inline> For any questions about this PAD Agreement, you may contact us at the following address and phone number: 
								</fo:block>
								<fo:block>EBSCO Canada LTD</fo:block>
								<fo:block>110 Copper Creek Drive, Suite 305</fo:block>
								<fo:block white-space="pre">Markham ON  L6B 0P9</fo:block>
								<fo:block>Phone: 205.981.4676</fo:block>
								<fo:block>
									Email Address: <fo:basic-link external-destination="url('mailto:finance@ebsco.com')" color="blue" text-decoration="underline">finance@EBSCO.com </fo:basic-link>
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">14.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Governing Law:</fo:inline> This PAD Agreement will be governed by and interpreted in accordance with the applicable laws of the Province of Ontario and the federal laws applicable therein. You agree to submit to and be bound by these laws and the courts of the Province of Ontario in the event of any disputes arising in connection with this PAD Agreement. 	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">15.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
									<fo:inline font-weight='bold'>Disclosure:</fo:inline> You consent to the disclosure of any information that may be contained in this PAD Agreement or any PAD to the financial institution that holds the account of EBSCO to be credited with the PAD to the extent that such disclosure of information is directly related to and necessary for the proper application of Rule H1.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label end-indent="label-end()"><fo:block font-weight="bold">16.</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="1.6cm">
						    	<fo:block>
										<fo:inline font-weight='bold'>Applicable to the Province of Quebec only:</fo:inline> It is the express wish of the parties that this PAD Agreement and any related documents be drawn up and executed in English. Les parties souhaitent expressément que cet accord de débit préautorisé et tous les documents connexes soient rédigés et exécutés en anglais. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
												   
						</fo:list-block>
                    </fo:flow>
                </fo:page-sequence>
            </fo:root>
    </xsl:template>
</xsl:stylesheet>
