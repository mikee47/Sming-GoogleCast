COMPONENT_SRCDIRS := src proto
COMPONENT_INCDIRS := src

COMPONENT_DEPENDS := \
	ArduinoJson6 \
	nanopb \
	MDNS

# Google Cast requires SSL for communication. Add this to project configuration.
# ENABLE_SSL = Bearssl

GOOGLECAST_PATH := $(COMPONENT_PATH)

##@Building
.PHONY: rebuild-cast-proto

$(GOOGLECAST_PATH)/proto/cast_channel.pb.%: $(GOOGLECAST_PATH)/proto/cast_channel.proto
	echo "BUILD $<"
	$(Q) cd $(dir $<) && $(NANOPB_GENERATE) $(basename $<)

rebuild-cast-proto: $(GOOGLECAST_PATH)/proto/cast_channel.pb.c ##Rebuild the generated C and H files from the google-cast protocol
