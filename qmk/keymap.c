#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3(
    OSL(4),   KC_ESC,   KC_COMM,  KC_DOT,  KC_P,  KC_Y,               KC_F,  KC_G,  KC_C,  KC_R,  KC_L,  KC_SLSH,
    KC_LALT,  KC_A,     KC_O,     KC_E,    KC_U,  KC_I,               KC_D,  KC_H,  KC_T,  KC_N,  KC_S,  KC_MINS,
    KC_TAB,   KC_SCLN,  KC_Q,     KC_J,    KC_K,  KC_X,               KC_B,  KC_M,  KC_W,  KC_V,  KC_Z,  KC_LGUI,
                                  KC_ENT,KC_SPC,OSM(MOD_LSFT),        KC_LCTL,TO(1),KC_BSPC
  ),
  [1] = LAYOUT_split_3x6_3(
    OSL(4),   KC_ESC,  KC_HOME,  KC_UP,    KC_END,         KC_PGUP,        KC_LBRC,  KC_7,  KC_8,  KC_9,  KC_DOT,   KC_SLSH,
    KC_LALT,  KC_DEL,  KC_LEFT,  KC_DOWN,  KC_RIGHT,       KC_PGDN,        KC_RBRC,  KC_4,  KC_5,  KC_6,  KC_EQL,   KC_MINS,
    KC_TAB,   KC_INS,  KC_F5,    KC_BSLS,  LSFT(KC_QUOT),  KC_QUOT,        KC_0,     KC_1,  KC_2,  KC_3,  KC_COMM,  KC_GRV,
                                      KC_ENT,TO(0),OSM(MOD_LSFT),     KC_LCTL,KC_NO,KC_BSPC
  ),
  [3] = LAYOUT_split_3x6_3(
    OSL(4),  KC_ESC,  KC_F1,  KC_F2,   KC_F3,   KC_F4,                KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,
    KC_LALT, KC_NO,   KC_F5,  KC_F6,   KC_F7,   KC_F8,                KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,
    KC_TAB,  KC_NO,   KC_F9,  KC_F10,  KC_F11,  KC_F12,               KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,
                              KC_ENT,TO(0),OSM(MOD_LSFT),             KC_LCTL,TO(3),KC_BSPC
  ),
  [4] = LAYOUT_split_3x6_3(
    LCTL(KC_C),  LALT(KC_1),  LALT(KC_2),  LALT(KC_3),  LALT(KC_4),    LALT(KC_5),      KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,
    LCTL(KC_V),  LCTL(KC_S),  LCTL(KC_F),  LGUI(KC_E),  LCTL(KC_INS),  KC_NO,           KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,
    LCTL(KC_X),  LCTL(KC_A),  LCTL(KC_R),  LGUI(KC_D),  LSFT(KC_INS),  KC_PSCR,         KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,  KC_NO,
                                           KC_ENT,TO(0),OSM(MOD_LSFT),                  KC_LCTL,TO(3),KC_BSPC
  )
};
