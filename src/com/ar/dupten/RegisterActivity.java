package com.ar.dupten;


import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.Person.Image;
import com.ar.dupten.util.DataManager;
import com.ar.dupten.util.UserData;

public class RegisterActivity extends Activity implements GoogleApiClient.ConnectionCallbacks,
															GoogleApiClient.OnConnectionFailedListener,
																	View.OnClickListener{
	/* (non-Javadoc)
	 * @see android.app.Activity#onDestroy()
	 */
	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		signOutFromGplus();
	}

	/**
	 * True if the sign-in button was clicked.  When true, we know to resolve all
	 * issues preventing sign-in without waiting.
	 */
	private boolean mSignInClicked;

	/**
	 * True if we are in the process of resolving a ConnectionResult
	 */
	private boolean mIntentInProgress;
    /* Request code used to invoke sign in user interactions. */
    private static final int RC_SIGN_IN = 0;

    /* The GoogleApiClient object wraps a ServiceConnection to Google Play services; 
     * Client used to interact with Google APIs. */
    private GoogleApiClient mGoogleApiClient;
    
	ActionBar actionBar;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
//		FacebookSdk.sdkInitialize(this.getApplicationContext());
//	    callbackManager = CallbackManager.Factory.create();
		setContentView(R.layout.activity_register);
		actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		actionBar.setHomeButtonEnabled(true);
		mGoogleApiClient = new GoogleApiClient.Builder(this)
        .addConnectionCallbacks(this)
        .addOnConnectionFailedListener(this)
        .addApi(Plus.API)
        .addScope(new Scope("profile"))        
        .build();
		//Plus.PeopleApi.loadVisible(mGoogleApiClient, null).setResultCallback((ResultCallback<LoadPeopleResult>) this);
		//PlusClient plusClient = new PlusClient.Builder(this, this, this).setScopes(Scopes.PLUS_LOGIN, Scopes.PLUS_PROFILE ,"https://www.googleapis.com/auth/userinfo.email").build();
		findViewById(R.id.glogin_button).setOnClickListener(this);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.register, menu);
		
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
//		if (id == R.id.action_settings) {
//			return true;
//		} else 
			if(id==android.R.id.home){
			onBackPressed();
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

//	@Override
//    protected void onStart() {
//        super.onStart();
//        mGoogleApiClient.connect();
//    }

    @Override
    protected void onStop() {
        super.onStop();
        mGoogleApiClient.disconnect();
    }

	
	@Override
	public void onConnectionFailed(ConnectionResult result) {
		 if (!mIntentInProgress) {
			    if (mSignInClicked && result.hasResolution()) {
			      // The user has already clicked 'sign-in' so we attempt to resolve all
			      // errors until the user is signed in, or they cancel.
			      try {
			        result.startResolutionForResult(this, RC_SIGN_IN);
			        mIntentInProgress = true;
			      } catch (SendIntentException e) {
			        // The intent was canceled before it was sent.  Return to the default
			        // state and attempt to connect to get an updated ConnectionResult.
			        mIntentInProgress = false;
			        mGoogleApiClient.connect();
			      }
			    }
			  }
		
	}

	@Override
	public void onConnected(Bundle connectionHint) {
		  mSignInClicked = false;
		  Toast.makeText(this, "User is connected!"+connectionHint, Toast.LENGTH_SHORT).show();
		  if (Plus.PeopleApi.getCurrentPerson(mGoogleApiClient) != null) {
			    Person currentPerson = Plus.PeopleApi.getCurrentPerson(mGoogleApiClient);
			    String personName = currentPerson.getDisplayName();
			    Image personPhoto = currentPerson.getImage();
			    String personGooglePlusProfile = currentPerson.getUrl();
			    String email = Plus.AccountApi.getAccountName(mGoogleApiClient);
			    Log.d("currentPerson", ""+currentPerson+""+personGooglePlusProfile+""+personName+""+personPhoto);			    
			    UserData ud =new UserData();
			    ud.setId(1);
			    ud.setPhone("");
			    ud.setName(personName);
			    ud.setCity("");
			    ud.setComapany("");
			    ud.setDesignation("");
			    ud.setEmail(email);
			    ud.setRegistered(true);		
			    ud.setImg(personPhoto.getUrl());
			    Intent intent = new Intent(this, UserProfileActivity.class);
			  	intent.putExtra("user", ud);			  	
			  	startActivity(intent);
			  	
			  
			  } else {
				  Toast.makeText(getApplicationContext(),
		                    "Person information is nu", Toast.LENGTH_SHORT).show();
				  
			  }
	}

	@Override
	public void onConnectionSuspended(int arg0) {
		mGoogleApiClient.connect();
		
	}

	@Override
	public void onClick(View v) {
		if (v.getId() == R.id.glogin_button && !mGoogleApiClient.isConnecting()) {
		    mSignInClicked = true;
		    mGoogleApiClient.connect();
		  }
		
	}
	
	protected void onActivityResult(int requestCode, int responseCode, Intent intent) {
		  if (requestCode == RC_SIGN_IN) {
		    if (responseCode != RESULT_OK) {
		      mSignInClicked = false;
		    }

		    mIntentInProgress = false;

		    if (!mGoogleApiClient.isConnected()) {
		      mGoogleApiClient.reconnect();
		    }
		  }
		}
	
	 private void signOutFromGplus() {
	        if (mGoogleApiClient.isConnected()) {
	            Plus.AccountApi.clearDefaultAccount(mGoogleApiClient);
	            mGoogleApiClient.disconnect();
	            mGoogleApiClient.connect();
	        }
	    }
}
