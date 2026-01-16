#include "plog/plog.h"

int main() {
    plog::info("Welocme to plog version {}.{}.{}!\n", PLOG_VERSION_MAJOR, PLOG_VERSION_MINOR, PLOG_VERSION_PATCH);
}