/*
ESP32 word clock

https://api.ip2location.io/?format=json
http://worldtimeapi.org/api/ip

TODO:
- Confirm turning display off for some time works correctly.
- Just confirm everything. Write documentation and test all the features.

*/

#define DEBUG 0

#ifdef DEBUG
#define DPRINT(...)    Serial.print(__VA_ARGS__)
#define DPRINTLN(...)  Serial.println(__VA_ARGS__)
#else
#define DPRINT(...)     //blank line
#define DPRINTLN(...)   //blank line
#endif

#include <TinyPICO.h>
#define SPI_DATA 23
#define SPI_CLOCK 18

/* ESP32 Dependencies */
#include <ESPAsyncWebServer.h>
#include <esp_bt.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

#include <WiFiUdp.h>
#include "NTPClient.h"

#include "ESPConnect.h"
#include <FastLED.h>

#include <Wire.h>
#include <Adafruit_LIS3DH.h>
#include <Adafruit_Sensor.h>
#include "Preferences.h"

Adafruit_LIS3DH accel = Adafruit_LIS3DH();

#define NUM_LEDS (256)
CRGB leds[NUM_LEDS];

unsigned long buffered_minute = 60; // We don't need hours because this is just used to detect when to shift buffers
CHSV before[NUM_LEDS];
CHSV after[NUM_LEDS];
CHSV kevin[NUM_LEDS];

// The color to show the wifi message in.
CRGB wifi_color = CRGB::Green;

const uint8_t LETTER_LEDS[9][9][2] = {
    {{0,1}, {31,32}, {63,64}, {95,96}, {127,128}, {159,160}, {191,192}, {223,224}, {255,254}},
    {{2,29}, {33,34}, {61,66}, {93,98}, {125,130}, {157,162}, {189,194}, {222,221}, {226,253}},
    {{3,4}, {27,36}, {60,59}, {92,91}, {124,123}, {156,155}, {188,187}, {220,219}, {252,251}},
    {{5,6}, {37,38}, {69,70}, {101,102}, {133,134}, {165,166}, {197,198}, {218,229}, {250,249}},
    {{7,8}, {23,40}, {56,55}, {88,87}, {120,119}, {152,151}, {184,183}, {216,215}, {248,247}},
    {{9,10}, {41,42}, {73,74}, {105,106}, {137,138}, {169,170}, {201,202}, {214,233}, {246,245}},
    {{11,12}, {19,44}, {52,51}, {84,83}, {116,115}, {148,147}, {180,179}, {212,211}, {244,243}},
    {{13,14}, {18,45}, {50,77}, {82,109}, {114,141}, {146,173}, {178,205}, {210,237}, {242,241}},
    {{15,16}, {46,47}, {48,79}, {80,111}, {112,143}, {144,175}, {176,207}, {209,208}, {239,240}}
};

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, -4 * 3600);

AsyncWebServer server(80);
JsonDocument doc;
TinyPICO tp = TinyPICO();

bool timeLoaded = false;

int button = -1;
unsigned long button_since = 0;
unsigned long button_start = 0;
bool button_once = true;

#define MILLIS_PER_CYCLE (1000L*60*60*12)
#define MILLIS_PER_HOUR (1000L*60*60)
#define MILLIS_PER_MINUTE (1000L*60)
#define MILLIS_PER_SECOND (1000)
#define FIVE_MIN (60*5)
#define FIVE_MIN_MILLIS (1000*60*5)

#define FADE_MILLIS (3000L)
#define FADE_START (FIVE_MIN_MILLIS/2 - FADE_MILLIS/2)
#define FADE_END (FIVE_MIN_MILLIS/2 + FADE_MILLIS/2)

#define NO_WIFI (1)
#define NO_API (2)
#define SUCCESS (3)

#define ROTATE_LEFT (0)
#define ROTATE_RIGHT (1)
#define FACE_UP (4)
#define FACE_DOWN (5)
#define UPSIDE_DOWN (3)
#define NORMAL_POSITION (2)

#define UNSET_MANUAL_TZ_OFFSET (-1)

// PERSISTED VALUES
uint8_t led_value;
uint8_t _stored_led_value;

long manual_tz_offset;
long _stored_manual_tz_offset;

uint32_t display_off_start;
uint32_t _stored_display_off_start;

uint32_t display_off_end;
uint32_t _stored_display_off_end;

void read_stored_values() {
  Preferences preferences;
  preferences.begin("clock", false);

  DPRINTLN("Loading stored values:");

  led_value = _stored_led_value = preferences.getUChar("lv", 255);
  manual_tz_offset = _stored_manual_tz_offset = preferences.getLong("mt", UNSET_MANUAL_TZ_OFFSET);
  display_off_start = _stored_display_off_start = preferences.getUInt("ds", 1000000);
  display_off_end = _stored_display_off_end = preferences.getUInt("de", 1000000);

  DPRINT("LED: ");
  DPRINTLN(led_value);

  DPRINT("TZ: ");
  DPRINTLN(manual_tz_offset);

  DPRINT("Off Start: ");
  DPRINTLN(display_off_start);

  DPRINT("Off End: ");
  DPRINTLN(display_off_end);

  preferences.end();
}

void write_stored_values() {
  if (led_value != _stored_led_value 
      || manual_tz_offset != _stored_manual_tz_offset 
      || display_off_start != _stored_display_off_start
      || display_off_end != _stored_display_off_end) {

    DPRINT("LED: ");
    DPRINT(_stored_led_value);
    DPRINT(" -> ");
    DPRINTLN(led_value);

    DPRINT("TZ: ");
    DPRINT(_stored_manual_tz_offset);
    DPRINT(" -> ");
    DPRINTLN(manual_tz_offset);

    DPRINT("Off Start: ");
    DPRINT(_stored_display_off_start);
    DPRINT(" -> ");
    DPRINTLN(display_off_start);

    DPRINT("Off End: ");
    DPRINT(_stored_display_off_end);
    DPRINT(" -> ");
    DPRINTLN(display_off_end);

    Preferences preferences;
    preferences.begin("clock", false);
    preferences.putUChar("lv", led_value);
    preferences.putLong("mt", manual_tz_offset);
    preferences.putUInt("ds", display_off_start);
    preferences.putUInt("de", display_off_end);
    preferences.end();

    _stored_led_value = led_value;
    _stored_manual_tz_offset = manual_tz_offset;
    _stored_display_off_start = display_off_start;
    _stored_display_off_end = display_off_end;
  } else {
    DPRINTLN("No writes to preferences needed");
  }
}


int fetch_timezone(String url, String key) {
  HTTPClient http;
  http.begin(url);
  int httpCode = http.GET();
  int newOffset = -1; // Sentinel value; offset must be a multiple of 60 to be real.

  if (httpCode == 200) {
    DeserializationError error = deserializeJson(doc, http.getStream());
    if (error) {
      DPRINTLN("Failed to parse json from " + url);
    } else {
      const char* datetime = doc[key]; // "-05:00"
      if (datetime != NULL) {
        int h, m;
        int filled = sscanf(datetime, "%d:%d", &h, &m);
        if (filled != 2) {
          DPRINT("Could not parse offset from worldtimeapi: ");
          DPRINTLN(filled);
        } else {
          newOffset = h*3600 + m*60;
        }
      } else {
        DPRINTLN("Key not found in doc.");
      }
    }
  } else {
    DPRINTLN("Failed to connect to " + url);
  }
  http.end();

  return newOffset;
}

void set_time_zone() {
  // - if manual is set, we just use it (easy)
  // - if auto, and we're in startup: just leave it alone, will default to gmt
  // - if auto, and this is a regular update, we don't care this failed once. (easy)

  if (manual_tz_offset != UNSET_MANUAL_TZ_OFFSET) {
    // If a manual tz offset was specified, we use that one.
    DPRINTLN("Timezone was manually set");
    timeClient.setTimeOffset(manual_tz_offset);
    return;
  }

  DPRINTLN("Fetching from worldtimeapi");
  int newOffset = fetch_timezone("http://worldtimeapi.org/api/ip", "utc_offset");

  /*
  // Ugh, this doesn't do DST.
  if (newOffset == -1) {
    DPRINTLN("Fetching from ip2location");
    newOffset = fetch_timezone("https://api.ip2location.io", "time_zone");
  }
  */

  if (newOffset == -1) {
    DPRINTLN("ERROR: Could not set time zone from any sources");
  } else if (newOffset != timeClient.getTimeOffset()) {
    DPRINT("Setting timezone: ");
    DPRINTLN(newOffset);
    timeClient.setTimeOffset(newOffset);
  }
}

int get_time() {
  // Let's get this over with fast.
  setCpuFrequencyMhz(240);

  int ret = NO_WIFI;
  DPRINTLN("Getting the time");
  
  ESPConnect.connect();

  if (ESPConnect.isConnected()) {
    DPRINTLN("Connected to WiFi");
    DPRINTLN("IPAddress: "+WiFi.localIP().toString());

    // Gross, but sometimes the network doesn't work right away after connection.
    delay(2000);

    ret = NO_API;
    timeClient.begin();
    
    set_time_zone();

    if (!timeClient.forceUpdate()) {
      DPRINTLN("NTP isn't working?!");
    } else {
      DPRINT("Got time & timezone: ");
      DPRINTLN(timeClient.getFormattedTime());
      ret = SUCCESS;
    }

    // disconnect the wifi
    WiFi.disconnect(true, true);
    WiFi.mode(WIFI_OFF);
    DPRINTLN("Disconnected from WiFi");
  } else {
    DPRINTLN("Failed to connect to WiFi");
  }

  // And let's not melt the cpu.
  setCpuFrequencyMhz(80);
  return ret;
}

#ifdef DEBUG
int last_on = 0;
#endif

void show_leds() {
#ifdef DEBUG
  int on = 0;
  for (int i = 0; i < NUM_LEDS; i++) {
    if (leds[i].r > 0 || leds[i].g > 0 || leds[i].b > 0) {
      on++;
    }
  }

  if (on != last_on) {
    DPRINT("Total leds on = ");
    DPRINTLN(on);
    last_on = on;
  }

  // This check is a bit goofy, but I don't want to explode more boards. Check that we never need a bigger value?
  // HALF PAST ELEVEN -> TWENTY FIVE TO TWELVE is the biggest I think?
  if (on < 70) {
    FastLED.show();
  } else {
    DPRINTLN("Oh no! We tried to draw too many leds at once!");
  }
#else
  FastLED.show();
#endif
}

void draw_buffer(CHSV* a) {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CHSV(a[i].h, a[i].s, a[i].v > 0 ? led_value : 0);
  }
  show_leds();
}

void draw_buffers(CHSV* a, CHSV* b, float x) {
  for (int i = 0; i < NUM_LEDS; i++) {
    uint8_t h, s, v;
    if (a[i].v == 0 && b[i].v == 0) {
      h = a[i].h;
      s = a[i].s;
      v = 0;
    } else if (a[i].v == 0) {
      h = b[i].h;
      s = b[i].s;
      v = led_value*(x);
    } else if (b[i].v == 0) {
      h = a[i].h;
      s = a[i].s;
      v = led_value*(1.0-x);
    } else {
      uint8_t dh = b[i].h - a[i].h; // This should behave like fastled's shortest_hue
      if (dh < 128) {
        h = a[i].h + (uint8_t)(dh*x);
      } else {
        dh = -dh;
        h = a[i].h - (uint8_t)(dh*x);
      }
      //  h = a[i].h*(1.0-x) + b[i].h*x;
      s = a[i].s*(1.0-x) + b[i].s*x;
      v = (a[i].v > 0 ? led_value : 0)*(1.0-x) + (b[i].v > 0 ? led_value : 0)*x;
    }
    leds[i] = CHSV(h, s, v);
  }
  show_leds();
}

void draw_word(CHSV* dest, uint8_t row, uint8_t col, uint8_t len, CHSV color) {
  for (uint8_t i = 0; i < len; i++) {
    dest[LETTER_LEDS[row][col+i][0]] = color;
    dest[LETTER_LEDS[row][col+i][1]] = color;
  }
}

void draw_time(CHSV* dest, int hour, int minute) {
  for (int i = 0; i < NUM_LEDS; i++) {
    dest[i] = CHSV(0,0,0);
  }

  // TODO: Pick better random colors. i.e., never two which are too close to each other
  CHSV color0 = CHSV(esp_random() % 256, 255, 255);
  CHSV color1 = CHSV(esp_random() % 256, 255, 255);
  CHSV color2 = CHSV(esp_random() % 256, 255, 255);
  CHSV color3 = CHSV(esp_random() % 256, 255, 255);
  
  if (minute == 5 || minute == 55 || minute == 25 || minute == 35) {
    draw_word(dest,2,0,4,color1); // FIVE
  }

  if (minute == 10 || minute == 50) {
    draw_word(dest,0,0,3,color1); // TEN
  }

  if (minute == 15 || minute == 45) {
    draw_word(dest,1,0,1,color0); 
    draw_word(dest,1,2,7,color1); // A QUARTER
  }

  if (minute == 20 || minute == 40 || minute == 25 || minute == 35) {
    // this is color zero because we don't want it to be the same color as five, and it'll never be on at the same time as 'A'
    draw_word(dest,0,3,6,color0); // TWENTY
  }

  if (minute == 30) {
    draw_word(dest,2,5,4,color1); // HALF
  }

  if (minute > 0 && minute <= 30) {
    draw_word(dest,3,0,4,color2); // PAST
  }

  if (minute > 30) {
    draw_word(dest,3,3,2,color2); // TO
    hour = (hour + 1) % 12;
  }

  if (hour == 0) {
    draw_word(dest,5,0,6,color3); // TWELVE
  }

  if (hour == 1) {
    draw_word(dest,8,6,3,color3); // ONE
  }

  if (hour == 2) {
    draw_word(dest,8,4,3,color3); // TWO
  }

  if (hour == 3) {
    draw_word(dest,7,0,5,color3); // THREE
  }

  if (hour == 4) {
    draw_word(dest,4,0,4,color3); // FOUR
  }

  if (hour == 5) {
    draw_word(dest,7,5,4,color3); // FIVE
  }
  
  if (hour == 6) {
    draw_word(dest,5,6,3,color3); // SIX
  }

  if (hour == 7) {
    draw_word(dest,4,4,5,color3); // SEVEN
  }

  if (hour == 8) {
    draw_word(dest,8,0,5,color3); // EIGHT
  }

  if (hour == 9) {
    draw_word(dest,6,0,4,color3); // NINE
  }

  if (hour == 10) {
    draw_word(dest,3,6,3,color3); // TEN
  }

  if (hour == 11) {
    draw_word(dest,6,3,6,color3); // ELEVEN
  }
}

void writeWiFi() {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB::Black;
  }

  leds[LETTER_LEDS[5][1][0]] = wifi_color;
  leds[LETTER_LEDS[5][1][1]] = wifi_color;
  
  leds[LETTER_LEDS[6][1][0]] = wifi_color;
  leds[LETTER_LEDS[6][1][1]] = wifi_color;
  
  leds[LETTER_LEDS[7][5][0]] = wifi_color;
  leds[LETTER_LEDS[7][5][1]] = wifi_color;
  
  leds[LETTER_LEDS[7][6][0]] = wifi_color;
  leds[LETTER_LEDS[7][6][1]] = wifi_color;

  show_leds();
}

void blackout() {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB::Black;
  }
  show_leds();
}

void setup(){
  Serial.begin(115200);
  DPRINTLN();

  accel.begin(0x18);
  accel.setRange(LIS3DH_RANGE_2_G);

  // It seems there isn't a way to turn off the indicator leds :(
  // But we can at least disable the onboard dotstar.
  tp.DotStar_SetPower( false );

  // We're not going to use bluetooth, just shut it down.
  esp_bt_controller_disable();

  // adafruit dotstar matrix
  FastLED.addLeds<DOTSTAR, SPI_DATA, SPI_CLOCK, BGR>(leds, NUM_LEDS);

  // ensure the arrays are init'ed black
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB::Black;
    before[i] = CHSV(0, 0, 0);
    after[i] = CHSV(0, 0, 0);
    kevin[i] = CHSV(0, 0, 0);
  }

  // Load the stored values
  read_stored_values();

  setCpuFrequencyMhz(80);
}

int button_seconds() {
  return (millis() - button_start) / 1000;
}

int current_button() {
  return button;
}

bool only_once_per_press() {
  bool ret = button_once;
  button_once = false;
  return ret;
}

bool register_direction(int pressed) {
  if (button != pressed) {
    button = pressed;
    button_since = millis();
    button_start = button_since;
    button_once = true;
    return false;
  }

  int now = millis();
  if (now - button_since > 5000) {
    button_since = now;
    return true;
  }

  return false;
}

void manual_tz_adjust(long diff) {
  if (timeLoaded) {
    // Only modify the timezone if we're already showing the time
    // just in case someone turns on the clock while it's on its side.

    if (manual_tz_offset == UNSET_MANUAL_TZ_OFFSET) {
      manual_tz_offset = timeClient.getTimeOffset();
    }
    manual_tz_offset += diff;
    timeClient.setTimeOffset(manual_tz_offset);
    // force redraw
    timeClient.freezeSys();

    draw_time(after, timeClient.getHours() % 12, timeClient.getMinutes() - timeClient.getMinutes() % 5);
    buffered_minute = 60;
  }
}

// Does appropriate actions for each button!
void update_button() {
  accel.read();

  int32_t x = accel.x;
  int32_t y = accel.y;
  int32_t z = accel.z;

  if (x*x > y*y + z*z) {
    if (x > 0) {
      if (register_direction(ROTATE_LEFT)) {
        DPRINTLN("Pressed left: tz--");
        manual_tz_adjust(-60*60);
      }
    } else {
      if (register_direction(ROTATE_RIGHT)) {
        DPRINTLN("Pressed right: tz++");
        manual_tz_adjust(60*60);
      }
    }
  } else if (y*y > x*x + z*z) {
    if (y > 0) {
      if (register_direction(NORMAL_POSITION)) {
        if (only_once_per_press()) {
          DPRINTLN("Normal position: saving values");
          write_stored_values();
        }
      }
    } else {
      if (register_direction(UPSIDE_DOWN)) {
        // Reset wifi & tz
        if (only_once_per_press() && ESPConnect.isConfigured()) {
          DPRINTLN("Pressed upside down: resetting wifi");
          ESPConnect.erase();
        }
      }
    }
  } else if (z*z > x*x + y*y) {
    if (z > 0) {
      // Reset and reduce brightness
      // If over a minute, reset time zone to auto.
      register_direction(FACE_UP);
      int t = button_seconds();

      if (t > 60 && only_once_per_press()) {
        DPRINTLN("Resetting timezone");
        manual_tz_offset = UNSET_MANUAL_TZ_OFFSET;
        timeLoaded = false;
        buffered_minute = 60;
      }

      uint8_t new_led_value;
      if (t < 5) {
        new_led_value = led_value;
      } else {
        new_led_value = (uint8_t[]){255, 200, 150, 100, 50}[((t-5) / 5) % 5];
      }

      if (new_led_value != led_value) {
        DPRINT("Setting brightness: ");
        DPRINTLN(new_led_value);
        led_value = new_led_value;
      }
    } else {
      if (register_direction(FACE_DOWN)) {
        if (only_once_per_press()) {
          DPRINTLN("Pressed face down: setting display off time");
        }
      }

      if (button_seconds() >= 5) {
        // Don't do anything if the button wasn't pushed for at least 5 seconds
        if (button_seconds() < 300) {
          // In the first 5 minutes of being face down, just reset the display off time.
          display_off_start = display_off_end = 1000000;
        } else {
          // Otherwise, set the display_off_end to now, and start to ~button_start.
          timeClient.freezeSys();
          display_off_end = timeClient.getEpochTime() % 86400L;
          display_off_start = (display_off_end + 86400L - button_seconds()) % 86400L;
        }
      }
    }
  } else {
    if (register_direction(-1)) {
        // Do nothing!
    }
  }
}

void loop() {
  update_button();
  
  if (!ESPConnect.isConfigured()) {
    DPRINTLN("Init network settings");
    // Let's get this over with fast.
    setCpuFrequencyMhz(240);

    wifi_color = CRGB::Red;
    writeWiFi();

    ESPConnect.scanNetworks();

    ESPConnect.startPortal(&server, "Wordclock");

    if (!ESPConnect.connect()) {
      // First WiFi setup failed, clear credentials to try again.
      ESPConnect.erase();
    } else {
      wifi_color = CRGB::Green;
    }

    WiFi.disconnect(true, true);
    WiFi.mode(WIFI_OFF);

    // And let's not melt the cpu.
    setCpuFrequencyMhz(80);

    return;
  }

  if (!timeLoaded) {
    DPRINTLN("Loading time first attempt");
    writeWiFi();

    int result = get_time();

    if (result == NO_WIFI) {
      wifi_color = CRGB::Yellow;
      DPRINTLN("Couldn't connect to wifi");
    } else if (result == NO_API) {
      wifi_color = CRGB::Blue;
      DPRINTLN("Couldn't reach services for time");
    } else if (result == SUCCESS) {
      // Init after time, this will immediately get copied to 'before'.
      timeClient.freezeSys();
      draw_time(after, timeClient.getHours() % 12, timeClient.getMinutes() - timeClient.getMinutes() % 5);
      timeLoaded = true;
    } else {
      // uh oh.
      DPRINTLN("IllegalStateException?");
    }

    // Let the chip cool off a bit.
    if (!timeLoaded) {
      writeWiFi(); // Show the correct color right away.
      delay(4000);
    }

    return;
  }
  
  // Make sure everything that happens this cycle is based on one timestamp.
  timeClient.freezeSys();

  unsigned long current_hour = timeClient.getHours() % 12;
  unsigned long current_minute = timeClient.getMinutes();
  current_minute -= current_minute % 5;

  // Update the display buffers if time has advanced enough.
  unsigned long next_hour = (current_hour + (current_minute == 55 ? 1 : 0)) % 12;
  unsigned long next_minute = (current_minute + 5) % 60;

  if (buffered_minute != current_minute) {
    for (int i = 0; i < NUM_LEDS; i++) {
      before[i] = after[i];
    }

    draw_time(after, next_hour, next_minute);
    buffered_minute = current_minute;

    if (current_minute == 5) {
      // Update at 5 minutes after the hour to best handle DST.
      // There are no animations at xx:05 - xx:06 so it's fine if we wait here for a bit
      get_time();
    }
  }

  // Turn off the display if requested.
  unsigned long day_seconds = timeClient.getEpochTime() % 86400L;
  if (display_off_start <= display_off_end) {
    if (display_off_start <= day_seconds && day_seconds <= display_off_end) {
      blackout();
      return;
    }
  } else {
    if (display_off_start <= day_seconds || day_seconds <= display_off_end) {
      blackout();
      return;
    }
  }

  // Show the time or signature!
  unsigned long interval_millis = (timeClient.getEpochTime() % FIVE_MIN) * 1000 + timeClient.getMillis();

  if (current_hour == 1 && timeClient.getMinutes() == 26) {
    for (unsigned long i = 0; i < 5; i++) {
      // TODO: make sure this looks good
      kevin[LETTER_LEDS[6-i][8-i][0]] = CHSV((25*i + interval_millis/16) % 256, 255, led_value);
      kevin[LETTER_LEDS[6-i][8-i][1]] = CHSV((25*i + interval_millis/16) % 256, 255, led_value);
    }

    unsigned long kevin_millis = interval_millis % MILLIS_PER_MINUTE;
    if (kevin_millis < FADE_MILLIS) {
      draw_buffers(before, kevin, kevin_millis / (1.0 * FADE_MILLIS));
    } else if (kevin_millis < MILLIS_PER_MINUTE - FADE_MILLIS) {
      draw_buffer(kevin);
    } else {
      draw_buffers(kevin, before, (kevin_millis + FADE_MILLIS - MILLIS_PER_MINUTE) / (1.0 * FADE_MILLIS));
    }
  } else if (interval_millis < FADE_START) {
    draw_buffer(before);
  } else if (interval_millis < FADE_END) {
    draw_buffers(before, after, (interval_millis - FADE_START)/(1.0*FADE_MILLIS));
  } else {
    draw_buffer(after);
  }
}
