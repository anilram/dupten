package com.ar.dupten.widget;

import com.ar.dupten.R;

import android.app.DialogFragment;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;

import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.Toast;

public class FeedBackDialog extends DialogFragment{
	public FeedBackDialog(){
		super();
	}

	ImageView gmailShareView;
	
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.feedback_dialog, container, false);
		gmailShareView = (ImageView) view.findViewById(R.id.gmailshare);
		
		getDialog().setTitle("Choose Option");
		gmailShareView.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				sendEmail();	
			}
		});
		return view;
	}
	
	protected void sendEmail() {
    Log.i("Send email", "");
    //String[] TO = {"android@10times.com"};
    Intent emailIntent = new Intent(Intent.ACTION_SENDTO,Uri.fromParts(
            "mailto","abc@gmail.com", null));
   
 //   emailIntent.setType("text/plain");
   
    emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Feedback for 10times android app sent from = Galaxy Nexus  Android" +
    		"version-4.2.1App version 1.0.0.48");
    emailIntent.putExtra(Intent.EXTRA_TEXT, "");
    getActivity().finish();
    try {
       startActivity(Intent.createChooser(emailIntent, "Choose Option"));
       Log.i("Finished sending email...", "");
    } catch (android.content.ActivityNotFoundException ex) {
       Toast.makeText(getActivity(), 
       "There is no email client installed.", Toast.LENGTH_SHORT).show();
    }
 }
}
