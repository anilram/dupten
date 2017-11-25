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
                    	
                    	<fo:block font-weight="bold" text-align="center" padding-top="4mm" padding-bottom="4mm" >Form of Confirmation: PAD Agreement</fo:block>

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
								 <fo:inline padding-right = "1mm">
 									<xsl:value-of select="paddetails/postal_code" />
								 </fo:inline></fo:block>
						</fo:block>
                   	<fo:block text-align="center" padding-bottom="4mm" >Re: Confirmation of Pre-Authorized Debit Agreement ("<fo:inline font-weight="bold">PAD Agreement</fo:inline>") Sign-up</fo:block>
					<fo:block padding-bottom="4mm">Thank you for signing up for Pre-Authorized Debits with Ebsco Industries, Inc. ("<fo:inline font-weight="bold">EBSCO</fo:inline>") We have accepted your PAD Agreement and are writing to confirm the following details: </fo:block>
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
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Financial Institution 	Routing Number</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_routing_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">4.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Account Number</fo:inline>:
						    	<fo:inline>
 									<xsl:value-of select="paddetails/account_number" />
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">5.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Amount of Payment</fo:inline>:
						    	<fo:inline>
 									Variable
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">6.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Frequency of Payment</fo:inline>:
						    	<fo:inline>
									Sporadic
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">7.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Payment Start Date</fo:inline>:
						    	<fo:inline>
						    	 	 The PAD Agreement is effective <xsl:value-of select="paddetails/confirmation_period" /> calendar days after the date of this confirmation. 
								</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item padding-bottom="4mm">
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">8.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Type of Pre-Authorized Debit</fo:inline>:
						    	<fo:inline>
									Business PAD
								 </fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						    <fo:list-item>
						    	<fo:list-item-label  end-indent="label-end()"><fo:block font-weight="bold">9.</fo:block></fo:list-item-label> 
						    	<fo:list-item-body start-indent="1.6cm"><fo:block><fo:inline font-weight='bold'>Statement with regard to Pre-notification</fo:inline>:
						    	<fo:inline>
 								You have agreed to reduce the required confirmation period of the first PAD issued under the PAD Agreement to three calendar days. 
							</fo:inline>
						    	</fo:block></fo:list-item-body >
						    </fo:list-item>
						</fo:list-block>
						<fo:block padding-bottom="4mm">
							Your Payor's PAD Agreement may be cancelled provided notice is received <fo:inline font-weight='bold'>7 days</fo:inline> before the next scheduled PAD. If any of the above details are incorrect, please contact us immediately at <fo:inline font-weight='bold'>finance@EBSCO.com</fo:inline>. If the details are correct, you do not need to do anything further and your Pre-Authorized Debits will be processed and start on the Payment Start Date indicated above.  </fo:block>
                        <fo:block padding-bottom="4mm" font-weight='bold'>
							EBSCO may assign at any time all or a portion of its rights and obligations under the PAD Agreement.   You may not assign the PAD Agreement or any of your rights or obligations under the PAD Agreement.  All of EBSCO's rights under the PAD Agreement shall ensure to the benefit of its successors and assigns.
                        </fo:block>
                        <fo:block padding-bottom="4mm">Thank you,  </fo:block>
                        <fo:block padding-bottom="4mm">EBSCO Industries, Inc. </fo:block>
                        <fo:block id="end">
                        </fo:block>
                        <fo:block page-break-after="always"></fo:block>
                       	<fo:block font-weight="bold" text-align="center" padding-bottom="4mm" >Automated Clearing House Terms and Conditions ("ACH Agreement")</fo:block>
                        <fo:block padding-bottom="4mm">
                       		As the legal entity seeking to make payment ("You" or "Your") to EBSCO Industries, Inc. ("EBSCO"), You acknowledge and agree that You are not required to pay EBSCO via this Internet payment option, which is provided by the HighRadius Corporation ("HighRadius"), a third-party service provider.  By choosing to use this payment option, You accept and agree to be bound by the terms and conditions stated below. 
                        </fo:block>
                        <fo:list-block padding-bottom="4mm" provisional-distance-between-starts="1.6cm" provisional-label-separation="1.6cm">
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">1)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									You expressly authorize HighRadius to use the financial institution and account number provided herein to complete an ACH transfer for the sole purpose of transmitting payment to EBSCO.  As such, HighRadius will rely solely on the information provided herein.  Neither HighRadius nor EBSCO shall be responsible for any loss that may arise by reason of mistake or fraud in connection with this information.  Rather, You shall be responsible for any loss that may arise due to HighRadius's or EBSCO's reliance on the information provided herein.  
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>	
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">2)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									All payments will continue to be governed by the terms of EBSCO's agreement(s) with You.  This Agreement will not diminish, but may enlarge, the respective rights and obligations under such agreements between EBSCO and You.  For the sake of clarity, EBSCO expressly maintains all of its rights at law or in equity with regard to this transaction. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">3)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									EBSCO is responsible for the receipt of payment when its financial institution is in control of the transaction.  Prior thereto, You bear all risk by using this payment venue and EBSCO shall have no liability whatsoever. 
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">4)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									You acknowledge and agree that it may take up to six (6) days, prior to Your first payment transaction, to set up Your Internet payment option with Your bank.	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">5)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
								You represent and warrant that You are authorized to make payments and execute withdrawals from the financial institution and account number provided herein.  You represent and warrant that You have sufficient funds in Your financial account in order to complete the transaction contemplated herein.  You represent and warrant that you are using a financial institution in the US to complete this transaction on your behalf, and thereby, this transaction is only subject to applicable US federal and state law. If Your financial institution returns Your payment as Non-Sufficient Funds (“NSF”), You hereby acknowledge and agree that You will pay the applicable NSF fee in addition to the original amount due.
							</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">6)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">

								<fo:block padding-bottom="4mm">
									You acknowledge and agree that You must make Your payment one (1) or more days in advance of the date You want the transaction(s) to be posted to Your account in order to provide EBSCO with sufficient time to process Your request.
								</fo:block>

					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">7)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									EBSCO may assign at any time all or a portion of its rights and obligations under this ACH Agreement.  You may not assign this ACH Agreement or any of your rights or obligations under this ACH Agreement.  All of EBSCO's rights under this ACH Agreement shall enure to the benefit of its successors and assigns.	
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">8)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									YOU ACKNOWLEDGE AND AGREE THAT THE SECURITY AND PRIVACY OF THE DATA YOU PROVIDE HEREIN IS SOLELY MANAGED AND MAINTAINED BY HIGHRADIUS CORPORATION.  YOU EXPRESSLY WAIVE YOUR RIGHT TO BRING ANY AND ALL CLAIMS AGAINST EBSCO REGARDING YOUR DATA SECURITY AND PRIVACY IN CONNECTION WITH YOUR USE OF THIS INTERNET PAYMENT OPTION.  IF YOU WOULD LIKE TO LEARN MORE ABOUT HIGHRADIUS' DATA SECURITY AND PRIVACY PRACTICES, PLEASE VISIT <fo:basic-link external-destination="url('WWW.HIGHRADIUS.COM')" color="blue" text-decoration="underline">WWW.HIGHRADIUS.COM</fo:basic-link>.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						<fo:list-item padding-bottom="4mm">
					    	<fo:list-item-label start-indent = "2cm" end-indent="label-end()"><fo:block font-weight="bold">9)</fo:block></fo:list-item-label> 
					    	<fo:list-item-body start-indent="body-start()">
						    	<fo:block>
									<fo:inline text-decoration='underline'>SECURITY PRECAUTION WARNING: </fo:inline>  NO DATA TRANSMISSION OVER THE INTERNET CAN BE GUARANTEED TO BE ONE-HUNDRED PERCENT (100%) SECURE. AS A RESULT, DESPITE OUR EFFORTS TO PROTECT YOUR COMPANY'S INFORMATION, EBSCO CANNOT ENSURE OR WARRANT THE SECURITY OF ANY INFORMATION YOU TRANSMIT TO HIGHRADIUS, OR TO OR FROM HIGHRADIUS'S ONLINE SERVICES, AND, THEREFORE, YOU TRANSMIT ALL SUCH INFORMATION TO US AT YOUR OWN RISK.
								</fo:block>
					    	</fo:list-item-body >
						</fo:list-item>
						</fo:list-block>
                    </fo:flow>
                </fo:page-sequence>
            </fo:root>
    </xsl:template>
</xsl:stylesheet>
