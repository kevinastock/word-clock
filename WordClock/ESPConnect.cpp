#include "ESPConnect.h"


/*
  Check if ESPConnect was configured before
*/

bool ESPConnectClass::isConfigured() {
  if (_sta_ssid.length() > 0) {
    return true;
  }

  load_sta_credentials();
  return _sta_ssid.length() > 0;
}

/*
  Loads STA Credentials into memory
*/

void ESPConnectClass::load_sta_credentials(){
  // Get saved WiFi Credentials
  Preferences preferences;
  preferences.begin("espconnect", false);
  _sta_ssid = preferences.getString("ssid", "");
  _sta_password = preferences.getString("password", "");
  preferences.end();
}

void ESPConnectClass::scanNetworks() {
  ESPCONNECT_SERIAL("Starting wifi scan\n");
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(1000);
  
  WiFi.scanNetworks(true);
  
  do {
    _scanResult = WiFi.scanComplete();
    // maybe yield is ok here? but it wasn't in server below, so here we are.
    delay(1000);
  } while (_scanResult == WIFI_SCAN_RUNNING);

  if (_scanResult == WIFI_SCAN_FAILED) {
    _scanResult = 0;
  }

  ESPCONNECT_SERIAL(_scanResult);
  ESPCONNECT_SERIAL("Finished wifi scan\n");
}

void ESPConnectClass::startPortal(AsyncWebServer* server, const char *ssid) {
  ESPCONNECT_SERIAL("Starting Captive Portal\n");
  _stop_the_portal = false;
  // Try Connecting Station
  WiFi.mode(WIFI_AP_STA);
  // Start Access Point
  WiFi.softAP(ssid, "");

  // Start our DNS Server
  _dns = new DNSServer();
  _dns->setErrorReplyCode(DNSReplyCode::NoError);
  _dns->start(53, "*", WiFi.softAPIP());

  // Accept incomming WiFi Credentials
  auto connectPOST = server->on("/connect", HTTP_POST, [&](AsyncWebServerRequest *request){
    ESPCONNECT_SERIAL("Handle connect post\n");
    // Get FormData
    String ssid = request->hasParam("ssid", true) ? request->getParam("ssid", true)->value().c_str() : "";
    String password = request->hasParam("password", true) ? request->getParam("password", true)->value().c_str() : "";
    if (ssid.length() <= 0) {
      ssid = request->hasParam("otherSSID", true) ? request->getParam("otherSSID", true)->value().c_str() : "";
    }

    if(ssid.length() <= 0){
      return request->send(200, "text/plain", "Invalid SSID");
    }

    if(ssid.length() > 32 || password.length() > 64){
      return request->send(200, "text/plain", "Credentials exceed character limit of 32 & 64 respectively.");
    }

    // Save WiFi Credentials in Flash
    Preferences preferences;
    preferences.begin("espconnect", false);
    preferences.putString("ssid", ssid.c_str());
    preferences.putString("password", password.c_str());
    preferences.end();

    _sta_ssid = ssid;
    _sta_password = password;
    _stop_the_portal = true;

    request->send(200, "text/plain", "Credentials Saved. Rebooting...");
  });

  // FIXME: use string reserve correctly.
  /*
  auto indexGET = server->on("/", HTTP_GET, [&](AsyncWebServerRequest *request){});
  */

  server->onNotFound([&](AsyncWebServerRequest *request){
    ESPCONNECT_SERIAL("Handle onNotFound\n");
    String html = "<!DOCTYPE html><html lang='en'><head><meta charset='UTF-8'> <meta name='viewport' content='width=device-width, initial-scale=1.0'> <title>Wordclock Wifi Setup</title> <style> body { font-family: 'Arial', sans-serif; background: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; padding: 1rem; } .container { background: #ffffff; width: calc(100% - 2rem); max-width: 35rem; padding: 1.5rem; } h1 { font-size: 1.5rem; color: #333; text-align: center; margin-bottom: 2rem; } form { display: flex; flex-direction: column; } input[type='text'], select, button { width: 100%; padding: 0.8rem; margin-bottom: 1rem; border: 1px solid #ccc; border-radius: 0.5rem; font-size: 1rem; box-sizing: border-box; } select { background-color: white; } button { background-color: #007BFF; color: white; border: none; cursor: pointer; transition: background 0.3s ease; } button:hover { background-color: #0056b3; } .footnote { font-size: 0.8rem; text-align: center; color: #666; } </style> </head> <body> <div class='container'> <h1>Wordclock Wifi Setup</h1> <form action='/connect' method='POST'> <select id='ssid' name='ssid' onchange='checkOther(this)'> <option value='' disabled selected>Select WiFi Network</option>";

    for (int i = 0; i < _scanResult; ++i) {
      String ssid = WiFi.SSID(i);
      ESPCONNECT_SERIAL("Scan " + ssid);
      ssid.replace("&", "&amp;");
      ssid.replace("\"", "&quot;");
      ssid.replace("\'", "&apos;");
      ssid.replace("<", "&lt;");
      ssid.replace(">", "&gt;");
      html += "<option value='" + ssid + "'>" + ssid + "</option>";
    }

    html += "<option value='' data-is-other='true'>Other...</option> </select> <input type='text' id='otherSSID' name='otherSSID' placeholder='Enter WiFi SSID' style='display:none;'> <input type='text' id='password' name='password' placeholder='WiFi Password'> <button type='submit'>Connect</button> </form> <p class='footnote'>Made by Kevin 🚀</p> <!-- Add a refresh button. That just refreshes the page. --> </div> <script> function checkOther(select) { var otherInput = document.getElementById('otherSSID'); if (select.options[select.selectedIndex].dataset.isOther === 'true') { otherInput.style.display = 'block'; } else { otherInput.style.display = 'none'; } } </script> </body> </html>";
    request->send(200, "text/html", html);
    ESPCONNECT_SERIAL("End onNotFound");
  });

  // Begin Webserver
  server->begin();

  ESPCONNECT_SERIAL("Captive portal setup, waiting\n");
  while(!_stop_the_portal){
    _dns->processNextRequest();
    yield();
  }
  ESPCONNECT_SERIAL("Captive portal ending\n");

  //server->removeHandler(&indexGET);
  server->removeHandler(&connectPOST);
  server->onNotFound([](AsyncWebServerRequest *request){
    request->send(404);
  });

  _dns->stop();
  delete _dns;
  _dns = nullptr;

  server->end();
  ESPCONNECT_SERIAL("Closed Portal\n");
  WiFi.softAPdisconnect(true);
}

/*
  Connect to saved WiFi Credentials
*/
bool ESPConnectClass::connect(unsigned long timeout){
  load_sta_credentials();

  if(_sta_ssid.length() == 0){
    return false;
  }

  ESPCONNECT_SERIAL("STA Pre-configured:\n");
  ESPCONNECT_SERIAL("SSID: "+_sta_ssid+"\n");
  ESPCONNECT_SERIAL("Password: "+_sta_password+"\n\n");
  ESPCONNECT_SERIAL("Connecting to STA [");

  // Try connecting to STA
  WiFi.persistent(false);
  WiFi.setAutoReconnect(false);
  WiFi.mode(WIFI_STA);
  WiFi.begin(_sta_ssid.c_str(), _sta_password.c_str());

  // Check WiFi connection status till timeout
  unsigned long lastMillis = millis();
  while(WiFi.status() != WL_CONNECTED && (unsigned long)(millis() - lastMillis) < timeout){
    Serial.print("#");
    delay(500);
    yield();
  }
  Serial.print("]\n");

  if(WiFi.status() != WL_CONNECTED){
    ESPCONNECT_SERIAL("Connection to STA Falied [!]\n");
    return false;
  }

  return true;
}


/*
  Erase Stored WiFi Credentials
*/
bool ESPConnectClass::erase(){
  Preferences preferences;
  preferences.begin("espconnect", false);
  preferences.putString("ssid", "");
  preferences.putString("password", "");
  preferences.end();
  WiFi.disconnect(true, true);
  _sta_ssid = "";
  _sta_password = "";
  return true;
}


/*
  Return Connection Status
*/
bool ESPConnectClass::isConnected(){
  return (WiFi.status() == WL_CONNECTED);
}

String ESPConnectClass::getSSID(){
  return _sta_ssid;
}

String ESPConnectClass::getPassword(){
  return _sta_password;
}

ESPConnectClass ESPConnect;
