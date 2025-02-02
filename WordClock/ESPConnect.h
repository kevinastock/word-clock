#ifndef ESPConnect_h
#define ESPConnect_h


#include <functional>
#include <Arduino.h>

#include "WiFi.h"
#include "WiFiClient.h"
#include "AsyncTCP.h"
#include "Preferences.h"

#include "ESPAsyncWebServer.h"
#include "DNSServer.h"

/* Library Default Settings */
#define ESPCONNECT_DEBUG 1

#define DEFAULT_CONNECTION_TIMEOUT 30000


#if ESPCONNECT_DEBUG == 1
  #define ESPCONNECT_SERIAL(x) Serial.print("[ESPConnect]["+String(millis())+"] "+x)
#else
  #define ESPCONNECT_SERIAL(x)
#endif


class ESPConnectClass {

  private:
    DNSServer* _dns = nullptr;
    AsyncWebServer* _server = nullptr;

    String _sta_ssid = "";
    String _sta_password = "";

    bool _stop_the_portal = false;
    int _scanResult = -1;

  private:
    void load_sta_credentials();

    // Start Captive portal
    bool start_portal();


  public:
    // Check if ESPConnect was configured before
    bool isConfigured();

    // Find all available wifi networks.
    void scanNetworks();

    // Run the captive portal until creds are given.
    void startPortal(AsyncWebServer* server, const char* ssid);

    // Connect to Saved WiFi Credentials
    bool connect(unsigned long timeout = DEFAULT_CONNECTION_TIMEOUT);

    // Erase Saved WiFi Credentials
    bool erase();

    /*
      Data Getters
    */

    // Return true / false depending of connection status
    bool isConnected();

    // Gets SSID of connected endpoint
    String getSSID();
    String getPassword();
};

extern ESPConnectClass ESPConnect;

#endif
