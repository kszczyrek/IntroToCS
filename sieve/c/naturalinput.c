#include <ctype.h>
#include <stdbool.h>
#include "naturalinput.h"

bool is_natural(const char string[]) {
    for (int i = 0; string[i] != '\0'; i++) {
        if (!isdigit((unsigned char)string[i])) {
            return false;
        }
    }
    return true;
}