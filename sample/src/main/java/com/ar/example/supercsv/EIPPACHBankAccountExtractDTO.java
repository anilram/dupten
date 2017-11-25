package com.ar.example.supercsv;

public class EIPPACHBankAccountExtractDTO {

	/*extra empty column was appending in TXT file needs to discuss*/
	/*reading CSV Format */
	/*logic*/
	
	private String custNumber;
	
    private String ck;
    
    private String bankKey;
    
    private String bankAccount;
    
    private String bankCtrl;
    
    private String bankTypeP;
    
    private String bankRefSpec;
    
    private String bankAchlderName;
    
    private String collectionAuth;
    
    private String updateType;
	
   
	
	public String getCustNumber() {
		return custNumber;
	}



	public void setCustNumber(String custNumber) {
		this.custNumber = custNumber;
	}



	public String getCk() {
		return ck;
	}



	public void setCk(String ck) {
		this.ck = ck;
	}



	public String getBankKey() {
		return bankKey;
	}



	public void setBankKey(String bankKey) {
		this.bankKey = bankKey;
	}



	public String getBankAccount() {
		return bankAccount;
	}



	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}



	public String getBankCtrl() {
		return bankCtrl;
	}



	public void setBankCtrl(String bankCtrl) {
		this.bankCtrl = bankCtrl;
	}



	public String getBankTypeP() {
		return bankTypeP;
	}



	public void setBankTypeP(String bankTypeP) {
		this.bankTypeP = bankTypeP;
	}



	public String getBankRefSpec() {
		return bankRefSpec;
	}



	public void setBankRefSpec(String bankRefSpec) {
		this.bankRefSpec = bankRefSpec;
	}



	public String getBankAchlderName() {
		return bankAchlderName;
	}



	public void setBankAchlderName(String bankAchlderName) {
		this.bankAchlderName = bankAchlderName;
	}



	public String getCollectionAuth() {
		return collectionAuth;
	}



	public void setCollectionAuth(String collectionAuth) {
		this.collectionAuth = collectionAuth;
	}



	public String getUpdateType() {
		return updateType;
	}



	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return custNumber+ck+bankKey+bankAccount+bankCtrl+bankTypeP+bankRefSpec+bankAchlderName+collectionAuth+updateType;
	}
}
