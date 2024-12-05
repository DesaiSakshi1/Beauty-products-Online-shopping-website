<?php

//Make object of Google API Client for call Google API
#$google_client = new Google_Client();

//Set the OAuth 2.0 Client ID
$google_client->setClientId('543767566391-qcd51sqdkpak5tr8lhjahv8vsfrhc88d.apps.googleusercontent.com');

//Set the OAuth 2.0 Client Secret key
$google_client->setClientSecret('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');

//Set the OAuth 2.0 Redirect URI
$google_client->setRedirectUri('http://localhost/coolcos/');

// to get the email and profile 
$google_client->addScope('email');

$google_client->addScope('profile');

?> 